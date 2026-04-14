#!/usr/bin/env bash
url=$(~/.config/hyprlock/scripts/music.sh --arturl)

if [ -z "$url" ]; then
    exit 0
fi

if [[ "$url" == https://* ]]; then
    curl -so /tmp/hyde-mpris.png "$url"
else
    cp "$url" /tmp/hyde-mpris.png
fi

pkill -USR2 hyprlock
