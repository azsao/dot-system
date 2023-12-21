#!/bin/bash

USER=$(getent passwd "$(whoami)" | cut -d: -f6)

cd $USER/home/
mkdir Wallpapers


sleep 2

WALL_MD= ${USER}/home/wallpaper+
mv ${USER}/dot-system-main/wallpapers+ ${USER}/home/wallpaper+