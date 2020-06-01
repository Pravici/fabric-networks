#!/bin/bash
set -ev

CHANNEL=$1
CC_VERSION=$2
if [ -z $CC_VERSION ] 
  then
    echo "usage: ./upgrade.sh <channel> <version>"
    exit 1
fi

CC_LANG="node"
CC_PATH="chaincode"

# Upgrade chaincode
function upgrade_chaincode {
  docker exec cli bash -c "peer chaincode install -n $1 -l $CC_LANG -v $CC_VERSION -p $CC_PATH"
  docker exec cli bash -c "peer chaincode upgrade -n $1 -l $CC_LANG -v $CC_VERSION -p $CC_PATH -C $CHANNEL -c '{\"Args\":[\"init\"]}' "
}

upgrade_chaincode 'tlp-accounts'
upgrade_chaincode 'tlp-rates'
upgrade_chaincode 'tlp-loyalty'
