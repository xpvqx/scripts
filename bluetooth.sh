#!/bin/bash
DEVICE_MAC="AC:80:0A:5D:CB:ED"
echo -e "connect $DEVICE_MAC\nexit" | bluetoothctl
