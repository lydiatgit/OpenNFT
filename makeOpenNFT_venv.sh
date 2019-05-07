#!/bin/bash

# Create virtual environment

ROOTPATH=$(pwd)
VENVNAME=OpenNFT_venv

python -m venv $VENVNAME

source $VENVNAME/bin/activate

MATLAB_PATH=$(find /Applications -type d -maxdepth 1 -name "MATLAB*" | head -n 1)

cd $MATLAB_PATH/extern/engines/python
python setup.py install

cd $ROOTPATH
cd $VENVNAME/bin
pip install -r ../../requirements_mac.txt
