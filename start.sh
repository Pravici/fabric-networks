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

curl -u "tlpstateuser:ufgVk0IP3Yh4ORJlzaRB4oCiGsPZJ2tb5fy6g4XW90I=" -X PUT http://127.0.0.1:5050/wallet

# Create the channel
function create_channel {
  docker exec cli bash -c "peer channel create -o orderer.example.com:7050 -c $1 -f /etc/hyperledger/configtx/$1.tx"
  # Join peer0.org1.example.com to the channel.
  docker exec cli bash -c "peer channel join -b $1.block"
}

function create_both_channels {
  create_channel "$1general"
  create_channel "$1issuer"
}

create_channel 'mychannel'

create_both_channels 'demo0'
create_both_channels 'demo1'
create_both_channels 'demo2'
create_both_channels 'demo3'
create_both_channels 'demo4'
create_both_channels 'demo5'
create_both_channels 'demo6'
create_both_channels 'demo7'
create_both_channels 'demo8'
create_both_channels 'demo9'

# List channels
docker exec cli bash -c "peer channel list"

CC_LANG="node"
CC_VERSION="1.0"
CC_PATH="chaincode"

# Install chaincode
function install_chaincode {
  docker exec cli bash -c "peer chaincode install -n $1 -l $CC_LANG -v $CC_VERSION --path $CC_PATH"
}

install_chaincode 'tlp-accounts'
install_chaincode 'tlp-rates'
install_chaincode 'tlp-loyalty'

if [ $TARGET_ENV = "prod" ]; then
    ./instantiate.sh
fi
