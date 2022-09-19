#!/bin/bash
echo "Creating directory for scripts $HOME/aegisub-lua"
mkdir $HOME/lua/
echo "Moving default scripts..."
cp -r $SNAP/usr/local/share/aegisub/automation/* $HOME/lua/
echo "Now go into Aegisub Preferences -> Automation and change all the paths. You can move this folder into another location, as long as it's not hidden."

