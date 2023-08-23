#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# Function to update the PS1 prompt
update_ps1_prompt() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)
        if [ -n "$GIT_BRANCH" ]; then
          if git diff --quiet; then
             PS1='\[\e[9;48;5;88m\]人斬り\e[0m\[\e[97;48;5;88m\]👹\e[0m\[\e[38;5;88;107m\]\[\e[38;5;88;107m\] \w\[\e[97;48;5;34m\]\[\e[48;5;34m\]  ($GIT_BRANCH)\[\e[0;38;5;34m\] \[\e[0m\]'           
          else
             PS1='\[\e[9;48;5;88m\]人斬り\e[0m\[\e[97;48;5;88m\]👹\e[0m\[\e[38;5;88;107m\]\[\e[38;5;88;107m\] \w\[\e[97;48;5;214m\]\[\e[97;48;5;214m\]  ($GIT_BRANCH)\[\e[0;38;5;214m\] \[\e[0m\]'
          fi
        else
          PS1='\[\e[9;48;5;88m\]人斬り\e[0m\[\e[97;48;5;88m\]👹\e[0m\[\e[38;5;88;107m\]\[\e[38;5;88;107m\] \w\[\e[0;97m\] \[\e[0m\]'
        fi
    else
      PS1='\[\e[9;48;5;88m\]人斬り\e[0m\[\e[97;48;5;88m\]👹\e[0m\[\e[38;5;88;107m\]\[\e[38;5;88;107m\] \w\[\e[0;97m\] \[\e[0m\]'
    fi
}
cd() {
    builtin cd "$@"
    update_ps1_prompt
}
git() {
    if [[ $1 == "checkout" ]]; then
        shift
        command git checkout "$@"
        update_ps1_prompt
    elif [[ $1 == "status" ]]; then
        shift
        command git status "$@"
        update_ps1_prompt
    else
        command git "$@"
    fi
}

update_ps1_prompt
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
alias wsl2ip="ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias vim='nvim'
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config/nvim-data
alias tlog='less ../logs/catalina.out'
alias rmtlog='rm ../logs/*'
function tssh() {
  ssh -i /data/servers/ppk/devops-iac-cf.pem ec2-user@"$1"
}
function tscp() {
  scp -i /data/servers/ppk/devops-iac-cf.pem ec2-user@"$1":"$2" "$3"
}

function tunneltssh() {
  ssh -i /data/servers/ppk/devops-iac-cf.pem -L 5005:localhost:5005 ec2-user@"$1"
}
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
