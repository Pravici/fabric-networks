#!/bin/bash
set -ev
source functions.sh

list_installed_chaincodes
if [ ! -z $1 ]; then
  list_instantiated_chaincodes $1
fi
