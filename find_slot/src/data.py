import os
import sys
import json
import time

if len(sys.argv) != 3:
    print("Wrong number arguments")
    exit()

try:
    slots = json.loads(sys.argv[1]) #Set as python dictionary
except:
    print("TOKEN EXPIRED REGENEATE NEW TOKEN")
    print('\a')
    exit()

#Test for api call error
if slots == {}:
    print("Wrong project notation")
    exit()

#Recursively call slot_find until slot is found
if slots == []:
    time.sleep(60);#One minute wait
    os.system("./slot_find " + sys.argv[2])

print('\a') #Bell for found slot

print("DAY" + "   " + "TIME")
day = "-1"
for slot in slots:
    if day != slot['begin_at'][8:-14]:
        print()
    day = slot['begin_at'][8:-14]
    hour = int(slot['begin_at'][11:-11])
    hour = 0 if hour == 23 else hour + 1; #Set to Brussels time zone -> Brussels = Z + 1
    min = slot['begin_at'][14:-8]
    print(day + "   " + str(hour) + ":" + min)
print()

#Alarm when slots found
# while 1:
#     print('\a')
