if tailscale status 2>/dev/null | grep -q "100\."; then
    echo "ts: "
else
    echo "ts: "
fi
