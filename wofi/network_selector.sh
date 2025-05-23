# !/bin/bash
INTERFACE = iwctl device list | awk '/station/ {print $2; exit}'

NETWORKS=$(iwctl station wlan0 get-networks | awk '/psk|open/ {print $1}')

SELECTED=$(echo "$NETWORKS" | wofi --dmenu --prompt "Select Wi-Fi Network")

[ -z "$SELECTED" ] && exit

iwctl --passphrase-on-stdin station "$INTERFACE" connect "$SELECTED" <<< "$(wofi --dmenu --password --prompt "Password for $SELECTED")"
