#!/bin/bash

xrandr \
  --output DP-0 --mode 1920x1080 --rate 144 --gamma 0.75:0.75:0.75 \
  --output HDMI-0 --mode 1680x1050 --rate 60 --gamma 0.7:0.7:0.7 --left-of DP-0
