  { config, pkgs, lib, ... }:                                                                                                                                           
  {                                                                                                                                                                     
    # Désactiver systemd-boot car lanzaboote le remplace                                                                                                                
    boot.loader.systemd-boot.enable = lib.mkForce false;                                                                                                                
    boot.loader.efi.canTouchEfiVariables = true;                                                                                                                        
                                                                                                                                                                        
    # Configuration Lanzaboote                                                                                                                                          
    boot.lanzaboote = {                                                                                                                                                 
      enable = true;                                                                                                                                                    
      pkiBundle = "/var/lib/sbctl";                                                                                                                                     
    };                                                                                                                                                                  
                                                                                                                                                                        
    boot.kernel.sysctl = {                                                                                                                                              
      "kernel.unprivileged_userns_clone" = 1;                                                                                                                           
    };                                                                                                                                                                  
                                                                                                                                                                        
    # Ajouter sbctl pour gérer les clés Secure Boot                                                                                                                     
    environment.systemPackages = [ pkgs.sbctl ];                                                                                                                        
                                                                                                                                                                        
    nix.gc = {                                                                                                                                                          
      automatic = true;                                                                                                                                                 
      dates = "weekly";                                                                                                                                                 
      options = "--delete-older-than 30d";                                                                                                                              
    };                                                                                                                                                                  
    nix.settings.auto-optimise-store = true;                                                                                                                            
  }
