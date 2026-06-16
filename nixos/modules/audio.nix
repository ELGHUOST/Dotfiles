{ config, pkgs, ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable      = true;

  services.pipewire = {
    enable             = true;
    alsa.enable        = true;
    alsa.support32Bit  = true;
    pulse.enable       = true;
    wireplumber.enable = true;
    extraConfig.pipewire = {
      "10-screenshare" = {
        "context.modules" = [
          { name = "libpipewire-module-portal"; }
        ];
      };
    };
  };  # ← ce }; manquait !

  services.printing.enable = true;
}
