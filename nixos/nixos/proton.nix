{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonup
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
