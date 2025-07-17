#!/bin/sh

VOL=$(/usr/bin/pactl get-sink-volume @DEFAULT_SINK@ | /bin/grep 'front-left:' | /usr/bin/awk '{print $5}' | head -n1)

if [ -z "$VOL" ]; then
  echo "n/a"
else
  echo "$VOL"
fi
