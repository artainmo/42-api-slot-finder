import os
import sys
import json
import time

slots = json.loads(sys.argv[1]) #Set as python dictionary
info_token = json.loads(sys.argv[2])

if info_token["expires_in_seconds"] == '0':
    print("TOKEN EXPIRED REGEN TOKEN")
    print('\a')
    exit()

#Recursively call slot_find until slot is found
if slots == []:
    time.sleep(60);#One minute wait
    os.system("./slot_find " + sys.argv[3])
elif slots == {}:
    print("Wrong project notation")
    exit()

print("DAY" + "   " + "TIME")
day = "-1"
for slot in slots:
    if day != slot['begin_at'][8:-14]:
        print()
    day = slot['begin_at'][8:-14]
    time = slot['begin_at'][11:-8]
    print(day + "   " + time)
print()

#Alarm when slots found
# while 1:
#     print('\a')
