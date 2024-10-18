
#verifier si discord est en cours d'exécution et le fermer 
if pgrep -x "Discord" > /dev/null; then
    if (hyprctl clients -j | jq -r '.[] | select(.class == "discord")'); then
        pkill -f /opt/discord/Discord
    fi
fi