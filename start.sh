#!/bin/bash
set -ev

TARGET_ENV=$1
if [ -z $TARGET_ENV ] 
  then
    echo "usage: ./start.sh dev|prod"
    exit 1
fi

COMPOSE_FILENAME="docker-compose.$TARGET_ENV.yml"
docker-compose -f $COMPOSE_FILENAME down -v
docker-compose -f $COMPOSE_FILENAME up -d ca.example.com orderer.example.com peer0.org1.example.com couchdb cli

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export HFC_LOGGING='{"debug":"console","info":"console"}'
export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}

ca_local=$( curl -X PUT http://127.0.0.1:5984/wallet )
echo $ca_local

CC_NAME="tlp"
CC_LANG="node"
CC_VERSION="1.0"
CC_PATH="./chaincode"

# Create the channel
function create_channel {
  docker exec cli bash -c "peer channel create -o orderer.example.com:7050 -c $1 -f /etc/hyperledger/configtx/$1.tx"
  # Join peer0.org1.example.com to the channel.
  docker exec cli bash -c "peer channel join -b $1.block"
}

create_channel 'mychannel'
create_channel 'demo1'
create_channel 'demo2'
create_channel 'demo3'
create_channel 'demo4'
create_channel 'demo5'
create_channel 'demo6'
create_channel 'demo7'
create_channel 'demo8'
create_channel 'demo9'

# List channels
docker exec cli bash -c "peer channel list"

# Install chaincode
docker exec cli bash -c "peer chaincode install -n $CC_NAME -l $CC_LANG -v $CC_VERSION --path $CC_PATH"

if [ $TARGET_ENV = "prod" ]; then
    ./instantiate.sh
fi
