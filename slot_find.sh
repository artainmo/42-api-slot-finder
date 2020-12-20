ACCESS_TOKEN=$1
PROJECT=42cursus-libft

#Brussels = Ztime + one hour
python3 data.py `curl -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/v2/projects/$PROJECT/slots?sort=begin_at"`


#Maybe try to access personal find_defense/refresh page and parse that instead!!

#Info about token
# curl -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/oauth/token/info"

#See all projects, slugs and ids
# curl -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/v2/users/artainmo/projects_users"


#Should function like this:
#The /projects/:project_id/slots endpoint will list all the available slots for the given project. Theses slots can be booked by the current user in order to make a defense.
