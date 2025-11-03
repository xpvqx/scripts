#!/bin/bash

for zone in /sys/class/thermal/thermal_zone*/temp; do
  temp=$(<"$zone")
  zone_name=$(basename "$(dirname "$zone")")
  awk -v t="$temp" -v z="$zone_name" 'BEGIN { printf "%s: %.1f°C\n", z, t / 1000 }'
done
