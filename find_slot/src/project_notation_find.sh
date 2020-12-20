ACCESS_TOKEN=$1

if [ $# -ne 1 ]; then
    echo "MISSING ACCESS_TOKEN ARGUMENT"
    exit
fi

clear
printf "Login: "
read LOGIN

#See all projects, slugs and ids
curl -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/v2/users/$LOGIN/projects_users"
