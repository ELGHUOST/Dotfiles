{ config, pkgs, ... }:
{
  # ---------------------------
  # Paperless
  # ---------------------------
  environment.etc."paperless-admin-pass".text = "admin";
  services.paperless = {
    enable       = true;
    passwordFile = "/etc/paperless-admin-pass";
    port         = 28981;
  };

  # ---------------------------
  # PostgreSQL
  # ---------------------------
  services.postgresql = {
    enable          = true;
    ensureDatabases = [ "wiki-js" ];
    ensureUsers     = [{
      name              = "wiki-js";
      ensureDBOwnership = true;
    }];
    settings = {
      listen_addresses = "localhost";
    };
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host  all all 127.0.0.1/32 trust
      host  all all ::1/128      trust
    '';
  };

  # ---------------------------
  # Wiki.js
  # ---------------------------
  systemd.services.wiki-js = {
    requires = [ "postgresql.service" ];
    after    = [ "postgresql.service" ];
  };

  services.wiki-js = {
    enable = true;
    settings = {
      port = 3001;
      db = {
        db   = "wiki-js";
        host = "localhost";
        port = 5432;
        type = "postgres";
        user = "wiki-js";
      };
    };
  };

  #------------------------------
  # GitLab
  #------------------------------
  services.gitlab = {
    enable = true;
    port = 8085;
    databasePasswordFile = pkgs.writeText "dbPassword" "zgvcyfwsxzcwr85l";
    initialRootPasswordFile = pkgs.writeText "rootPassword" "dakqdvp4ovhksxer";
    secrets = {
      secretFile = pkgs.writeText "secret" "Aig5zaic";
      otpFile = pkgs.writeText "otpsecret" "Riew9mue";
      dbFile = pkgs.writeText "dbsecret" "we2quaeZ";
      jwsFile = pkgs.runCommand "oidcKeyBase" {} "${pkgs.openssl}/bin/openssl genrsa 2048 > $out";
      activeRecordPrimaryKeyFile = pkgs.writeText "primaryKey" "aeM9iuf3ieShah4x";
      activeRecordDeterministicKeyFile = pkgs.writeText "deterministicKey" "Ohz4aeSh9eixahVu";
      activeRecordSaltFile = pkgs.writeText "salt" "uThee5ohcheeRaig";  
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    clientMaxBodySize = "50m";
    virtualHosts = {
      "localhost" = {                          # ← clean up the name too
        listen = [{ addr = "0.0.0.0"; }];   # ← this is the fix
        locations."/".proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
      };
    };
  }; 
  
  services.openssh.enable = true;

  systemd.services.gitlab-backup.environment.BACKUP = "dump";

 virtualisation.libvirtd = {
   enable = true;
   qemu = {
     package = pkgs.qemu_kvm;
     runAsRoot = true;
     swtpm.enable = true;
   };
 };

 programs.virt-manager.enable = true;

}
