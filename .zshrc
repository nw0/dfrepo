source ~/.config/zsh/completion.zsh
source ~/.config/zsh/setopt.zsh
source ~/.config/zsh/constants.zsh
source ~/.config/zsh/bindkeys.zsh


precmd () { print -Pn "\e]2;%n@%M | %~\a"; }

autoload -Uz colors
colors

GIT_PROMPT_EXECUTABLE="python"
source ~/.config/zsh/zsh-git-prompt/zshrc.sh
source ~/.config/zsh/nw0.zsh-theme

ttyctl -f

auto-ls-gs () {
    if [[ $#BUFFER -eq 0 ]]; then
        if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
            echo "git status"
            git status
        else
            echo "ls"
            ls
        fi;
        zle redisplay
    else
        zle .$WIDGET
    fi;
}
zle -N accept-line auto-ls-gs
zle -N other-widget auto-ls-gs
