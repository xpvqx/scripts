#!/bin/bash

# paths
SRC="/home/karl/nextcloud"
DEST_BASE="/mnt/synology/home/backups"

# date format YYYYMMDD
DATE=$(date +%Y%m%d)

# final destination folder
DEST="$DEST_BASE/nextcloud_$DATE"

# create destination folder
mkdir -p "$DEST"

echo "=== nextcloud backup ==="
echo "Source:      $SRC"
echo "Destination: $DEST"
echo "Date:        $DATE"
echo "------------------------"

rsync -avh --ignore-existing "$SRC/" "$DEST/"

echo "=== backup complete ==="
