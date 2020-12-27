# Script to find slots

42API is used to find slots. Slots found by 42API are only potentially available to you making this script not so useful to actually find slots.
This project is an example of how to use the 42API.

### PREPARE

* Python3 installed

* Make env

### USE
Create access-token
```
./generate_access_token.sh
```
Find slots
```
./slot_find ACCESS_TOKEN
```


### OTHER
* Project not found
```
src/project_notation_find.sh ACCESS_TOKEN
```
Find the slug value of your project. The script adds 42cursus- before the input you give.
