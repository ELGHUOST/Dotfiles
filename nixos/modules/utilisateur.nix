{ config, pkgs, ... }:
{
  programs.zsh.enable  = true;
  environment.shells   = with pkgs; [ zsh ];

  users.users.elghuost = {
    isNormalUser = true;
    description  = "ELGHUOST";
    extraGroups  = [ "wheel" "networkmanager" "libvirtd" "kvm" ];
    shell        = pkgs.zsh;
    packages     = with pkgs; [ ];
  };

  environment.variables = {
    GTK_THEME = "Adwaita-dark";
  };
}
