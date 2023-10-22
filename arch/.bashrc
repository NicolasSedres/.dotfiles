# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd'
alias cat='bat'
alias grep='grep --color=auto'
alias vim='nvim'
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
