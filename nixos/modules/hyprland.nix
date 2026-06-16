{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
    xdg.portal = {                                                                    enable = true;                                                                
    xdgOpenUsePortal = true;                                                      
    extraPortals = with pkgs; [                                                   
      xdg-desktop-portal-hyprland                                                 
      xdg-desktop-portal-gtk                                                      
    ];                                                                            
    config = {                                                                    
      common.default = [ "hyprland" "gtk" ];                                      
      hyprland.default = [ "hyprland" "gtk" ];                                    
    };                                                                            
  };  
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
    ELECTRON_OZONE_PLATFORM_HINT = "auto";                                        
    WLR_DRM_NO_MODIFIERS = "1";                                                   
    LIBVA_DRIVER_NAME = "nvidia";                                                 
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";                                         
    XDPH_NO_EXPLICIT_SYNC = "1";                                                  
    # Fix pour Vesktop screenshare                                                
    XDG_CURRENT_DESKTOP = "Hyprland";                                             
    XDG_SESSION_TYPE = "wayland";                                                 
    XDG_SESSION_DESKTOP = "Hyprland";                                             
  };     
}
