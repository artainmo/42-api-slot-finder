jq --version &>/dev/null
if [ $? -ne 0 ]; then
    brew install jq
fi
