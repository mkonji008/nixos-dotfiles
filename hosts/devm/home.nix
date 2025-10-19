{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";
  home.username = "v014";
  home.homeDirectory = "/home/v014";
  home.file.".config/i3".source = ../../config/i3;
  home.file.".config/i3status".source = ../../config/i3status;
  programs.git.enable = true;    
  programs.git = {
      extraConfig = {
        user.name = "mkonji";
        user.email = "mkonji@tuta.io";
        init.defaultBranch = "main";
        };
      };
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
        };
    }; 
}

