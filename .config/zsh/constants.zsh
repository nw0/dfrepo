export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="rvim"

export PAGER="less"
export LESS="-R"

export TERM=xterm-256color
export CLICOLOR=1

alias ls='ls -h --color=auto'
alias la='ls -a'
alias ll='ls -la'
if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar --color=auto"
fi
alias grep='egrep'
alias egrep='egrep --color=auto'
alias ssh="TERM=xterm-256color ssh"

alias dfgit='/usr/bin/git --git-dir=$HOME/.dfrepo/ --work-tree=$HOME'
