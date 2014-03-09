#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

store () {
    FILE=$1
    echo "$FILE changing from< to>"
    diff $DIR/$FILE ~/.$FILE
    cp -i ~/.$FILE $DIR/$FILE
}

store "tmux.conf"
store "vimrc"
