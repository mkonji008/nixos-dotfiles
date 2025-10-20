{ config, pkgs, system, inputs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.graphite-gtk-theme;
      name = "Graphite-Light-Rimless";
    };
    iconTheme = { # <<< This is the corrected placement
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };
  };

  home.pointerCursor = {
    package = pkgs.paper-icon-theme;
    name = "Paper";
    size = 16;
    x11.enable = true;
    gtk.enable = true;
  };

  home.stateVersion = "25.05";
  home.username = "v014";
  home.homeDirectory = "/home/v014";
  home.file.".config/i3".source = ../../config/i3;
  home.file.".config/i3status".source = ../../config/i3status;
  home.packages = with pkgs; [
   
   ## cli utils
    bat
    btop
    cron
    curl
    elinks
    eza
    fzf
    fd
    git
    lazygit
    gnugrep
    htop
    mlocate
    fastfetch
    neovim
    ranger
    ripgrep
    tldr
    tmux
    trash-cli
    w3m
    wget
    xclip
    zoxide
   
   ## required dev lang/tooling/utils
    flatpak
    distrobox
    gnumake
    openssl
    os-prober
    gcc
    libgcc
    cmake
    # clang
    # clang-tools
   
   ## opt dev languages
   # # go
   # air
   # go
   # gopher
   # hugo
   # # rust  
   # cargo
   # rustc
   # rustup
   # # js/ts
   # bun
   # nodePackages.npm
   # nodePackages.nodejs
   # typescript
   # # python
   # python3Full
   # pipx
   # yamllint
   # # miscLang
   # dex
   
   ## devops tooling
   # docker
   # docker-compose
   # terraform-providers.ansible
   # terraform-providers.aws
   # terraform-providers.dns
   # terraform-providers.google
   # terraform-providers.helm
   # terraform-providers.postgresql
   # terraform-providers.utils
   # terraform-providers.vault
   # ansible
   # awscli2
   # github-desktop
   # k3d
   # kargo
   # plumber
   # podman
   # podman-compose
   # podman-tui
   # pods
   # rancher
   # terraform
   # terraform-inventory
   # terraformer

   ## optWork
    slack
    teams-for-linux
    zoom-us
    obs-studio
    
   ## x11 wm odds & ends
    i3lock
    font-manager
    xorg.xkill
    dunst
    arandr
    xdg-desktop-portal-gtk
    networkmanagerapplet
    flameshot
    copyq
    rofi
    galculator
    remmina
    polkit_gnome
   
   # system audio
    noisetorch
    pavucontrol
    pulseaudioFull
   
   ## files and file accessories
    nemo-with-extensions
    filezilla
    p7zip
    bzip3
    gzip
    rar
    unzip
    xarchiver
    xz
    zip
   
   ## media
    cmus
    ffmpeg
    foliate
    mplayer
    strawberry
    vlc
   
   ## media editing
    darktable
    kdePackages.kdenlive
    krita
    pinta
    upscayl
   
   ## download utils
    parabolic
    qbittorrent-enhanced 
   
   ## office
    libreoffice
    obsidian
    tutanota-desktop
    protonmail-desktop
    proton-pass
    zathura
   
   ## networking
    protonvpn-gui
    tailscale
   
   ## browser
    inputs.zen-browser.packages."${system}".default
    brave
    qutebrowser
   
   ## 3d printing
    # cura
   
   ## disk tools
    gencfsm
    dosfstools
    gparted
    psmisc
    rsync
    syncthing
    timeshift-unwrapped
    usbutils
    util-linux
    pciutils
    smbnetfs
    udiskie
    udisks
   
   ## keyboard utils
    qmk
    via
    vial
   
   ## vintage system utils
    kdePackages.k3b #disc burning util
    ufiformat #floppy formatter

  ];
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

