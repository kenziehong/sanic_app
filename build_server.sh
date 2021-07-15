#!/bin/sh

ROOT_PATH=`pwd`
VENDOR_NAME="vendors"
PYTHON="${ROOT_PATH}/${VENDOR_NAME}/bin/python3"

install_python3_venv() {
    echo "Create venv"
    OS_TARGET=`uname -s`
	if [ "${OS_TARGET}" == "Linux" ]; then
		# sudo apt update
        sudo apt install -y python3-pip python3-dev
	fi

    cd ${ROOT_PATH}
    python3 -m venv ${VENDOR_NAME}
}

install_requirements() {
	echo "Install pip"
	cd ${ROOT_PATH}
	${PYTHON} -m pip install -r requirements.txt
}

install_setup() {
	echo "Install setup"
	cd ${ROOT_PATH}
	${PYTHON} setup.py install
}

cleanup() {
    echo "Cleanup temp"
	cd ${ROOT_PATH}
	rm -rf ${ROOT_PATH}/build
	rm -rf ${ROOT_PATH}/dist
}

install_python3_venv
source ${VENDOR_NAME}/bin/activate
install_requirements
install_setup
cleanup