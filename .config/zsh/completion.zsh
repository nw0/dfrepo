# The following lines were added by compinstall

zstyle ':completion:*' file-sort name
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
ZCOMPDUMP_DIR=$HOME/.cache/zsh
ZCOMPDUMP_FILE=$ZCOMPDUMP_DIR/zcompdump
if [ ! -d $ZCOMPDUMP_DIR ]; then
    mkdir -p $ZCOMPDUMP_DIR
fi
compinit -d $ZCOMPDUMP_FILE
# End of lines added by compinstall

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

setopt HIST_IGNORE_DUPS
