#!/bin/bash
HOME_CURRENT="$(dirname "$HOME")/current"
echo "Creating directory for scripts $HOME_CURRENT/.aegisub/automation"
mkdir -p "$HOME_CURRENT"/.aegisub/automation/
echo "Moving default scripts..."
cp -r "$SNAP"/usr/share/aegisub/automation/* "$HOME_CURRENT"/.aegisub/automation/
echo "Fixing the config..."
CONFIG_FILE="$HOME_CURRENT/.aegisub/config.json"

#check if exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Fixing failed. You can go into Aegisub Preferences -> Automation and change all the paths. You can move this folder into another location, as long as it's not hidden. If you're feeling lost, you can run this script again and the paths will update automatically now"
    exit 1
fi

#fix the config
sed -i '/"Automation"[[:space:]]*:[[:space:]]*{/,/}/ {
    s|"Autoload"[[:space:]]*:.*|"Autoload" : "'"$HOME_CURRENT"'/.aegisub/automation/autoload/",|
    s|"Base"[[:space:]]*:.*|"Base" : "'"$HOME_CURRENT"'/.aegisub/automation/",|
    s|"Include"[[:space:]]*:.*|"Include" : "'"$HOME_CURRENT"'/.aegisub/automation/include/"|
}' "$CONFIG_FILE"

echo "Successfully updated the Automation paths."
echo "You can move this folder into another location, as long as it's not hidden. Do not forget to change the path in Aegisub Preferences -> Automation"

