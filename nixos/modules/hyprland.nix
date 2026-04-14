{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.portal.enable      = true;
  security.polkit.enable = true;

  services.displayManager.sddm.enable = false;

  services.displayManager.ly = {
    enable     = true;
    x11Support = true;
    settings = {
      animation = 1;
    };
  };

  environment.variables = {
    GTK_THEME = "Adwaita-dark";
  };
}
