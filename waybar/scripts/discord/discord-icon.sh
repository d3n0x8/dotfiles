#!/bin/bash

if pgrep -x "Discord" > /dev/null; then
    echo '{"text": "", "tooltip": "Discord is running"}' 
else
    echo "" 
fi
