if tailscale status 2>/dev/null | grep -q "100\."; then
    echo "VPN:  "
else
    echo "VPN:  "
fi
