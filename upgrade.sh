#!/bin/bash
set -ev
source functions.sh

NEW_VERSION=$1
if [ -z $NEW_VERSION ]; then
  echo ""
  echo "usage: ./upgrade.sh <version> (example: ./upgrade.sh 1.1)"
  exit 1
fi

install_chaincodes $NEW_VERSION
upgrade_demo_chaincodes $NEW_VERSION

OLD_VERSION=$2
if [ -n "${OLD_VERSION}" ]; then
  teardown_chaincode $OLD_VERSION
fi


