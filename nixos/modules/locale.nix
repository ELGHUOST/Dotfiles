{ config, pkgs, ... }:
{
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT    = "fr_FR.UTF-8";
    LC_MONETARY       = "fr_FR.UTF-8";
    LC_NAME           = "fr_FR.UTF-8";
    LC_NUMERIC        = "fr_FR.UTF-8";
    LC_PAPER          = "fr_FR.UTF-8";
    LC_TELEPHONE      = "fr_FR.UTF-8";
    LC_TIME           = "fr_FR.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout  = "fr";
    variant = "";
  };

  console = {
    keyMap = "fr";
    font   = "Lat2-Terminus16";
  };

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
