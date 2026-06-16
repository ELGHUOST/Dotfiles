{ config, pkgs, ... }:
{
  # ---------------------------
  # SSH
  # ---------------------------
  services.openssh.enable = true;
  # ---------------------------
  # Virtualisation
  # ---------------------------
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package      = pkgs.qemu_kvm;
      runAsRoot    = true;
      swtpm.enable = true;
    };
  };
  programs.virt-manager.enable = true;
  # Tailscale
  services.tailscale.enable = true;
  # ---------------------------
  # Docker
  # ---------------------------
  security.pki.certificateFiles = [
    ./caddy-root.crt
  ];
  virtualisation.docker = {
    enable = true;
  };
  users.users.elghuost.extraGroups = [ "docker" ];
  # ---------------------------
  # Sunshine
  # ---------------------------
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
