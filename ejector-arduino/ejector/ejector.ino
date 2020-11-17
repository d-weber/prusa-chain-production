#include <TMCStepper.h>
#include <AccelStepper.h>
#define R_SENSE 0.11f
using namespace TMC2130_n;

// Serial commands
#define CMD_UNKNOWN 0
#define CMD_PING    1
#define CMD_HOME    2
#define CMD_END     3
#define CMD_EJECT   4
#define CMD_FAN_ON  5
#define CMD_FAN_OFF 6
#define CMD_LED_ON  7
#define CMD_LED_OFF 8
#define CMD_MOVE_FRONT 9
#define CMD_MOVE_REAR 10

// Motor 1
#define PIN_M1_ENABLE 6
#define PIN_M1_CS 7
#define PIN_M1_STEP 8
#define PIN_M1_DIR 9
TMC2130Stepper driverM1(PIN_M1_CS, R_SENSE);
AccelStepper stepperM1 = AccelStepper(AccelStepper::DRIVER, PIN_M1_STEP, PIN_M1_DIR);

// Motor 2
#define PIN_M2_ENABLE 2
#define PIN_M2_CS 3
#define PIN_M2_STEP 4
#define PIN_M2_DIR 5
TMC2130Stepper driverM2(PIN_M2_CS, R_SENSE);
AccelStepper stepperM2 = AccelStepper(AccelStepper::DRIVER, PIN_M2_STEP, PIN_M2_DIR);

// Other pins
#define PIN_LED 18
#define PIN_FAN 19

// Config
#define MICROSTEP 4
#define MAX_MOVING_TIME 10 // s
#define DEBUG false 
#define STEPS_PER_MM 5
#define STALL_VALUE 6
#define MAX_STALL 100

int maxPos = 280;
long mm2Step(long distance) {
  return  distance * STEPS_PER_MM * MICROSTEP;
}

long step2mm(long step) {
  return step / STEPS_PER_MM / MICROSTEP;
}

void setup() {
  Serial.begin(115200);

  // Fan & leds relays
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_FAN, OUTPUT);
  pinMode(PIN_M1_CS, OUTPUT);
  pinMode(PIN_M2_CS, OUTPUT);

  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB
  }

  // Test relays
  digitalWrite(PIN_FAN, HIGH); 
  delay(1000);
  digitalWrite(PIN_FAN, LOW); 
  delay(500);
  digitalWrite(PIN_LED, HIGH); 
  delay(1000);
  digitalWrite(PIN_LED, LOW);

  // Enable SPI
  SPI.begin();
  pinMode(MISO, INPUT_PULLUP);

  // Init M1
  driverM1.begin();
  driverM1.rms_current(1000);
  driverM1.toff(4);
  driverM1.blank_time(24);
  driverM1.microsteps(MICROSTEP);
  driverM1.TCOOLTHRS(0xFFFFF); // 20bit max
  driverM1.THIGH(0);
  driverM1.semin(5);
  driverM1.semax(2);
  driverM1.sedn(0b01);
  driverM1.sgt(STALL_VALUE);
  driverM1.switchCSpin(LOW);
  stepperM1.setMaxSpeed(100 * MICROSTEP);
  stepperM1.setAcceleration(1000 * MICROSTEP);
  stepperM1.setEnablePin(PIN_M1_ENABLE);
  stepperM1.setPinsInverted(false, false, true);
  stepperM1.disableOutputs();

  // Init M2
  driverM2.begin();
  driverM2.rms_current(1000);
  driverM2.toff(4);
  driverM2.blank_time(24);
  driverM2.microsteps(MICROSTEP);
  driverM2.TCOOLTHRS(0xFFFFF); // 20bit max
  driverM2.THIGH(0);
  driverM2.semin(5);
  driverM2.semax(2);
  driverM2.sedn(0b01);
  driverM2.sgt(STALL_VALUE);
  driverM2.switchCSpin(LOW);
  stepperM2.setMaxSpeed(100 * MICROSTEP);
  stepperM2.setAcceleration(1000 * MICROSTEP);
  stepperM2.setEnablePin(PIN_M2_ENABLE);
  stepperM2.setPinsInverted(false, false, true);
  stepperM2.disableOutputs();
}

