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
  };
  outputs = { nixpkgs, spicetify-nix, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit spicetify-nix; };
      modules = [
        ./configuration.nix
        spicetify-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.elghuost = import ./home.nix;
        }
        ({ pkgs, spicetify-nix, ... }:
          let
            spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
            hazyTheme = pkgs.fetchFromGitHub {
              owner = "Astromations";
              repo = "Hazy";
              rev = "main";
              sha256 = "sha256-jK7xfLfg4gZrmy5XD8Spg4GkE9duzhHZWfyQ0zYL0jA=";
            };
          in {
            programs.spicetify = {
              enable = true;
              theme = {
                name = "Hazy";
                src = hazyTheme;
                injectCss = true;
                replaceColors = true;
                overwriteAssets = true;
                injectThemeJs = true;
                additionalCss = ''
                  body::before {
                    filter: blur(5px) !important;
                  }
                  .NowPlayingView {
                    display: flex !important;
                    visibility: visible !important;
                    opacity: 1 !important;
                  }
                  .aside-container {
                    display: flex !important;
                    visibility: visible !important;
                  }
                  .encore-text {
                    color: white !important;
                  }
                  [class*="lyrics"] {
                    color: white !important;
                  }
                  [class*="Lyrics"] {
                    color: white !important;
                  }
                  [class*="lyric"] {
                    color: white !important;
                  }
                '';
              };
              enabledExtensions = with spicePkgs.extensions; [
                adblock
                seekSong
                volumePercentage
              ];
            };
          })
      ];
    };
  };
}
