{ config, pkgs, ... }:
{
  programs.firefox.enable    = true;
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  environment.systemPackages = with pkgs; [
    # -------------------------
    # Terminal / shell
    # -------------------------
    alacritty
    zsh
    kitty
    starship
    fastfetch
    git
    vim
    neovim
    tree
    wget
    claude-code
    # -------------------------
    # DevOps / Cloud
    # -------------------------
    kubectl
    kubernetes-helm
    talhelper
    talosctl
    sops
    age
    cilium-cli
    # -------------------------
    # Lanceur / fichiers
    # -------------------------
    rofi
    wl-clipboard
    kdePackages.dolphin
    xfce.thunar
    vscodium
    rnote
    obsidian
    # -------------------------
    # Bureau Wayland / Hyprland
    # -------------------------
    waybar
    mako
    hyprlock
    quickshell
    # -------------------------
    # Captures d'écran
    # -------------------------
    grim
    slurp
    # -------------------------
    # Audio / luminosité
    # -------------------------
    pavucontrol
    brightnessctl
    playerctl
    cava
    swaynotificationcenter
    alsa-utils
    # -------------------------
    # Communication
    # -------------------------
    pcsx2
    vesktop
    # -------------------------
    # Wallpaper / thème
    # -------------------------
    swww
    pywal
    imagemagick
    jq
    bibata-cursors
    papirus-icon-theme
    qt5.qtgraphicaleffects
    qt6.qt5compat
    # -------------------------
    # Réseau / Bluetooth / Affichage
    # -------------------------
    networkmanager_dmenu
    blueman
    nwg-displays
    qrencode
    # -------------------------
    # Musique
    # -------------------------
    mpd
    mpc
    rmpc
    # -------------------------
    # Médias / images
    # -------------------------
    loupe
    # -------------------------
    # Outils système
    # -------------------------
    unzip
    btop
    p7zip
    # -------------------------
    # Neovim — dépendances LSP
    # -------------------------
    nodejs_22
    pnpm
    nodejs
    ripgrep
    fd
    gcc
    lua-language-server
    nixd
    pyright
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    clang-tools
  ];
}
