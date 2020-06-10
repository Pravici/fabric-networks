#!/bin/bash

function create_channel {
  docker exec cli bash -c "peer channel create -o orderer.example.com:7050 -c $1 -f /etc/hyperledger/configtx/$1.tx"
  # Join peer0.org1.example.com to the channel.
  docker exec cli bash -c "peer channel join -b $1.block"
}

function create_demo_channel {
  create_channel "$1general"
  create_channel "$1issuer"
}

function create_demo_channels {
  create_demo_channel 'demo0'
  create_demo_channel 'demo1'
  create_demo_channel 'demo2'
  create_demo_channel 'demo3'
  create_demo_channel 'demo4'
  create_demo_channel 'demo5'
  create_demo_channel 'demo6'
  create_demo_channel 'demo7'
  create_demo_channel 'demo8'
  create_demo_channel 'demo9'
}

function install_chaincode {
  docker exec cli bash -c "peer chaincode install -n $1 -l node -v $2 -p chaincode"
}

function instantiate_chaincode {
  docker exec cli bash -c "peer chaincode instantiate -o orderer.example.com:7050 -n $1 -v $2 -C $3 -c '{\"Args\":[\"init\"]}'"
}

function upgrade_chaincode {
  docker exec cli bash -c "peer chaincode upgrade -n $1 -l node -v $2 -p chaincode -C $3 -c '{\"Args\":[\"init\"]}' "
}

function install_chaincodes {
  install_chaincode 'tlp-accounts' $1
  install_chaincode 'tlp-loyalty' $1
  install_chaincode 'tlp-rates' $1
}

function instantiate_demo_chaincode {
  instantiate_chaincode 'tlp-accounts' $1 "$2general" 
  instantiate_chaincode 'tlp-loyalty' $1 "$2general" 
  instantiate_chaincode 'tlp-rates' $1 "$2issuer" 
}

function upgrade_demo_chaincode {
  upgrade_chaincode 'tlp-accounts' $1 "$2general" 
  upgrade_chaincode 'tlp-loyalty' $1 "$2general" 
  upgrade_chaincode 'tlp-rates' $1 "$2issuer" 
}

function instantiate_demo_chaincodes {
  instantiate_demo_chaincode $1 'demo0'
  instantiate_demo_chaincode $1 'demo1'
  instantiate_demo_chaincode $1 'demo2'
  instantiate_demo_chaincode $1 'demo3'
  instantiate_demo_chaincode $1 'demo4'
  instantiate_demo_chaincode $1 'demo5'
  instantiate_demo_chaincode $1 'demo6'
  instantiate_demo_chaincode $1 'demo7'
  instantiate_demo_chaincode $1 'demo8'
  instantiate_demo_chaincode $1 'demo9'
}

function upgrade_demo_chaincodes {
  upgrade_demo_chaincode $1 'demo0'
  upgrade_demo_chaincode $1 'demo1'
  upgrade_demo_chaincode $1 'demo2'
  upgrade_demo_chaincode $1 'demo3'
  upgrade_demo_chaincode $1 'demo4'
  upgrade_demo_chaincode $1 'demo5'
  upgrade_demo_chaincode $1 'demo6'
  upgrade_demo_chaincode $1 'demo7'
  upgrade_demo_chaincode $1 'demo8'
  upgrade_demo_chaincode $1 'demo9'
}

function list_channels {
  docker exec cli bash -c "peer channel list"
}

function list_installed_chaincodes {
  docker exec cli bash -c "peer chaincode list --installed"
}

function list_instantiated_chaincodes {
  docker exec cli bash -c "peer chaincode list --instantiated -C $1"
}
