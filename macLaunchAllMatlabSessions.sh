#/bin/bash


PATHSCRIPT=$(pwd)
osascript -e 'tell application "Terminal" to do script "echo main; cd '$PATHSCRIPT'; sh macLaunchOneMatlabSession.sh MATLAB_NFB_MAIN_0001"'
osascript -e 'tell application "Terminal" to do script "echo ptb; cd '$PATHSCRIPT'; sh macLaunchOneMatlabSession.sh MATLAB_NFB_PTB_0001"'
osascript -e 'tell application "Terminal" to do script "echo spm; cd '$PATHSCRIPT'; sh macLaunchOneMatlabSession.sh MATLAB_NFB_SPM_0001"'
osascript -e 'tell application "Terminal" to do script "echo helper; cd '$PATHSCRIPT'; sh macLaunchOneMatlabSession.sh MATLAB_NFB_MODEL_HELPER_0001"'
