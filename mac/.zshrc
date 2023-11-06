export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config/nvim-data

alias ls='lsd'
alias cat='bat'
alias vim='nvim'

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
