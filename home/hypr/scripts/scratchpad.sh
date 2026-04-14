#!/usr/bin/env bash
if hyprctl clients -j | grep -q '"title": "scratchpad"'; then
    hyprctl dispatch togglespecialworkspace scratchpad
else
    kitty --title scratchpad &
    sleep 0.5
    hyprctl dispatch movetoworkspace special:scratchpad,title:scratchpad
fi
