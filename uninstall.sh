#!/bin/bash
echo "Uninstalling any currently installed dotfiles..."

# Check if a .installed.txt file exists
if ! [ -e ".installed.txt" ]; then
    echo "No dotfiles currently installed."
else

    # Loop through installed symlinks
    cat .installed.txt | while read line; do

        # Check if the symlink exists
        if [ -h "$line" ]; then
            rm $line;
        else
            echo "ERROR: Couldn't find file $line, maybe you moved/removed it manually?"
        fi
    done

    # Remove the .installed.txt file
    rm .installed.txt
    echo "Dotfiles uninstalled."
fi
