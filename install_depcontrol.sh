#!/bin/bash
#check if config exists
HOME_CURRENT="$(dirname "$HOME")/current"
CONFIG_FILE="$HOME_CURRENT/.aegisub/config.json"
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Install failed. You should launch Aegisub at least once before initializing Automation scripting"
    exit 1
fi
set -e
#former move_scripts.sh
echo "Creating directory for scripts $HOME_CURRENT/.aegisub/automation"
mkdir -p "$HOME_CURRENT"/.aegisub/automation/
echo "Moving default scripts..."
cp -r "$SNAP"/usr/share/aegisub/automation/* "$HOME_CURRENT"/.aegisub/automation/
echo "Fixing the config..."
#fix the config
sed -i '/"Automation"[[:space:]]*:[[:space:]]*{/,/}/ {
    s|"Autoload"[[:space:]]*:.*|"Autoload" : "'"$HOME_CURRENT"'/.aegisub/automation/autoload/",|
    s|"Base"[[:space:]]*:.*|"Base" : "'"$HOME_CURRENT"'/.aegisub/automation/",|
    s|"Include"[[:space:]]*:.*|"Include" : "'"$HOME_CURRENT"'/.aegisub/automation/include/"|
}' "$CONFIG_FILE"
echo "Successfully updated the Automation paths."
echo "You can move this folder into another location, as long as it's not hidden. Do not forget to change the path in Aegisub Preferences -> Automation"
#former install_depcontrol.sh
echo "Downloading the latest version of DependencyControl"
curl -s https://api.github.com/repos/TypesettingTools/DependencyControl/releases/latest | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \" | wget -i - -O "$HOME"/depcontrol.zip
FILE="$HOME"/depcontrol.zip
echo "Unpacking..."
unzip "$FILE" -d "$HOME"/output
echo "Moving..."
cp -r "$HOME"/output/automation/* "$HOME"/.aegisub/automation/
echo "Cleaning up..."
rm -r "$HOME"/output
rm "$FILE"
echo "Done."