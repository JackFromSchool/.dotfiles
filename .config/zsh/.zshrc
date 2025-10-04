# Source
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/vimmode.zsh
source $ZDOTDIR/functions.zsh

# Options
setopt AUTO_CD

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS

# Completions
autoload -U compinit
_comp_options+=(globdots)
compinit
zstyle ':completion:*' menu yes select
bindkey -M menuselect ' ' accept-line
setopt AUTO_MENU

# Plugin Manager
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Prompt
eval "$(oh-my-posh init zsh --config "~/.config/ohmyposh.json")"
eval "$(zoxide init zsh)"

source <(fzf --zsh)

# Vim Mode
bindkey -v
export KEYTIMEOUT=1

