#!/bin/bash

# Create virtual environment

ROOTPATH=$(pwd)
VENVNAME=OpenNFT_venv

python3.5 -m venv $VENVNAME || python3.6 -m venv $VENVNAME

source $VENVNAME/bin/activate

# MATLAB_PATH=$(find /Applications -type d -maxdepth 1 -name "MATLAB*" | head -n 1)
echo "Type in Matlab Version (e.g. MATLAB_R2017b)"
read MATLAB_PATH

cd /Applications/$MATLAB_PATH.app/extern/engines/python
python3.5 setup.py install || python3.6 setup.py install

cd $ROOTPATH
pip install -r requirements_mac.txt
