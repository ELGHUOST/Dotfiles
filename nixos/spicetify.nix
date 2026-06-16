{ pkgs, spicetify-nix }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  hazyTheme = pkgs.fetchFromGitHub {
    owner = "Astromations";
    repo = "Hazy";
    rev = "main";
    sha256 = "sha256-l6fSXNHAX/lZ5Wl3NfINHkZtSVmmIw0tA207MHPoQWc=";
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
        body::before { filter: blur(5px) !important; }
        .NowPlayingView { display: flex !important; visibility: visible !important; opacity: 1 !important; }
        .aside-container { display: flex !important; visibility: visible !important; }
        .encore-text { color: white !important; }
        [class*="lyrics"] { color: white !important; }
        [class*="Lyrics"] { color: white !important; }
        [class*="lyric"] { color: white !important; }
      '';
    };
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      seekSong
      volumePercentage
    ];
  };
}
