#!/usr/bin/env bash
# Vider le cache
rm -f /tmp/hyde-mpris.png /tmp/hyde-mpris.inf

# Récupérer le wallpaper actuel
current_wall=$(swww query | grep -oP "image: \K[^\s,]+" | head -1)
if [[ "$current_wall" == *.gif ]]; then
    magick "$current_wall"[0] ~/.config/hyprlock/wallpapers/6.jpg
else
    cp "$current_wall" ~/.config/hyprlock/wallpapers/6.jpg
fi

# Récupérer la vignette musicale
~/.config/hyprlock/scripts/hlock_mpris.sh --title &
sleep 0.5

hyprlock --config ~/.config/hyprlock/layouts/layout-reddit.conf
