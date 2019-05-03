#!/bin/bash

# Create virtual environment

ROOTPATH=$(pwd)
VENVNAME=OpenNFT_venv

python -m venv $VENVNAME

source $VENVNAME/bin/activate

cd /Applications/MATLAB_R2017b.app/extern/engines/python
python setup.py install

cd $ROOTPATH
cd $VENVNAME/bin
pip install -r ../../requirements_mac.txt
