#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

store () {
    FILE=$1

    echo "Diffing $DIR/$FILE and ~/.$FILE"
    diff $DIR/$FILE ~/.$FILE > /dev/null
    code=$?
    if [[ $code -eq 1 ]]
    then
        echo "$FILE changing from< to>"
        diff $DIR/$FILE ~/.$FILE
        cp ~/.$FILE $DIR/$FILE
    elif [[ $code -eq 0 ]]
    then
        echo "$FILE has no changes"
    else
        echo "Unknown diff exit code $code"
    fi
}

doStuff() {
    echo -n > plugins.txt
    echo -n "Logging plugins... "
    for i in $(ls ~/.vim/bundle); do
        echo -n "$i "
        cat ~/.vim/bundle/$i/.git/config | sed -n "s/\s*url = \(.\)/\1/p" >> plugins.txt
    done
    echo

    store "tmux.conf"
    store "vimrc"
}

read -p "Backing up current system configurations into this git repo. Do you want to continue? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    doStuff
else
    echo
    exit 1
fi
