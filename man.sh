#!/usr/bin/bash

DMENU_COLORS="-nb #282828 -nf #ebdbb2 -sb #458588 -sf #282828 -fn monospace:size=10"

man -k . | dmenu -l 20 $DMENU_COLORS | awk '{print $1}' | xargs -r st -e man
