clear
printf "Login: "
read LOGIN

#See all projects, slugs and ids
curl -H "Authorization: Bearer $API42_ACCESS_TOKEN" -g "https://api.intra.42.fr/v2/users/$LOGIN/projects_users?page[size]=100"
