#!/bin/bash

file=$(fd --type f '(.*pdf)' ~/Dokumente | fzf)

if [[ -z $file ]]; then
    exit 0
fi

xdg-open $file &
