#!/bin/bash

# Change directory to script's location
cd "$(dirname "$0")"

# Save directories of files and configs
files="${PWD}/files"
configs="${PWD}/configs"

# Check that one (and only one) argument was provided
if [ $# -ne 1 ]; then
    echo "ERROR: Please specify a config file."
else

    # Check if the specified config file exists
    if ! [ -e "$configs/$1" ]; then
        echo "ERROR: Config file not found."
    else

        # Uninstall any existing dotfile symlinks
        ./uninstall.sh
        echo "-----"

        # Create .installed.txt file
        echo "Installing dotfiles from $1."
        touch .installed.txt

        # Read in config file
        grep -v "^$" "$configs/$1" | while read line; do

            # Split on space
            cfg=($line)

            # Check that there are only two space-delimited strings on the line
            if ! [ -z "${cfg[2]}" ]; then
                echo "ERROR: Formatting error on the following line: "
                echo "       $line"
                echo "       Use the following format in config files: "
                echo "       path/to/dotfile path/to/symlink"
                echo "       Do NOT use spaces in file names."
            else

                # Check that the dotfile exists
                if ! [ -e "$files/${cfg[0]}" ]; then
                    echo "ERROR: Couldn't find file \"files/${cfg[0]}.\""
                else

                    # Create symlink
                    eval ln -s $files/${cfg[0]} ${cfg[1]} && \

                    # If successful, log the file to .installed.txt
                    eval echo "${cfg[1]}" >> .installed.txt
                fi
            fi
        done

        # Print the installed dotfiles
        echo "-----"
        echo "Here is a list of the dotfile symlinks I have installed: "
        cat .installed.txt
    fi
fi
