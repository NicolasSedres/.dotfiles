sudo pacman -Syu
sudo pacman -S neovim
sudo pacman -S tmux
sudo pacman -S nodejs npm
sudo pacman -S ripgrep
sudo pacman -S unzip zip
sudo pacman -S python
sudo pacman -S python-pynvim
sudo pacman -S python-ueberzug
curl -s "https://get.sdkman.io" | bash 
source "$HOME/.sdkman/bin/sdkman-init.sh"
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
under tmux session ctrl a + I
------------------------JAVA-SPECIFICS------------------------------
sdk install java 17.0.8-amzn
download jdtls and put it under nvim config folder, also download lombok.jar and put it under jdtls folder
https://download.eclipse.org/jdtls/milestones/?d
download and compile java-debug under nvim config folder.
https://github.com/microsoft/java-debug
---------------------------------
command to create a symbolyc link $ln -s ~/.dotfiles/originalfile ~/.config/simboliclink
install any nerdfont
copiar el m2 con todas las configuraciones a /home/user/.m2
----------------------------------ERRORS----------------------------
:TSUpdate
