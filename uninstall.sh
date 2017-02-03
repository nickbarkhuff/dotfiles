#!/bin/bash

# Change directory to script's location
cd "$(dirname "$0")"

# Check if a .installed.txt file exists
if ! [ -e ".installed.txt" ]; then
    echo "No dotfiles currently installed."
else

    # Loop through installed symlinks
    cat .installed.txt | while read line; do

        # Check if the symlink exists
        if [ -L "$line" ]; then
            rm $line
            echo "UNINSTALLING $line"
        else
            echo "ERROR: Couldn't find file $line; maybe you removed it manually?"
        fi
    done

    # Remove the .installed.txt file
    rm .installed.txt
fi
