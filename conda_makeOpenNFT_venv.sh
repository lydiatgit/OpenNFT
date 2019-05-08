#!/bin/bash

VENVNAME=OpenNFT_venv
ROOTPATH=$(pwd)

conda create -n $VENVNAME python=3.5 || conda create -n $VENVNAME python=3.6
source activate $VENVNAME

# Connect to Matlab engine:
MATLAB_PATH=$(find /Applications -type d -maxdepth 1 -name "MATLAB*" | head -n 1)

cd $MATLAB_PATH/extern/engines/python
python3.5 setup.py install || python3.6 setup.py install

cd $ROOTPATH
conda install -c anaconda pyqtgraph
conda install pip
pip install -r requirements_mac.txt
