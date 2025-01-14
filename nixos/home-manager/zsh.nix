{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/.dotfiles/nixos";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update --flake ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";

      conf = "nvim ${flakeDir}/nixos/configuration.nix";
      pkgs = "nvim ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";
      ls = "lsd";
      cat = "bat";
      grep = "grep --color=auto";
      vim = "nvim";
      se = "sudoedit";
      ff = "fastfetch";
      cdnix = "cd ~/.dotfiles/nixos";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
