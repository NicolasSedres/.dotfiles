{
services.hyprpaper = {
	enable = true;
	settings = {
		preload = [
			"~/.dotfiles/nixos/home-manager/resources/gutswall.jpg"
			"~/.dotfiles/nixos/home-manager/resources/falconbandwall.jpg"
		];
		wallpaper = [
			 "DP-1,~/.dotfiles/nixos/home-manager/resources/gutswall.jpg"
			 "HDMI-A-1,contain:~/.dotfiles/nixos/home-manager/resources/falconbandwall.jpg"
		];
	};
};
}
