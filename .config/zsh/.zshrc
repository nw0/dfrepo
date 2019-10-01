# zshrc
# Run by interactive shells only

source ~/.config/zsh/completion.zsh
source ~/.config/zsh/setopt.zsh
source ~/.config/zsh/constants.zsh
source ~/.config/zsh/bindkeys.zsh
source ~/.config/zsh/auto-ls-gs.zsh


precmd () { print -Pn "\e]2;%n@%M | %~\a"; }

setopt correct
autoload -Uz colors
colors

source ~/.config/zsh/zsh-git-prompt/zshrc.sh
source ~/.config/zsh/nw0.zsh-theme

ttyctl -f
