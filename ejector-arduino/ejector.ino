#include <AccelStepper.h>

#define MOTOR_INTERFACE_TYPE 1 // A4988

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

// Left stepper motor
#define PIN_STEPPER_LEFT_ENABLE 2
#define PIN_STEPPER_LEFT_STEP 3
#define PIN_STEPPER_LEFT_DIR 4

// Right stepper motor
#define PIN_STEPPER_RIGHT_ENABLE 5
#define PIN_STEPPER_RIGHT_STEP 6
#define PIN_STEPPER_RIGHT_DIR 7

// Endstops
#define PIN_ES_LEFT_START 15
#define PIN_ES_LEFT_END 14
#define PIN_ES_RIGHT_START 10
#define PIN_ES_RIGHT_END 16

// Other pins
#define PIN_LED 8
#define PIN_FAN 9

// Config
#define MICROSTEP 4
#define MAX_MOVING_TIME 10 // s
#define DEBUG true

// Define steppers
AccelStepper leftStepper = AccelStepper(MOTOR_INTERFACE_TYPE, PIN_STEPPER_LEFT_STEP, PIN_STEPPER_LEFT_DIR);
AccelStepper rightStepper = AccelStepper(MOTOR_INTERFACE_TYPE, PIN_STEPPER_RIGHT_STEP, PIN_STEPPER_RIGHT_DIR);

void setup() {
  Serial.begin(9600);
  
  leftStepper.setEnablePin(PIN_STEPPER_LEFT_ENABLE);
  rightStepper.setEnablePin(PIN_STEPPER_RIGHT_ENABLE);
  
  leftStepper.setPinsInverted(false, false, true);
  rightStepper.setPinsInverted(false, false, true);
    
  leftStepper.setAcceleration(2000);
  rightStepper.setAcceleration(2000);

  // Endstops
  pinMode(PIN_ES_LEFT_START, INPUT);
  pinMode(PIN_ES_LEFT_END, INPUT);
  pinMode(PIN_ES_RIGHT_START, INPUT);
  pinMode(PIN_ES_RIGHT_END, INPUT);

  // Fan & leds relays
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_FAN, OUTPUT);
  
  digitalWrite(PIN_LED, LOW); 
  digitalWrite(PIN_FAN, LOW); 

  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB
  }
  
  Serial.println("READY");
}

void moveSteppers(long steps, long speed) {
  leftStepper.enableOutputs();
  rightStepper.enableOutputs();

  long microstepSpeed = MICROSTEP * speed;
  long microstepSteps = MICROSTEP * steps;

  leftStepper.setMaxSpeed(microstepSpeed);
  rightStepper.setMaxSpeed(microstepSpeed);
  
  leftStepper.move(microstepSteps);
  rightStepper.move(microstepSteps);
}

void move(long distance, long speed) {
  if (distance == 0 || speed == 0) {
    return;
  }
  
  bool direction = distance > 0;
  int leftEnstopPin = direction ? PIN_ES_LEFT_END : PIN_ES_LEFT_START;
  int rightEndstopPin = direction ? PIN_ES_RIGHT_END : PIN_ES_RIGHT_START;
  
  long microstepSpeed = MICROSTEP * speed;
  long microstepSteps = MICROSTEP * distance;

  leftStepper.enableOutputs();
  rightStepper.enableOutputs();

  leftStepper.setMaxSpeed(microstepSpeed);
  rightStepper.setMaxSpeed(microstepSpeed);
  
  leftStepper.move(microstepSteps);
  rightStepper.move(microstepSteps);

  long start = millis();
  int leftEndstopTriggered = 0;
  int rightEndstopTriggered = 0;
  bool leftMotorStopped = false;
  bool rightMotorStopped = false;
    
  // We'll try to reach the start endstop during MAX_MOVING_TIMEs max
  while ((millis() - start) < (MAX_MOVING_TIME * 1000)) {
    bool leftEndstop = digitalRead(leftEnstopPin);
    bool rightEndstop = digitalRead(rightEndstopPin);

    // Filter false positives
    if (leftEndstop) {
      leftEndstopTriggered++;
    } else if (leftEndstopTriggered <= 2){
      leftEndstopTriggered = 0;
    }
    
    if (rightEndstop) {
      rightEndstopTriggered++;
    } else if (rightEndstopTriggered <= 2){
      rightEndstopTriggered = 0;
    }
    
    if (leftEndstopTriggered > 2 && !leftMotorStopped) {
        if (DEBUG) {
          Serial.print("Left endstop triggered at: ");
          Serial.println(leftStepper.currentPosition());
        }

        leftMotorStopped = true;
        leftStepper.stop();
        leftStepper.setCurrentPosition(0);
    }

    if (rightEndstopTriggered > 2 && !rightMotorStopped) {
        if (DEBUG) {
          Serial.print("Right endstop triggered at: ");
          Serial.println(rightStepper.currentPosition());
        }
        
        rightMotorStopped = true;
        rightStepper.stop();
        rightStepper.setCurrentPosition(0);
    }

    if (leftEndstopTriggered > 2 && rightEndstopTriggered > 2) {
        if (DEBUG) {
          Serial.println("Both endstop triggered");
        }
        break;
    }

    if (!leftStepper.isRunning() && !rightStepper.isRunning()){
      if (DEBUG) {
        Serial.println("Move finished");
      }
      break;
    }
    
    leftStepper.run();
    rightStepper.run();
  }
  
  leftStepper.disableOutputs();
  rightStepper.disableOutputs();
}

int parseStringCommand(String stringCommand) {
    if (stringCommand.equals("PING")) {
      return CMD_PING;
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

void loop() {
  if (Serial.available() > 0) {
    String stringCommand = Serial.readStringUntil('\n');
    int command = parseStringCommand(stringCommand);

    switch (command) {
      case CMD_PING:
        Serial.println("PONG");
        break;
        
      case CMD_HOME:
        Serial.println("START");
        move(-5000, 250);
        Serial.println("END");
        break;
        
      case CMD_END:
        Serial.println("START");
        move(5000, 250);
        Serial.println("END");
        break;
        
      case CMD_EJECT:
        Serial.println("START");
        move(300, 100);
        move(1200, 400);
        move(-1400, 250);
        Serial.println("END");
        break;
        
      case CMD_FAN_ON:
        digitalWrite(PIN_FAN, HIGH); 
        Serial.println("DONE");
        break;
        
      case CMD_FAN_OFF:
        digitalWrite(PIN_LED, LOW); 
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