read -p 'Do you already have a 42 API for us to use? (y/n): ' input
if [ $input = 'y' ]; then
	open 'https://profile.intra.42.fr/oauth/applications'
	sleep 5
else
	printf " We will redirect you to create an API app, for us to access the 42API.\n"
	printf "  App Name: advanced_slot_finder\n"
	printf "  App Redirect URI: https://profile.intra.42.fr\n"
	printf "  The following scope must be set: 'Manage teams, slots and all projects related stuff'\n"
	printf "  All the rest can be left as it is.\n"
	for i in {10..0}; do
    	 printf " In: \033[0;31m%d\033[0m \r" $i #An empty space must sit before \r else prior longer string end will be displayed
  		sleep 1
	done
	printf '\n'
	open "https://profile.intra.42.fr/oauth/applications/new"
	sleep 20
fi

printf "Give us the following information of your 42 API app: \n"
printf "  UID: "
read CLIENT_ID
printf "  SECRET: "
read CLIENT_SECRET
REDIRECT_URI="https%3A%2F%2Fprofile.intra.42.fr"

open "https://api.intra.42.fr/oauth/authorize?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI&response_type=code&scope=projects+public"
printf "After authorizing, in redirected google address bar find authorization code -> code=.....\nPaste code: "
read AUTH_CODE

ACCESS_TOKEN=$(curl -sX POST --data "grant_type=authorization_code&code=$AUTH_CODE&redirect_uri=$REDIRECT_URI&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET" "https://api.intra.42.fr/oauth/token" | jq .access_token | tr -d '"')

if [ $ACCESS_TOKEN = null ]; then
	printf "\e[31mError: You gave invalid API app credentials\e[0m"
else
	printf "\e[32mAPI app access SUCCESS\e[0m\n"
	printf "Launch this command in your shell: export API42_ACCESS_TOKEN=$ACCESS_TOKEN\n"
	printf "(If you are on mac we pasted it in your clipboard already)"
	echo "export API42_ACCESS_TOKEN=$ACCESS_TOKEN" | pbcopy
fi
