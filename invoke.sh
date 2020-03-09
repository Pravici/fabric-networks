#!/bin/bash

CHANNEL="mychannel"
CC_NAME="tlp"
CC_LANG="node"
CC_VERSION="1.0"
CC_PATH="./chaincode"

METHOD_NAME=$1
JSON=$2
JSON_ESCAPED="${JSON//\"/\\\"}"
PAYLOAD="{ \"Args\": [\"$METHOD_NAME\", \"$JSON_ESCAPED\"] }"
echo "$PAYLOAD"

docker exec cli peer chaincode invoke -C $CHANNEL -n $CC_NAME -c "$PAYLOAD"
