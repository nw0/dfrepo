export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="rvim"

export PAGER="less"
export LESS="-R"

export TERM=xterm-256color
export CLICOLOR=1

alias ls='ls -h --color=auto'
alias ll='ls -la'
alias diff='diff --color=auto'
alias grep='egrep'
alias egrep='egrep --color=auto'
alias ssh="TERM=xterm-256color ssh"

alias dfgit='/usr/bin/git --git-dir=$HOME/.dfrepo/ --work-tree=$HOME'
