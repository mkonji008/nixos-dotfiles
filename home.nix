{ config, pkgs, ... }:

{
  home.username = "v014";
  home.homeDirectory = "/home/v014";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
        };
    }; 
  home.file.".config/i3".source = ./config/i3;
}
