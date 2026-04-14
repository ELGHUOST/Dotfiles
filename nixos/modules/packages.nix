{ config, pkgs, ... }:
{
  programs.firefox.enable    = true;
  nixpkgs.config.allowUnfree = true;
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
    # -------------------------
    # DevOps / Cloud
    # -------------------------
    kubectl
    helm
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
    betterdiscordctl
    vesktop
    kdePackages.kdeconnect-kde
    # -------------------------
    # Gaming
    # -------------------------
    steam
    heroic
    (lutris.override {
      extraLibraries = pkgs: with pkgs; [
        vulkan-loader
        libGL
      ];
      extraPkgs = pkgs: with pkgs; [
        wineWowPackages.staging
        winetricks
        dxvk
      ];
    })
    vulkan-tools
    vulkan-loader
    bottles
    faugus-launcher
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
