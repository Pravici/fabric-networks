#!/bin/bash
set -ev

TARGET_ENV=$1
if [ -z $TARGET_ENV ] 
  then
    echo "usage: ./stop.sh dev|prod"
    exit 1
fi

COMPOSE_FILENAME="docker-compose.$TARGET_ENV.yml"

# Shut down the Docker containers that might be currently running.
docker-compose -f $COMPOSE_FILENAME stop
