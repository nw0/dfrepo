export PATH=$HOME/.df-local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH

if [ -x "$(which vim)" ]; then
    export EDITOR=vim
else
    export EDITOR=vi
fi
export VISUAL=$EDITOR

export __RVIM="vim -Z --clean '+set noswapfile' '+set nobackup' '+set nowritebackup' '+set viminfo=' '+set clipboard='"
# if there's no rvim, explicit warning
export SUDO_EDITOR="$__RVIM"

export PAGER=less
export LESS="-FR"

export TERM=xterm-256color
export CLICOLOR=1
