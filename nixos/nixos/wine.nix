{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable  # 32-bit and 64-bit support
    winetricks              # Helper for installing libraries
  ];
}
