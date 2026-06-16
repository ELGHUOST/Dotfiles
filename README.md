<div align="center">

# ❄️ Dotfiles — NixOS + Hyprland

*Une config NixOS reproductible, riced autour de Hyprland et d'un shell de bureau maison écrit en QML (Quickshell).*

![NixOS](https://img.shields.io/badge/NixOS-25.11_Xantusia-5277C3?style=flat-square&logo=nixos&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-0.52.1-58E1FF?style=flat-square)
![Wayland](https://img.shields.io/badge/Wayland-FFBB00?style=flat-square)
![Home Manager](https://img.shields.io/badge/Home_Manager-flakes-blue?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)

</div>

---

## 📸 Aperçu

> Ajoute tes captures dans `assets/screenshots/` et remplace les liens ci-dessous.

| Forest | Sky |
|--------|-----|
| ![forest](assets/screenshots/forest.png) | ![sky](assets/screenshots/sky.png) |

| City | Launcher |
|------|----------|
| ![city](assets/screenshots/city.png) | ![launcher](assets/screenshots/launcher.png) |

Toute l'interface (barre, sidebar, launcher, visualiseur) se **recolore dynamiquement** en fonction du wallpaper sélectionné.

---

## 🧩 Le setup

| Composant | Outil | Rôle |
|-----------|-------|------|
| **OS** | [NixOS 25.11](https://nixos.org/) (Xantusia) | Distribution déclarative, config gérée par flake |
| **Gestion utilisateur** | [Home Manager](https://github.com/nix-community/home-manager) | Dotfiles et programmes utilisateur en Nix |
| **Compositeur** | [Hyprland](https://hyprland.org/) 0.52.1 | Compositeur Wayland tuilant, animations |
| **Shell de bureau** | [Quickshell](https://quickshell.outfoxxed.me/) | Barre, sidebar, launcher, panneaux — écrits en **QML** |
| **Barre (alt.)** | [Waybar](https://github.com/Alexays/Waybar) | Barre de statut secondaire |
| **Launcher** | [Rofi](https://github.com/davatorium/rofi) (wayland) | Lanceur d'apps et sélecteur de wallpapers |
| **Terminal** | [kitty](https://sw.kovidgoyal.net/kitty/) 0.44 · [Alacritty](https://alacritty.org/) | Émulateurs de terminal |
| **Shell** | [zsh](https://www.zsh.org/) 5.9 | Avec un prompt à la Starship / p10k |
| **Fetch** | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | Config custom aux labels latins (*Systema, Nucleus…*) |
| **Spotify** | [spicetify](https://spicetify.app/) | Thème custom raccordé à la palette |
| **Moniteur** | [btop++](https://github.com/aristocratos/btop) | Monitoring système |

---

## ✨ Ce qui est fait maison

### Le shell Quickshell (`home/quickshell/`)
Tout le HUD est écrit en QML plutôt qu'avec un bar classique :

- **`Bar.qml`** — la barre supérieure (workspaces, horloge, tray).
- **`Dashboard.qml`** — la sidebar de droite : profil utilisateur, boutons power, batterie, jauges **CPU / RAM / DISK**, horloge, sliders volume + luminosité.
- **`LauncherPanel.qml`** — le launcher à onglets **Apps / Walls** : recherche d'applications *et* navigateur de wallpapers avec aperçus.
- **`MusicPanel.qml`** — le lecteur "Now Playing" + le **visualiseur audio** (barres réactives au son).
- **`WifiPanel.qml`** / **`BluetoothPanel.qml`** — gestion réseau et Bluetooth dans la sidebar.
- **Mascotte animée** — le personnage pixel-art (les `.gif` dans `assets/gifs/`) avec un sélecteur *Select Animation* (Hakari, Miku, Tux…). L'état est persisté dans `state/gif-index`.

### Scripts (`home/scripts/`)
- **`random-wallpaper.sh`** — change le wallpaper (et déclenche la regénération de la palette).
- **`Music.sh`** — contrôle de lecture (playerctl).
- **`define.sh`** — dictionnaire en ligne de commande.

### Thème
La palette est dérivée du wallpaper et propagée à Hyprland, Quickshell, kitty, Rofi et Spotify — d'où les variantes vues sur les screenshots (forest / sky / city).

---

## 🗂️ Structure du dépôt

```
dotfiles/
├── home/                      # configs gérées côté utilisateur
│   ├── hypr/
│   │   ├── hyprland.conf      # règles, keybinds, animations
│   │   └── monitors.conf      # config écrans
│   ├── kitty/kitty.conf
│   ├── quickshell/            # le shell QML (voir ci-dessus)
│   │   ├── shell.qml
│   │   ├── components/
│   │   ├── assets/{gifs,pfps}/
│   │   └── state/
│   ├── rofi/                  # config.rasi + themes/
│   ├── waybar/                # config.jsonc + style.css
│   └── scripts/               # Music.sh, define.sh, random-wallpaper.sh
│
└── nixos/                     # la config système
    ├── flake.nix              # entrée du flake (inputs/outputs)
    ├── home.nix               # entrée home-manager
    ├── spicetify.nix          # thème Spotify
    ├── assets/                # wallpapers
    └── modules/
        ├── boot.nix
        ├── graphismes.nix     # pilotes GPU (NVIDIA GTX 1660)
        ├── hyprland.nix
        ├── audio.nix          # PipeWire
        ├── network.nix
        ├── services.nix
        └── packages.nix       # paquets système
```

---

## 🚀 Installation

> ⚠️ Ce sont **mes** dotfiles, taillés pour ma machine (Ryzen 5 2600X / GTX 1660). Lis la config avant de rebuild, surtout `modules/graphismes.nix` (GPU) et `modules/boot.nix`.

```bash
# 1. Cloner
git clone https://github.com/elghuost/Dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Adapter le hostname / l'utilisateur dans flake.nix
#    (et le hardware-configuration.nix de ta machine)

# 3. Rebuild le système
sudo nixos-rebuild switch --flake .#<ton-host>
```

Quickshell se lance via Hyprland (`exec-once`), voir `home/hypr/hyprland.conf`.

---

## ⌨️ Spécifications de la machine

```
Systema   NixOS 25.11 (Xantusia) x86_64
Nucleus   Linux 6.12.78
Testa     zsh 5.9
Ambitus   Hyprland 0.52.1 (Wayland)
Terminus  kitty 0.44.0
Processus AMD Ryzen 5 2600X (12) @ 3.60 GHz
Graphica  NVIDIA GeForce GTX 1660 [Discrete]
Memoria   15.57 GiB
```

---

## 🙏 Crédits & inspirations

- [Quickshell](https://quickshell.outfoxxed.me/) par *outfoxxed*
- La communauté r/unixporn et r/NixOS
- *(ajoute ici les configs/ressources dont tu t'es inspiré)*

---

<div align="center">

*Made with ❄️ on NixOS — feel free to fork & rice.*

</div>
