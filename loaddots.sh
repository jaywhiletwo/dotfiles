#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

load () {
    FILE=$1
    echo "Backing up $FILE< overwriting>"
    diff ~/.$FILE ~/.$FILE.bak
    cp -i ~/.$FILE ~/.$FILE.bak
    cp $DIR/$FILE ~/.$FILE
}

cp -i ~/.tmux.conf ~/.tmux.conf.bak
cp -i ~/.vimrc ~/.vimrc.bak

cp $DIR/tmux.conf ~/.tmux.conf 
cp $DIR/vimrc ~/.vimrc
