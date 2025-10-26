#!/bin/sh
export PATH=/usr/bin:/bin:/usr/local/bin

while true; do
    # Check if Tailscale is running and logged in
    if tailscale status >/dev/null 2>&1; then
        ip=$(tailscale ip -4 2>/dev/null)
        if [ -n "$ip" ]; then
            echo "$ip"
        else
            echo "DOWN"
        fi
    else
        echo "DOWN"
    fi
    sleep 1
done
