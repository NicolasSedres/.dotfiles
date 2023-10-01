sudo pacman -Syu
sudo pacman -S neovim nodejs npm ripgrep fd unzip zip python python-pynvim python-ueberzug zenity docker
sudo npm install -g live-server
curl -s "https://get.sdkman.io" | bash 
source "$HOME/.sdkman/bin/sdkman-init.sh"
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
------------------------TMUX----------------------------------------
sudo pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
under tmux session ctrl a + I
------------------------CLOJURE-SPECIFICS---------------------------
sudo pacman -S clojure leiningen
download zprint from https://github.com/kkinnear/zprint/blob/main/doc/getting/linux.md and put it into PATH
------------------------JAVA-SPECIFICS------------------------------
sdk install java 17.0.8-amzn
download jdtls and put it under nvim config folder, also download lombok.jar and put it under jdtls folder
https://download.eclipse.org/jdtls/milestones/?d
download and compile java-debug under nvim config folder. ./mvnw clean install
https://github.com/microsoft/java-debug
Download and copy to jdtls folder the google format file https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml
-----------------------DOCKER---------------------------------------
in order to work with docker from wsl2 you need to install docker on windows and from the docker desktop go to settings>resource>wsl integration> enable integration with my default wsl distro, enable additional distro.
---------------------------------------------------------------------
command to create a symbolyc link $ln -s ~/.dotfiles/originalfile ~/.config/simboliclink
install any nerdfont
copiar el m2 con todas las configuraciones a /home/user/.m2
----------------------------------ERRORS----------------------------
:TSUpdate
