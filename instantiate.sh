#!/bin/bash
set -ev
source functions.sh

CC_VERSION=$1
if [ -z $CC_VERSION ] 
  then
    echo "usage: ./instantiate.sh <version>"
    exit 1
fi

instantiate_demo_chaincodes $CC_VERSION
