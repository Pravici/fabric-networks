#!/bin/bash
docker exec cli bash -c "peer chaincode list --instantiated -C $1"
docker exec cli bash -c "peer chaincode list --installed"
