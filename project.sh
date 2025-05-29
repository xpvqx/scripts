#!/bin/bash

# Gruvbox color palette for dmenu
NB='#282828'
NF='#ebdbb2'
SB='#458588'
SF='#fbf1c7'

LAPTOP=$(xrandr | grep " connected" | grep -E "eDP|LVDS" | awk '{print $1}')
HDMI=$(xrandr | grep " connected" | grep -E "HDMI|DP|DP-1" | awk '{print $1}')

if [ -z "$HDMI" ]; then
    echo "No external HDMI/DisplayPort connected"
    exit 1
fi

CHOICE=$(echo -e "Mirror\nExtend Right\nLaptop Only\nHDMI Only" | dmenu -i -p "Display mode:" \
    -nb "$NB" -nf "$NF" -sb "$SB" -sf "$SF")

case "$CHOICE" in
    Mirror)
        xrandr --output "$HDMI" --auto --same-as "$LAPTOP"
        ;;
    "Extend Right")
        xrandr --output "$HDMI" --auto --right-of "$LAPTOP"
        ;;
    "Laptop Only")
        xrandr --output "$HDMI" --off --output "$LAPTOP" --auto
        ;;
    "HDMI Only")
        xrandr --output "$LAPTOP" --off --output "$HDMI" --auto
        ;;
    *)
        echo "No valid option selected"
        ;;
esac
