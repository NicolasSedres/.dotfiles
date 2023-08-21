sudo apt install build-essential
sudo apt install ripgrep
---------------------------------
install any nerdfont
install jdkman to manage multiple java versions.
copiar el m2 con todas las configuraciones a /home/user/.m2
install zip
install node
--------------------------------
---ADD TO ~/.bashrc---
alias vim='nvim'
alias wsl2ip="ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
export PATH="/usr/lib/jvm/jdk17/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/snap/bin"
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config/nvim-data
# export PATH="/usr/lib/jvm/jdk17/bin:$PATH"
# export JAVA_HOME="/usr/lib/jvm/jdk8"
export M2_HOME="/usr/share/maven/mvn/apache-maven-3.3.9"
export PATH=$M2_HOME/bin:$PATH
--------------------------------------
download and compile java-debug and vscode-java-test.
--------------------------------------
# ----------------------------CUSTOM-PROMPT---paste-this-on-bashrc---------------------------------------------------------------
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
# -------------------------------------------------------------------------------------------------------
----------------------------------ERRORS----------------------------
:TSUpdate
