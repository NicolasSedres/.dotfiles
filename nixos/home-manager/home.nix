{
  imports = [
    ./bundle.nix
  ];

  home = {
    username = "kenshin";
    homeDirectory = "/home/kenshin";
    stateVersion = "24.05";
  };

  home.file = {
	".config/waybar".source = ./configs/waybar;
  };
}
