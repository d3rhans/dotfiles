#!/bin/bash

if [ "$(dunstctl is-paused)" = "false" ]
then
    echo " %{T2}$(dunstctl count waiting)%{T-}"
else
    echo " %{T2}$(dunstctl count waiting)%{T-}"
fi
