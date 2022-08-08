#!/bin/bash

function start_picom() {
    if [ "$(pgrep -c 'picom')" -eq "0" ]
    then
        echo "Starting picom"
        picom --backend glx -c -f -D 5 --inactive-dim 0.02 -b
    fi
}

start_picom
