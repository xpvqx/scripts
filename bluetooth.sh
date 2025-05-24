#!/bin/bash

# Bluetooth device MAC address
DEVICE_MAC="AC:80:0A:5D:CB:ED"

# Connect using bluetoothctl
echo -e "connect $DEVICE_MAC\nexit" | bluetoothctl
