  {                                                                                                                                                                     
    description = "NixOS config";                                                                                                                                       
    inputs = {                                                                                                                                                          
      nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";                                                                                                                 
      spicetify-nix = {                                                                                                                                                 
        url = "github:Gerg-L/spicetify-nix";                                                                                                                            
        inputs.nixpkgs.follows = "nixpkgs";                                                                                                                             
      };                                                                                                                                                                
      home-manager = {                                                                                                                                                  
        url = "github:nix-community/home-manager/release-25.11";                                                                                                        
        inputs.nixpkgs.follows = "nixpkgs";                                                                                                                             
      };                                                                                                                                                                
      lanzaboote = {                                                                                                                                                    
        url = "github:nix-community/lanzaboote";                                                                                                                 
        inputs.nixpkgs.follows = "nixpkgs";                                                                                                                             
      };                                                                                                                                                                
    };                                                                                                                                                                  
    outputs = { nixpkgs, spicetify-nix, home-manager, lanzaboote, ... }: {                                                                                              
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {                                                                                                             
        system = "x86_64-linux";                                                                                                                                        
        specialArgs = { inherit spicetify-nix; };                                                                                                                       
        modules = [                                                                                                                                                     
          ./configuration.nix                                                                                                                                           
          spicetify-nix.nixosModules.default                                                                                                                            
          home-manager.nixosModules.home-manager                                                                                                                        
          lanzaboote.nixosModules.lanzaboote                                                                                                                            
          {                                                                                                                                                             
            home-manager.useGlobalPkgs = true;                                                                                                                          
            home-manager.useUserPackages = true;                                                                                                                        
            home-manager.users.elghuost = import ./home.nix;                                                                                                            
          }                                                                                                                                                             
          ({ pkgs, spicetify-nix, ... }: import ./spicetify.nix { inherit pkgs spicetify-nix; })                                                                        
        ];                                                                                                                                                              
      };                                                                                                                                                                
    };                                                                                                                                                                  
  }  
