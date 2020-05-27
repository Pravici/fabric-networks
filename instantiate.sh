#!/bin/bash
set -ev

function instantiate_cc() {
  docker exec cli bash -c "peer chaincode instantiate -o orderer.example.com:7050 -n $2 -v 1.0 -C $1 -c '{\"Args\":[\"init\"]}'"
}

function instantiate_chaincode_for {
  instantiate_cc "$1general" 'tlp-accounts'
  instantiate_cc "$1general" 'tlp-loyalty'
  instantiate_cc "$1issuer" 'tlp-rates'
}

instantiate_cc 'mychannel' 'tlp-accounts'
instantiate_cc 'mychannel' 'tlp-rates'
instantiate_cc 'mychannel' 'tlp-loyalty'

instantiate_chaincode_for 'demo0'
instantiate_chaincode_for 'demo1'
instantiate_chaincode_for 'demo2'
instantiate_chaincode_for 'demo3'
instantiate_chaincode_for 'demo4'
instantiate_chaincode_for 'demo5'
instantiate_chaincode_for 'demo6'
instantiate_chaincode_for 'demo7'
instantiate_chaincode_for 'demo8'
instantiate_chaincode_for 'demo9'
