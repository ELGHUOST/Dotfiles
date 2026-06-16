{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8080 ];

  networking.interfaces.enp37s0.ipv4.addresses = [{
    address = "192.168.8.197";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.8.1";
  networking.nameservers = [ "192.168.8.100" ];

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
