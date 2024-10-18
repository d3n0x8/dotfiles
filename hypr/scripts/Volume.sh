#!/bin/bash

iDIR="$HOME/.config/swaync/icons"
sDIR="$HOME/.config/hypr/scripts"

active_sink=$(pactl list sinks | grep -A 15 'State: RUNNING' | grep 'Name:' | sed 's/^.*Name: //')

get_volume() {
    volume=$(pamixer --get-volume --sink "$active_sink")
    if [[ "$volume" -eq "0" ]]; then
        echo "Muted"
    else
        echo "$volume%"
    fi

}

# Notify function
notify_user() {
    if [[ "$(get_volume)" == "Muted" ]]; then
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif -u low -i "$(get_icon)" "Volume: Muted"
    else
        notify-send -e -h int:value:"$(get_volume | sed 's/%//')" -h string:x-canonical-private-synchronous:volume_notif -u low -i "$(get_icon)" "Volume: $(get_volume)"
        "$sDIR/Sounds.sh" --volume
    fi
}

# Increase Volume for the active sink
inc_volume() {
    if [ "$(pamixer --get-mute --sink "$active_sink")" == "true" ]; then
        toggle_mute
    else
        pamixer -i 5 --allow-boost --set-limit 150 --sink "$active_sink" && notify_user
    fi
}

# Decrease Volume for the active sink
dec_volume() {
    if [ "$(pamixer --get-mute --sink "$active_sink")" == "true" ]; then
        toggle_mute
    else
        pamixer -d 5 --sink "$active_sink" && notify_user
    fi
}

# Toggle Mute
toggle_mute() {
    if [ "$(pamixer --get-mute --sink "$active_sink")" == "false" ]; then
        pamixer -m --sink "$active_sink" && notify-send -e -u low -i "$iDIR/volume-mute.png" "Volume Switched OFF"
    else
        pamixer -u --sink "$active_sink" && notify-send -e -u low -i "$(get_icon)" "Volume Switched ON"
    fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
    get_volume
elif [[ "$1" == "--inc" ]]; then
    inc_volume
elif [[ "$1" == "--dec" ]]; then
    dec_volume
elif [[ "$1" == "--toggle" ]]; then
    toggle_mute
else
    get_volume
fi