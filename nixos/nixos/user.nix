{ pkgs, ... }: {
   users.users.kenshin = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
     ];
   };
}
