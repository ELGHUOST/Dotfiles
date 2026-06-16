{ config, pkgs, ... }:
{
  hardware.graphics.enable      = true;
  hardware.graphics.enable32Bit = true;
<<<<<<< HEAD
=======
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open               = true;
    modesetting.enable = true;
    nvidiaSettings     = true;
  };

  # Wayland / Ozone
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Portail pour le partage d'écran sur Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
>>>>>>> ed560c0 (config: waybar, kitty, rofi, quickshell + modules nixos)
}
