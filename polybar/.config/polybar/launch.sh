#!/bin/bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar.log
polybar mainbar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched"
