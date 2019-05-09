#!/bin/bash

if [ -z "$1" ]; then echo Error: Please provide name for matlab session as argument! Usage: sh macLaunchOneMatlabSession.sh MATLAB_SESS_XY
fi

SESS_NAME=$1
{
MATLAB_PATH=`cat OpenNFT_venv/matlab_path.cfg`
}||{
echo "matlab_path.cfg config file not found, you have to type in matlab version manually (e.g. MATLAB_R2017b):"
read MATLAB_PATH
}
echo $SESS_NAME

echo $MATLAB_PATH
/Applications/$MATLAB_PATH.app/bin/matlab -nodesktop -r "addpath /Applications/matlab_functions;matlab.engine.shareEngine('$SESS_NAME')"
