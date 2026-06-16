{ pkgs, ... }:
{
  home.username = "elghuost";
  home.homeDirectory = "/home/elghuost";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    KUBECONFIG = "${config.home.homeDirectory}/.kube/config";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true; 
    shellAliases = {
      k = "kubectl";
    };
    initContent = ''
      (cat ~/.cache/wal/sequences &)
      source ~/.cache/wal/colors.sh
      fastfetch
      autoload -U compinit && compinit
      source <(talosctl completion zsh)
      source <(talhelper completion zsh)
      source <(kubectl completion zsh)
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word
      eval "$(starship init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
  };
  
  home.packages = with pkgs; [
    nerd-fonts.blex-mono
    lua-language-server      # lua_ls
    nodePackages.typescript-language-server
    tree-sitter              # compilateur treesitter
    gcc    
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
