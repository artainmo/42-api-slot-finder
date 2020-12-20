ACCESS_TOKEN=$1

if [ $# -ne 1 ]; then
    echo "MISSING ACCESS_TOKEN ARGUMENT"
    exit
fi

clear
printf "Project: "
read PROJ
PROJECT="42cursus-$PROJ" #get slug

SLOTS=`curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/v2/projects/$PROJECT/slots?sort=begin_at"`

python3 src/data.py "$SLOTS" "$ACCESS_TOKEN"



#Should function like this:
#The /projects/:project_id/slots endpoint will list all the available slots for the given project. These slots can be booked by the current user in order to make a defense.
#Maybe try to access personal find_defense/refresh page and parse that instead!!


#For debugging
# INFO_TOKEN=`curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/oauth/token/info"`
