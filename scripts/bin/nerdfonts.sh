#!/bin/bash

FONTFILE="FiraCode.zip"
# FONTFILE="Monoid.zip"
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/${FONTFILE}"
DIR=~/.local/share/fonts/nerdfonts/

echo "Installing nerdfont"

mkdir -p ${DIR}
rm $DIR/*.ttf

wget $URL
unzip $FONTFILE "*.ttf" -d $DIR
fc-cache -f
rm $FONTFILE

echo "Nerdfont installed"
