#!/bin/bash
picom -b
pipewire &
pipewire-pulse &
(sleep 2; /home/karl/.suckless/slstatus/slstatus &) &
