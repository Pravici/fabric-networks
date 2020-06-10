#!/bin/bash
set -ev
source functions.sh

CC_VERSION=$1
if [ -z $CC_VERSION ] 
  then
    echo ""
    echo "usage: ./upgrade.sh <version> (example: ./upgrade.sh 1.1)"
    exit 1
fi

install_chaincodes $CC_VERSION
upgrade_demo_chaincodes $CC_VERSION
