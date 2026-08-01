#!/bin/bash
echo "Downloading the latest version of DependencyControl"
curl -s https://api.github.com/repos/TypesettingTools/DependencyControl/releases/latest | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \" | wget -qi - -O "$HOME"/depcontrol.zip
FILE="$HOME"/depcontrol.zip
echo "Unpacking..."
unzip -q "$FILE" -d "$HOME"/output
echo "Moving..."
cp -r "$HOME"/output/automation/* "$HOME"/.aegisub/automation/
echo "Cleaning up..."
rm -r "$HOME"/output
rm "$FILE"
echo "Done."