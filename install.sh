#!/bin/bash

# Change directory to script's location
cd "$(dirname "$0")"

# Check that one (and only one) argument was provided
if [ $# -ne 1 ]; then
    echo "ERROR: Please specify a config file."
else

    # Check if the specified config file exists
    if ! [ -e "configs/$1" ]; then
        echo "ERROR: Config file not found."
    else

        # Uninstall any existing dotfile symlinks
        echo "Uninstalling any previously installed dotfiles."
        ./uninstall.sh
        echo "-----"

        # Create .installed.txt file
        echo "Installing dotfiles from $1."
        touch .installed.txt

        # Read in config file
        grep -v "^$" "configs/$1" | while read line; do

            # Split on space
            arg=($line)

            # Check that there are only two space-delimited strings on the line
            if ! [ -z "${arg[2]}" ]; then
                echo "ERROR: Formatting error on the following line: "
                echo "       $line"
                echo "       Use the following format in config files: "
                echo "       path/to/dotfile path/to/symlink"
                echo "       Do NOT use spaces in file names."
            else

                # Check that the dotfile exists
                if ! [ -e "files/${arg[0]}" ]; then
                    echo "ERROR: Couldn't find file \"files/${arg[0]}.\""
                else

                    # Check that installing the current dotfile won't overwrite anything
                    if [ -e "`eval echo ${arg[1]}`" ]; then
                        echo "ERROR: File ${arg[1]} already exists; delete it and then try again."
                    else

                        # Create symlink; if successful, log the file to .installed.txt
                        eval ln -s "${PWD}/files/${arg[0]} ${arg[1]}" && \
                        eval echo "${arg[1]}" >> .installed.txt && \
                        echo "INSTALLING ${arg[1]}"
                    fi
                fi
            fi
        done
    fi
fi
