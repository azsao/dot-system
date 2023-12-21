#!/bin/bash

USER=$(getent passwd "$(whoami)" | cut -d: -f6)

cd "/home"
mkdir Wallpapers

sleep 2

WALL_MD="${USER}/home/Wallpapers"
mv "${USER}/dot-system/wallpapers+" "$WALL_MD"
