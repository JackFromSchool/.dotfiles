alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gb='git branch'

alias v='nvim'
alias e='nvim'
alias edit='nvim $(fzf)'

alias esp-idf='source /opt/esp-idf/export.sh'

alias pdf='nohup zathura $(rg --files -g "*.pdf" | fzf) > /dev/null 2>&1'

alias wallpaper='matugen image $(ls ~/wallpapers/*.{jpg,png} | fzf)'

alias trun="tmux neww"
alias tnew="tmux new -s"
