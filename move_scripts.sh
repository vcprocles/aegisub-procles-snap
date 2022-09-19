#!/bin/bash
echo "Creating directory for scripts ~/aegisub-lua"
mkdir $SNAP_REAL_HOME/aegisub-lua/
echo "Moving default scripts..."
cp -r $SNAP/usr/local/share/aegisub/automation/* $SNAP_REAL_HOME/aegisub-lua/
echo "Now go into Aegisub Preferences -> Automation and change all the paths. You can remove and rename aegisub-lua as you please, as long as you don't make it hidden. If you want to hide it, drop it in ~/snap/aegisub-procles/current/"

