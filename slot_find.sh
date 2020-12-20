ACCESS_TOKEN=$1 #Takes access token as parameter

clear
printf "Project: "
read PROJ

PROJECT="42cursus-$PROJ"

#Verify access token by calling info
INFO_TOKEN=`curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/oauth/token/info"`
SLOTS=`curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/v2/projects/$PROJECT/slots?sort=begin_at"`

#Brussels = Ztime + one hour
python3 data.py $SLOTS $INFO_TOKEN $ACCESS_TOKEN

#Send message once ACCESS_TOKEN ends


#See all projects, slugs and ids
# curl -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/v2/users/artainmo/projects_users"



#Should function like this:
#The /projects/:project_id/slots endpoint will list all the available slots for the given project. These slots can be booked by the current user in order to make a defense.

#Maybe try to access personal find_defense/refresh page and parse that instead!!
