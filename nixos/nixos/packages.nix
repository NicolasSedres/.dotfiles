{ pkgs, ... }: {
   environment.systemPackages = with pkgs; [
 	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	neovim
	wget
	os-prober
	kitty
	git
	home-manager
	#hyprland utils
	wl-clipboard
	cliphist
	waybar
	rofi
   ];
   
  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
  ];
}
