CLIENT_ID=1b7cd5bde2fd8c6f6ed5362bbc28843b1885e894dcfe447fbd057d1d3971ab58
REDIRECT_URI=https%3A%2F%2Fgoogle.com
CLIENT_SECRET=57e72b07949f63c860080a342fd19707b65bb07ee05bdd3ea19a0e70fab916eb

open "https://api.intra.42.fr/oauth/authorize?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI&response_type=code&scope=projects+public"

printf "In redirected google address bar find authorization code -> code=.....\nPaste code:\n"
read AUTH_CODE

ACCESS_TOKEN=`curl -s -X POST --data "grant_type=authorization_code&code=$AUTH_CODE&redirect_uri=$REDIRECT_URI&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET" https://api.intra.42.fr/oauth/token | jq .access_token | tr -d '"'` #jq allows to manage the returned json code, here we use jq to only take the access token from the json response

clear
echo "ACCESS_TOKEN:"
echo $ACCESS_TOKEN
