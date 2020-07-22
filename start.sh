#!/bin/bash
set -ev
source functions.sh

TARGET_ENV=$1
if [ -z $TARGET_ENV ]; then
    echo "usage: ./start.sh dev|prod"
    exit 1
fi

COMPOSE_FILENAME="docker-compose.$TARGET_ENV.yml"
docker-compose -f $COMPOSE_FILENAME down -v
docker-compose -f $COMPOSE_FILENAME up -d ca.example.com orderer.example.com peer0.org1.example.com couchdb wallet cli

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export HFC_LOGGING='{"debug":"console","info":"console"}'
export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}

curl -u "tlpstateuser:ufgVk0IP3Yh4ORJlzaRB4oCiGsPZJ2tb5fy6g4XW90I=" -X PUT http://127.0.0.1:5051/wallet

create_demo_channels
list_channels
install_chaincodes '1.0'

if [ $TARGET_ENV = "prod" ]; then
    ./instantiate.sh '1.0'
fi
