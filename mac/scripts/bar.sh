brew tap FelixKratz/formulae
brew tap homebrew/cask-fonts
brew install font-sf-pro
brew install --cask sf-symbols
brew install jq
brew install sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
ln -s ~/.dotfiles/mac/sketchybar sketchybar
chmod +x ~/.config/sketchybar/plugins/*
chmod +x ~/.config/sketchybar/items/*
chmod +x ~/.config/sketchybar/colors.sh
brew services start sketchybar
