#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

load () {
    FILE=$1
    if [ -f ~/.$FILE ]; then
        echo "Backing up $FILE< overwriting>"
        cp ~/.$FILE ~/.$FILE.bak.$(date +"%Y-%m-%d.%H-%M-%S")
    else
        echo "Creating new file $FILE"
    fi
    cp $DIR/$FILE ~/.$FILE
}

doStuff() {
    load "tmux.conf"
    load "vimrc"

    cd ~/.vim/bundle
    for i in $(cat $DIR/plugins.txt); do
        git clone $i 2> /dev/null
        code=$?

        if [[ code -eq 0 ]]; then
            echo "Cloned $i"
        elif [[ code -eq 128 ]]; then
            echo "Skipping $i (already loaded)"
        else
            echo "Unknown error: $code"
        fi
    done
}

read -p "Applying this git repo's dotfiles to your current system. All files will be backed up in home directory. Do you want to continue? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    doStuff
else
    echo
    exit 1
fi
