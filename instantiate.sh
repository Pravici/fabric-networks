#!/bin/bash
set -ev

function instantiate_cc() {
  docker exec cli bash -c "peer chaincode instantiate -o orderer.example.com:7050 -n $2 -v 1.0 -C $1 -c '{\"Args\":[\"init\"]}'"
}

function instantiate_all_cc {
  instantiate_cc $1 'tlp-accounts'
  instantiate_cc $1 'tlp-rates'
  instantiate_cc $1 'tlp-loyalty'
}

function instantiate_both_channels {
  instantiate_all_cc "$1general"
  instantiate_all_cc "$1issuer"
}

instantiate_all_cc 'mychannel'

instantiate_both_channels 'demo0'
instantiate_both_channels 'demo1'
instantiate_both_channels 'demo2'
instantiate_both_channels 'demo3'
instantiate_both_channels 'demo4'
instantiate_both_channels 'demo5'
instantiate_both_channels 'demo6'
instantiate_both_channels 'demo7'
instantiate_both_channels 'demo8'
instantiate_both_channels 'demo9'
