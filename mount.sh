#!/bin/sh

# Gruvbox Dark Colors
DMENU_COLORS="-nb #282828 -nf #ebdbb2 -sb #458588 -sf #282828 -fn monospace:size=10"

disk=$(lsblk --noheadings --output NAME,FSTYPE --raw | grep -E "\w+\s+\w+" | cut -d " " -f 1 | \
    dmenu -i -p "Disk to mount: " $DMENU_COLORS)

if [ -z "$disk" ]; then
    exit 0
fi

mountpoint=$(mktemp -d)

st -e sh -c "sudo mount /dev/$disk $mountpoint ; cd $mountpoint ; $SHELL ; cd ~ ; sudo umount $mountpoint || sleep 10" &
