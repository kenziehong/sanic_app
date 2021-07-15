#!/bin/sh

ROOT_PATH=`pwd`
VENDOR_NAME="vendors"
PYTHON="${VENDOR_NAME}/bin/python3"
PIP="${VENDOR_NAME}/bin/pip3"
source ${VENDOR_NAME}/bin/activate

echo "Run HTTP server"
app "$@"