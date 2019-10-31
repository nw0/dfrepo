# ZSH Theme by Nicholas Sim
# Previously adapted from jreese

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="246"; fi

PROMPT='$(__prompt_current_dir) $(git_super_status)$(__prompt_jobs)$(__prompt_sep) '
RPROMPT='$(__prompt_user)$(__prompt_retcode)'

__prompt_current_dir() {
    echo -n '%K{237}%F{248}%~%f%k'
}

__prompt_jobs() {
    echo -n '%F{green}%(1j.&%j .)%f'
}

__prompt_sep() {
    echo -n '%F{green}%#%f'
}

__prompt_user() {
    echo -n '%F{$NCOLOR}%n@%m%f'
}

__prompt_retcode() {
    echo -n '%(0?..%B%F{red} %?#%f%b)'
}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
