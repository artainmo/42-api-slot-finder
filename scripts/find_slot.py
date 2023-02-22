import os
import sys
import json
import time

if len(sys.argv) != 1:
    print("Wrong number arguments")
    print("Give one argument representing your campus' city")
    exit()

ACCESS_TOKEN = os.getenv('API42_ACCESS_TOKEN')
CAMPUS= sys.argv[1].lower()

match CAMPUS:
    case "brussels":
        CAMPUS = "12"
    case "paris":
        CAMPUS = "1,42"
    case "khouribga":
        CAMPUS = "16"
    case "lyon":
        CAMPUS = "9"
    case "seoul":
        CAMPUS = "29"
    case "tokyo":
        CAMPUS = "26"
    case "moscow":
        CAMPUS = "17"
    case "amman":
        CAMPUS = "35"
    case "adelaide:
        CAMPUS = "36"
    case "malaga":
        CAMPUS = "37"
    case "lisboa":
        CAMPUS = "38"
    case "heilborn":
        CAMPUS = "39"
    case "urduliz":
        CAMPUS = "40"
    case "nice"
        CAMPUS = "41"

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

os.system('zenity --warning --text="SLOT FOUND" --no-wrap') #Notify
#Alarm when slots found
# while 1:
#     print('\a')



class slot_: #Not used slot class, could be used to check when new slots are found by api and thus potentially available
    def __init__(slot):
        self.id = slot['id']
        self.day = int(slot['begin_at'][8:-14])
        self.hour = int(slot['begin_at'][11:-11])
        self.min = int(slot['begin_at'][14:-8])

    def __eq__(slot):
        if self.id == slot.id:
            return True
        return False

    def show(first=False):
        if first == True:
            print("DAY" + "   " + "TIME")
        print(str(self.day) + "   " + str(self.hour) + ":" + str(self.min))
