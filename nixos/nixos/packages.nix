{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

   environment.systemPackages = with pkgs; [
    ntfs3g
    woeusb
    #nvim and dependencies
	neovim
    fzf
    nodejs
    python3
    unzip
    unrar
    gnumake
    gcc
    cmake
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
 	vim 
	wget
	os-prober
	kitty
	git
	home-manager #audio
	pamixer
	pavucontrol
	#hyprland utils
	wl-clipboard
	cliphist
	waybar
	rofi
	hyprpaper
	swaylock-effects
    pipewire #screenshare
    wireplumber #screenshare
    grim #screenshot
    swappy #screenshot
    slurp #select a portion of screen
    dolphin #filemanager
	#CLI
	starship
	lsd
	bat
	playerctl
    htop
    ripgrep
    #programming
    clojure
    leiningen
    #others
    discord
    wowup-cf
    pcsx2
    rpcs3
    lutris
    #sddm
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    ];
   
  fonts.packages = with pkgs; [
  pkgs.nerd-fonts.jetbrains-mono
  pkgs.nerd-fonts.symbols-only
  ];

}
