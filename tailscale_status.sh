#!/bin/sh
export PATH=/usr/bin:/bin:/usr/local/bin
for i in 1 2 3 4 5; do
    ip=$(/usr/bin/tailscale ip -4 2>/dev/null)
    if [ -n "$ip" ]; then
        echo "$ip"
        exit
    fi
    sleep 1
done
echo "down"
