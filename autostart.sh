#!/bin/bash
nitrogen --restore &
picom -b
slstatus
pipewire &
pipewire-pulse &
(sleep 2 && easyeffects --gapplication-service) &
