#/bin/bash
  
PATHSCRIPT=$(pwd)
osascript -e 'tell application "Terminal" to do script "echo main; sh '$PATHSCRIPT'/test2.sh MATLAB_NFB_MAIN_0001"'
osascript -e 'tell application "Terminal" to do script "echo ptb; sh '$PATHSCRIPT'/test2.sh MATLAB_NFB_PTB_0001"'
osascript -e 'tell application "Terminal" to do script "echo spm; sh '$PATHSCRIPT'/test2.sh MATLAB_NFB_SPM_0001"'
osascript -e 'tell application "Terminal" to do script "echo helper; sh '$PATHSCRIPT'/test2.sh MATLAB_NFB_MODEL_HELPER_0001"'
