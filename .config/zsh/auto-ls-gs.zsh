if [ -x "$(command -v exa)" ]; then
    __EXA=1
fi

auto-ls-gs () {
    if [[ $#BUFFER -eq 0 ]]; then
        if [ -z $__PREV_AUTO_GS ] && ([ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1); then
            echo "git status"
            git status
            __PREV_AUTO_GS=1
        elif [ -z $__PREV_AUTO_LS ]; then
            echo "ls"
            ls
            __PREV_AUTO_LS=1
        elif [ "$__PREV_AUTO_LS" -eq "1" ]; then
            if [ -z "$__EXA" ]; then
                echo "ls -al"
                ls -al
            else
                echo "exa -al"
                exa -al
            fi
            __PREV_AUTO_LS=2
        else
            echo ""
        fi;
        zle redisplay
    else
        unset __PREV_AUTO_GS
        unset __PREV_AUTO_LS
        zle .$WIDGET
    fi;
}

zle -N accept-line auto-ls-gs
zle -N other-widget auto-ls-gs
