#!/bin/bash

URL="https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/FiraCode.zip"
DIR=~/.local/share/fonts/nerdfonts/

echo "Installing Fira Code nerdfont"

mkdir -p ${DIR}
rm $DIR/*.ttf

wget $URL
unzip FiraCode.zip "*.ttf" -d $DIR
fc-cache -f
rm FiraCode.zip

echo "Fira Code nerdfont installed"
