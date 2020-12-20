ACCESS_TOKEN=$1

if [ $# -ne 1 ]; then
    echo "MISSING ACCESS_TOKEN ARGUMENT"
    exit
fi

#See all projects, slugs and ids
curl -H "Authorization: Bearer $ACCESS_TOKEN" "https://api.intra.42.fr/oauth/token/info"
