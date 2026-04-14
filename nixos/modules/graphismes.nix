{ config, pkgs, ... }:
{
  hardware.graphics.enable      = true;
  hardware.graphics.enable32Bit = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open               = true;
    modesetting.enable = true;
    nvidiaSettings     = true;
  };
}
