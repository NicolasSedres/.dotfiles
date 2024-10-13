{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

   environment.systemPackages = with pkgs; [
    #nvim and dependencies
	neovim
    fzf
    nodejs
    python3
    unzip
    gnumake
    gcc
    cmake
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
 	vim 
	wget
	os-prober
	kitty
	git
	home-manager
	#audio
	pamixer
	pavucontrol
	#hyprland utils
	wl-clipboard
	cliphist
	waybar
	rofi
	hyprpaper
	swaylock-effects
	#CLI
	starship
	lsd
	bat
	playerctl
    #programming
    clojure
    leiningen
    #others
    discord
   ];
   
  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
  ];
}
