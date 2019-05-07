#!/bin/bash

if [ -z "$1" ]; then echo Error: Please provide name for matlab session as argument! Usage: sh macLaunchOneMatlabSession.sh MATLAB_SESS_XY
fi

SESS_NAME=$1
echo $SESS_NAME
MATLAB_PATH=$(find /Applications -type d -maxdepth 1 -name "MATLAB*")

$MATLAB_PATH/bin/matlab -nodesktop -r "addpath /Applications/matlab_functions;matlab.engine.shareEngine('$SESS_NAME')"

