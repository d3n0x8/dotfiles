#!/bin/bash

if pgrep -x "Discord" > /dev/null; then
    workspace=$(hyprctl clients -j | jq -r '.[] | select(.class == "discord") | .workspace["name"]')

    if [ ! -z "$workspace" ]; then
        hyprctl dispatch workspace "$workspace"
    fi
else
    discord &
fi
