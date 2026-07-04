#!/bin/bash

echo "Checking installed AUR packages..."

matches=$(grep -Fxf <(
    curl -fsSL https://raw.githubusercontent.com/dragonruler1000/aur_check/main/bad_packages.txt
) <(
    pacman -Qm | cut -d' ' -f1
))

if [ -z "$matches" ]; then
    echo "✓ No known malicious AUR packages found."
else
    echo "⚠ WARNING: The following known malicious packages are installed:"
    echo "$matches"
fi
