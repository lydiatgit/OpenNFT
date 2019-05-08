#/bin/bash

# MATLAB_PATH=$(find /Applications -type d -maxdepth 1 -name "MATLAB*" | head -n 1)
echo "Type in Matlab Version (e.g. MATLAB_R2017b):"
read MATLAB_PATH

PATHSCRIPT=$(pwd)
osascript -e 'tell application "Terminal" to do script "echo main; sh '$PATHSCRIPT'/macLaunchOneMatlabSession.sh MATLAB_NFB_MAIN_0001 '$MATLAB_PATH'"'
osascript -e 'tell application "Terminal" to do script "echo ptb; sh '$PATHSCRIPT'/macLaunchOneMatlabSession.sh MATLAB_NFB_PTB_0001 '$MATLAB_PATH'"'
osascript -e 'tell application "Terminal" to do script "echo spm; sh '$PATHSCRIPT'/macLaunchOneMatlabSession.sh MATLAB_NFB_SPM_0001 '$MATLAB_PATH'"'
osascript -e 'tell application "Terminal" to do script "echo helper; sh '$PATHSCRIPT'/macLaunchOneMatlabSession.sh MATLAB_NFB_MODEL_HELPER_0001 '$MATLAB_PATH'"'
