{
  imports = [
    ./bundle.nix
  ];

 xdg.configFile.nvim.source =  "/home/kenshin/.dotfiles/nvim";

  home = {
    username = "kenshin";
    homeDirectory = "/home/kenshin";
    stateVersion = "24.05";
  };
}
