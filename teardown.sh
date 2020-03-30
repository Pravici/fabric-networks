#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -e

TARGET_ENV=$1
if [ -z $TARGET_ENV ] 
  then
    echo "usage: ./teardown.sh dev|prod"
    exit 1
fi

COMPOSE_FILENAME="docker-compose.$TARGET_ENV.yml"

# Shut down the Docker containers for the system tests.
docker-compose -f $COMPOSE_FILENAME kill && docker-compose -f $COMPOSE_FILENAME down -v

# remove the local state
rm -f ~/.hfc-key-store/*

# remove chaincode docker images
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)

# Your system is now clean
