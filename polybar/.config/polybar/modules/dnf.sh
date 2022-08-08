#!/bin/bash

UPDATES="$(dnf updateinfo -q --list | wc -l)"

echo "ﮮ %{T2}${UPDATES}%{T-}"
