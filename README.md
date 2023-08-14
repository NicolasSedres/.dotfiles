sudo apt update
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
