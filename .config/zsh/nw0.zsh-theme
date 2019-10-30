# ZSH Theme by Nicholas Sim
# Previously adapted from jreese

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="246"; fi

PROMPT='%K{237}%F{248}%~%f%k $(git_super_status)%F{green}%#%f '
RPROMPT='%F{$NCOLOR}%n@%m%f%(0?..%B%F{red} %?#%f%b)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
