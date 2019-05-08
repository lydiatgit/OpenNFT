#!/bin/bash

if [ -z "$1" ]; then echo Error: Please provide name for matlab session as argument! Usage: sh macLaunchOneMatlabSession.sh MATLAB_SESS_XY
fi

SESS_NAME=$1
MATLAB_PATH=$2
echo $SESS_NAME
# MATLAB_PATH=$(find /Applications -type d -maxdepth 1 -name "MATLAB*" | head -n 1)

echo $MATLAB_PATH/bin/matlab
/Applications/$MATLAB_PATH.app/bin/matlab -nodesktop -r "addpath /Applications/matlab_functions;matlab.engine.shareEngine('$SESS_NAME')"

