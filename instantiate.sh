#!/bin/bash

CHANNEL="mychannel"
CC_NAME="tlp"
CC_LANG="node"
CC_VERSION="1.0"
CC_PATH="./chaincode"

# Instantiate chaincode
docker exec cli bash -c "sleep 3s; peer chaincode instantiate -o orderer.example.com:7050 -n $CC_NAME -v 1.0 -C $CHANNEL -c '{\"Args\":[\"echo\", \"ping\"]}'"