int parseStringCommand(String stringCommand) {
    if (stringCommand.equals("PING")) {
      return CMD_PING;
    } else if (stringCommand.equals("MOVE FRONT")) {
      return CMD_MOVE_FRONT;
    } else if (stringCommand.equals("MOVE REAR")) {
      return CMD_MOVE_REAR;
    } else if (stringCommand.equals("HOME")) {
      return CMD_HOME;
    } else if (stringCommand.equals("END")) {
      return CMD_END;
    } else if (stringCommand.equals("EJECT")) {
      return CMD_EJECT;
    } else if (stringCommand.equals("FAN ON")) {
      return CMD_FAN_ON;
    } else if (stringCommand.equals("FAN OFF")) {
      return CMD_FAN_OFF;
    } else if (stringCommand.equals("LED ON")) {
      return CMD_LED_ON;
    } else if (stringCommand.equals("LED OFF")) {
      return CMD_LED_OFF;
    } else {
      return CMD_UNKNOWN  ;
    }
}

int getM1StallValue() {
  DRV_STATUS_t drv_status{0};
  drv_status.sr = driverM1.DRV_STATUS();
  return drv_status.sg_result;
}

int getM2StallValue() {
  DRV_STATUS_t drv_status{0};
  drv_status.sr = driverM2.DRV_STATUS();
  return drv_status.sg_result;
}

long moveTo(long distance, long speed, bool sync = true) {
  stepperM1.setMaxSpeed(speed * MICROSTEP);
  stepperM2.setMaxSpeed(speed * MICROSTEP);
  stepperM1.moveTo(mm2Step(distance));
  stepperM2.moveTo(mm2Step(distance));
  uint32_t startTime = millis();
  uint32_t lastTime = millis();
  uint32_t lastStallCheck = millis();
  while(true) {
    stepperM1.run();
    stepperM2.run();

    if ((millis() - lastStallCheck) > 10) {
      lastStallCheck = millis();
      int M1StallValue = getM1StallValue();
      int M2StallValue = getM2StallValue();

      if ((millis() - startTime) > 100 && (M1StallValue < MAX_STALL || M2StallValue < MAX_STALL)){
        if (M1StallValue < MAX_STALL) {
          if (DEBUG) Serial.print("Stalled M1: ");
          if (DEBUG) Serial.println(M1StallValue, DEC);
          stepperM1.move(0);
          stepperM1.setSpeed(0);
        }
        if (M2StallValue < MAX_STALL) {
          if (DEBUG) Serial.print("Stalled M2: ");
          if (DEBUG) Serial.println(M2StallValue, DEC);
          stepperM2.move(0);
          stepperM2.setSpeed(0);
        }
        if (sync) {
          stepperM1.move(0);
          stepperM2.move(0);
          stepperM1.setSpeed(0);
          stepperM2.setSpeed(0);
        }
        break;
      }
    }

    if (!stepperM1.isRunning() && !stepperM2.isRunning()){
      break;
    }
  }

  long avgPos = (stepperM1.currentPosition() + stepperM2.currentPosition()) / 2;
  return step2mm(avgPos);
}

void eject() {
  stepperM1.enableOutputs();
  stepperM2.enableOutputs();

  // Deploy arm
  int pos = moveTo(70, 100);
  int i = 0;
  int speeds[] = {600, 500, 400, 300, 200};

  while (pos < maxPos * 0.95) {
    stepperM1.move(0);
    stepperM2.move(0);
    stepperM1.setSpeed(0);
    stepperM2.setSpeed(0);

    delay(500);
    moveTo(70, 500);
    delay(500);

    pos = moveTo(maxPos, speeds[i]);
    i++;
    if (i > 4) {
      i = 0;
    }
  }
  while (pos > 75) {
    pos  = moveTo(70, 500);
  }
  while (pos > 5) {
    pos  = moveTo(0, 100);
  }
  
  stepperM1.disableOutputs();
  stepperM2.disableOutputs();
}

void loop() {
  if (Serial.available() > 0) {
    String stringCommand = Serial.readStringUntil('\n');
    int command = parseStringCommand(stringCommand);
    switch (command) {
      case CMD_PING:
        Serial.println("PONG");
        break;
      case CMD_END:
        Serial.println("START");
        Serial.println("END");
        break;
      case CMD_EJECT:
        Serial.println("START");
        eject();
        Serial.println("END");
        break;
      case CMD_FAN_ON:
        digitalWrite(PIN_FAN, HIGH); 
        Serial.println("DONE");
        break;
      case CMD_FAN_OFF:
        digitalWrite(PIN_FAN, LOW); 
        Serial.println("DONE");
        break;
      case CMD_LED_ON:
        digitalWrite(PIN_LED, HIGH); 
        Serial.println("DONE");
        break;
      case CMD_LED_OFF:
        digitalWrite(PIN_LED, LOW); 
        Serial.println("DONE");
        break;
      default:
      case CMD_UNKNOWN:
        Serial.println("UNKNOWN COMMAND");
    }
  }
}