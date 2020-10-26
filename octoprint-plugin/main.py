import requests
import sys
import time
import datetime
import json
import serial

# Constants
OCTOPRINT_API_KEY = ''
OCTOPRINT_HOST = 'localhost'
OCTOPRINT_PORT = '80'
EJECTOR_TTY = '/dev/ttyACM1'
EJECTION_TEMP = 30
COOLING_TIME = 900 # 15Min
AUTO_RESTART = False

# Printer status
STATUS_IDLE = 0
STATUS_PRINTING = 1
STATUS_COOLING = 2
STATUS_EJECTING = 3
STATUS_RESTARTING = 4

def log(text):
    print(datetime.datetime.now().strftime('%b %d %H:%M:%S ') + text)

log('Initalizing')

# Init
Session = requests.Session()
Session.headers.update({
    'X-Api-Key': OCTOPRINT_API_KEY,
    'Content-Type': 'application/json'
})
BaseAdress = 'http://' + OCTOPRINT_HOST + ':' + str(OCTOPRINT_PORT)
Serial = serial.Serial(EJECTOR_TTY, 9600, timeout=500) # 1s timeout

# Let time to the extrude to initialize
time.sleep(10)

# Test ejector connection
Serial.write(b"PING\n")
if Serial.readline().decode('utf-8').rstrip() == 'PONG':
    log("Ejector connected")
else:
    raise Exception('Error connecting to ejector')

# Test octoprint connection
Result = Session.get(BaseAdress + '/api/printer')
if Result.status_code != 200:
    raise Exception('Error trying to get printer connection status')
try:
    Status = json.loads(Result.content.decode('utf-8'))["state"]["flags"]["operational"]  
    if Status is True:
        log('Printer connected, starting monitoring')
    else:
        raise Exception('Error trying to get printer connection status')
except:
    raise Exception('Error trying to get printer connection status')

def getUrl(path):
    while True:
        try:
            Result = Session.get(BaseAdress + path)

            if Result.status_code != 200:
                raise Exception("Error: {code} - {content}".format(code=Result.status_code, content=Result.content.decode('utf-8')))

            return json.loads(Result.content.decode('utf-8'))
        except Exception as exc:
            log(str(exc))
            time.sleep(1)

def postUrl(path, data):
    while True:
        try:
            result = Session.post(BaseAdress + path, json=data)
            if result.status_code != 204:
                raise Exception("Error: {code} - {content}".format(code=result.status_code, content=result.content.decode('utf-8')))

            return result
        except Exception as exc:
            log(str(exc))
            time.sleep(1)

printerStatus = STATUS_IDLE
coolingStart = 0

# Desactivate everything
Serial.write(b"LED OFF\n")
Result = Serial.readline().decode('utf-8').rstrip()
if Result == 'DONE':
    log("Led off")
else:
    log('Wrong result:' + Result)
    raise Exception('Error trying to stop leds')

Serial.write(b"FAN OFF\n")
Result = Serial.readline().decode('utf-8').rstrip()
if Result == 'DONE':
    log("Fan off")
else:
    log('Wrong result:' + Result)
    raise Exception('Error trying to stop cooling')

# Loop
while True:
    # Check for octoprint status:
    Status = getUrl('/api/printer')["state"]["text"]

    if Status == 'Printing':
        if printerStatus is not STATUS_PRINTING:
            log("Printer is printing")

            Serial.write(b"FAN OFF\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                log("Fan off")
            else:
                log('Wrong result:' + Result)
                raise Exception('Error trying to stop cooling')

            Serial.write(b"LED ON\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                log("Led on")
            else:
                log('Wrong result:' + Result)
                raise Exception('Error trying to start leds')
            printerStatus = STATUS_PRINTING
    elif Status == 'Operational':
        # Just finished printing
        if printerStatus is STATUS_PRINTING:
            log("Print finished, cooling for " + str(COOLING_TIME/60) + "min...")
            coolingStart = time.time()
            Serial.write(b"LED OFF\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                log("Led off")
            else:
                log('Wrong result:' + Result)
                raise Exception('Error trying to stop leds')
            Serial.write(b"FAN ON\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                log("Cooling started")
            else:
                log('Wrong result:' + Result)
                raise Exception('Error trying to start cooling')

            # Ensure printer is in good position:
            postUrl('/api/printer/command', {'commands': ['G1 X125 Y170']})
            postUrl('/api/printer/command', {'commands': ['G1 Z210']})

            printerStatus = STATUS_COOLING

        # Is waiting for cooling
        elif printerStatus is STATUS_COOLING:
            # Just finished cooling
            if time.time() - coolingStart >= COOLING_TIME:
                Serial.write(b"FAN OFF\n")
                Result = Serial.readline().decode('utf-8').rstrip()
                if Result == 'DONE':
                    log("Fan off")
                else:
                    log('Wrong result:' + Result)
                    raise Exception('Error trying to stop cooling')

                printerStatus = STATUS_EJECTING

        # Do ejection
        elif printerStatus is STATUS_EJECTING:
            Serial.write(b"LED ON\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                log("Led on")
            else:
                raise Exception('Error trying to connect to ejector')

            # Ensure printer is in good position:
            postUrl('/api/printer/command', {'commands': ['G1 X125 Y210']})
            postUrl('/api/printer/command', {'commands': ['G1 Z210']})
            time.sleep(15)

            # Start ejection
            Serial.write(b"EJECT\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'START':
                log("Ejection start")
            else:
                log('Wrong result:' + Result)
                raise Exception('Error trying to start ejection')

            # Wait for ejection to end
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'END':
                log("Ejection done")
            else:
                log('Wrong result:' + Result)
                raise Exception('Error waiting for ejection end')

            postUrl('/api/printer/command', {'commands': ['G1 Z10']})

            if AUTO_RESTART:
                printerStatus = STATUS_RESTARTING
            else:
                printerStatus = STATUS_IDLE

        # Restart print
        elif printerStatus is STATUS_RESTARTING:
            postUrl('/api/job', {'command': 'start'})
            log("Print restarted")
            printerStatus = STATUS_IDLE

        else:
            # Desactivate everything
            Serial.write(b"LED OFF\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result != 'DONE':
                log('Wrong result:' + Result)
                raise Exception('Error trying to stop leds')

            Serial.write(b"FAN OFF\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result != 'DONE':
                log('Wrong result:' + Result)
                raise Exception('Error trying to stop cooling')

    time.sleep(10)