#!/usr/bin/env bash
swww img "$1" --transition-type fade
wal -i "$1" -n
echo "$1" > ~/.cache/current_wallpaper

