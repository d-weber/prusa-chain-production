import requests
import sys
import time
import json
import serial

# Constants
OCTOPRINT_API_KEY = ''
OCTOPRINT_HOST = ''
OCTOPRINT_PORT = ''
EJECTOR_TTY = '/dev/ttyACM1'
EJECTION_TEMP = 30
COOLING_TIME = 900 # 15Min

# Init
Session = requests.Session()
Session.headers.update({
    'X-Api-Key': OCTOPRINT_API_KEY,
    'Content-Type': 'application/json'
})
BaseAdress = 'http://' + OCTOPRINT_HOST + ':' + str(OCTOPRINT_PORT)
Serial = serial.Serial(EJECTOR_TTY, 9600, timeout=300) # 5 Min timeout

# Test ejector connection
Result = Serial.readline().decode('utf-8').rstrip()
if Result == 'RDY':
    print("Ejector connected")
else:
    raise Exception('Error connecting to ejector')

# Test octoprint connection
Result = Session.get(BaseAdress + '/api/printer')
if Result.status_code != 200:
    raise Exception('Error trying to get printer connection status')
try:
    Status = json.loads(Result.content.decode('utf-8'))["state"]["flags"]["operational"]
    if Status is True:
        print('Printer connected, starting monitoring')
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
            break
        except Exception as exc:
            print(str(exc))
            time.sleep(1)

def postUrl(path, data):
    while True:
        try:
            result = Session.post(BaseAdress + path, json=data)
            if result.status_code != 204:
                raise Exception("Error: {code} - {content}".format(code=result.status_code, content=result.content.decode('utf-8')))

            return result
            break
        except Exception as exc:
            print(str(exc))
            time.sleep(1)

isPrinting = False
isCooling = False
isEjecting = False
isRestarting = False
coolingStart = 0

# Loop
while True:
    # Check for octoprint status:
    Status = getUrl('/api/printer')["state"]["text"]

    if Status == 'Printing':
        if isPrinting is False:
            print("Printer is printing")
            isPrinting = True
    elif Status == 'Operational':
        # Just finished printing
        if isPrinting:
            print("Print finished, cooling for " + str(COOLING_TIME/60) + "min...")
            coolingStart = time.time()
            isPrinting = False
            isCooling = True
            Serial.write(b"FAN ON\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                print("Cooling started")
            else:
                raise Exception('Error trying to connect to ejector')


        # Is waiting for cooling
        elif isCooling:            
            # Just finished cooling
            if time.time() - coolingStart >= COOLING_TIME:
                isCooling = False
                isEjecting = True

        # Do ejection
        elif isEjecting:
            # Ensure printer is in good position:
            postUrl('/api/printer/command', {'commands': ['G1 Y210 Z210']})
            time.sleep(15)

            # Start ejection
            Serial.write(b"EJECT\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'START':
                print("Ejection start")
            else:
                raise Exception('Error trying to connect to ejector')

            # Wait for ejection end
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'END':
                print("Ejection done")
                isEjecting = False
                isRestarting = True
            else:
                raise Exception('Error trying to connect to ejector')
            
            Serial.write(b"FAN OFF\n")
            Result = Serial.readline().decode('utf-8').rstrip()
            if Result == 'DONE':
                print("Cooling stopped")
            else:
                raise Exception('Error trying to connect to ejector')

            postUrl('/api/printer/command', {'commands': ['G1 Z10']})
            time.sleep(15)

        # Restart print
        elif isRestarting:
            postUrl('/api/job', {'command': 'start'})
            print("Print restarted")
            isRestarting = False
            isPrinting = False

    time.sleep(10)