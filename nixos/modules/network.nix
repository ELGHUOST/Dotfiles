{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.openssh = {
    enable = true;
    ports  = [ 5444 ];
    settings = {
      PasswordAuthentication       = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin              = "no";
      AllowUsers                   = [ "myUser" ];
    };
  };
}
