#!/usr/bin/env bash

NF="#ebdbb2"
NB="#282828"
SF="#282828"
SB="#fabd2f"
FONT="monospace:size=10"

DMENU="dmenu -i -l 4 -fn $FONT -nf $NF -nb $NB -sf $SF -sb $SB"

case "$(printf "kill\nzzz\nreboot\nshutdown" | $DMENU)" in
	kill)
		ps -u "$USER" -o pid,comm,%cpu,%mem |
		dmenu -i -l 10 -p Kill: -fn "$FONT" -nf "$NF" -nb "$NB" -sf "$SF" -sb "$SB" |
		awk '{print $1}' | xargs -r kill
		;;
	zzz)
		slock & systemctl suspend -i
		;;
	reboot)
		systemctl reboot -i
		;;
	shutdown)
		shutdown now
		;;
	*)
		exit 1
		;;
esac
