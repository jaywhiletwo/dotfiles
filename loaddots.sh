#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

load () {
    FILE=$1
    if [ -f ~/.$FILE ]; then
        echo "Backing up $FILE< overwriting>"
        diff ~/.$FILE ~/.$FILE.bak
        cp ~/.$FILE ~/.$FILE.bak.$(date +"%Y-%m-%d.%H-%M-%S")
    fi
    cp $DIR/$FILE ~/.$FILE
}

load "tmux.conf"
load "vimrc"
