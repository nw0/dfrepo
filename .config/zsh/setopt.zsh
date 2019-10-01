# Lines configured by zsh-newuser-install
unsetopt autocd beep

setopt append_history
__HISTFILE_DIR=$HOME/.local/share/zsh
HISTFILE=$__HISTFILE_DIR/histfile
if [ ! -d "$__HISTFILE_DIR" ]; then
    mkdir -p $__HISTFILE_DIR
fi
setopt HIST_IGNORE_SPACE
HISTSIZE=100000
SAVEHIST=100000

setopt transientrprompt

bindkey -e
# End of lines configured by zsh-newuser-install
