#!/bin/bash

function stop_picom() {
    if [ "$(pgrep -c 'picom')" -ge "1" ]
    then
        echo "Stopping Picom"
        kill $(pidof picom)
    fi
}

stop_picom
