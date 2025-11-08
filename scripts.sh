#!/bin/bash
# Mako Helper Scripts
# Save to ~/.config/mako/scripts.sh
# Make executable: chmod +x ~/.config/mako/scripts.sh

# Toggle Do Not Disturb mode
mako_dnd() {
    if makoctl mode | grep -q "do-not-disturb"; then
        makoctl mode -r do-not-disturb
        notify-send "Do Not Disturb" "Notifications enabled" -i notifications
    else
        makoctl mode -a do-not-disturb
        notify-send "Do Not Disturb" "Notifications disabled" -i notifications-disabled
    fi
}

# Dismiss all notifications
mako_dismiss_all() {
    makoctl dismiss --all
}

# Show notification history
mako_history() {
    makoctl history
}

# Reload mako config
mako_reload() {
    makoctl reload
    notify-send "Mako" "Configuration reloaded" -i system-reboot
}

# Volume notification
volume_notify() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o MUTED)
    
    if [ -n "$muted" ]; then
        notify-send -a "volume" -h string:x-canonical-private-synchronous:volume -h int:value:0 "Volume" "Muted" -i audio-volume-muted
    else
        notify-send -a "volume" -h string:x-canonical-private-synchronous:volume -h int:value:$volume "Volume" "$volume%" -i audio-volume-high
    fi
}

# Brightness notification
brightness_notify() {
    brightness=$(brightnessctl get)
    max=$(brightnessctl max)
    percent=$((brightness * 100 / max))
    
    notify-send -a "brightness" -h string:x-canonical-private-synchronous:brightness -h int:value:$percent "Brightness" "$percent%" -i display-brightness
}

# Battery notification
battery_notify() {
    capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)
    status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null)
    
    if [ -n "$capacity" ]; then
        if [ "$status" = "Charging" ]; then
            icon="battery-charging"
        elif [ "$capacity" -lt 20 ]; then
            icon="battery-caution"
        else
            icon="battery-good"
        fi
        
        notify-send -a "battery" "Battery" "$capacity% ($status)" -i $icon
    fi
}

# Network notification
network_notify() {
    connected=$(nmcli -t -f NAME connection show --active | head -n1)
    
    if [ -n "$connected" ]; then
        notify-send -a "network" "Network" "Connected to $connected" -i network-wireless
    else
        notify-send -a "network" "Network" "Disconnected" -i network-wireless-offline
    fi
}

# Screenshot notification
screenshot_notify() {
    notify-send -a "screenshot" "Screenshot" "Saved to ~/Pictures/Screenshots/" -i camera-photo
}

# Usage
case "$1" in
    dnd) mako_dnd ;;
    dismiss) mako_dismiss_all ;;
    history) mako_history ;;
    reload) mako_reload ;;
    volume) volume_notify ;;
    brightness) brightness_notify ;;
    battery) battery_notify ;;
    network) network_notify ;;
    screenshot) screenshot_notify ;;
    *)
        echo "Usage: $0 {dnd|dismiss|history|reload|volume|brightness|battery|network|screenshot}"
        exit 1
        ;;
esac
