{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  # networking.wireless.enable = true;


  networking.networkmanager.enable = true;
  networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
  };
  i18n.inputMethod.fcitx5.addons = [
        pkgs.fcitx5-mozc
        pkgs.fcitx5-gtk
        pkgs.fcitx5-configtool
    ]; 


  nix.settings.download-buffer-size = 524288000;
  
  ## i3 config and other odds and ends needed for it.. 
  services.displayManager.ly. enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
  };

    systemd = { 
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

    xdg.portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };  
   
   security.polkit.enable = true;
   programs.dconf.enable = true;

   environment.variables = {
     GLFW_IM_MODULE = "ibus";
     GDK_SCALE = "1"; # default 1 for FHD
     GDK_DPI_SCALE = "1"; # default 1 for FHD
     JAVA_OPTIONS = "-Dsun.java2d.uiScale=1"; # default 1 for FHD
     QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # default 1 for FHD
     XCURSOR_SIZE = "16"; # default 16 for FHD
   };
   ##i3 stuff end..

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.v014 = {
    isNormalUser = true;
    description = "v014";
    extraGroups = [
      "flatpak"
      "disk"
      "qemu"
      "kvm"
      "libvirtd"
      "sshd"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "root"
      "storage"
    ];
    packages = with pkgs; [
      tree
    ];
  };


  services = {
    flatpak.enable = true;
    dbus.enable = true;
    qemuGuest.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
    };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    curl
    alacritty
    
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  services.udev.packages = with pkgs; [
  vial
  via
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

}
