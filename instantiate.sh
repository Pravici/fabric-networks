#!/bin/bash

# Instantiate chaincode
function instantiate_cc() {
  docker exec cli bash -c "sleep 3s; peer chaincode instantiate -o orderer.example.com:7050 -n $2 -v 1.0 -C $1 -c '{\"Args\":[\"account:init\"]}'"
}

CHANNEL="mychannel"
CC_NAME="tlp"

instantiate_cc 'mychannel' $CC_NAME
instantiate_cc 'demo1' $CC_NAME
instantiate_cc 'demo2' $CC_NAME
instantiate_cc 'demo3' $CC_NAME
