!#/bin/bash

$HOME_DIRECTORY="/home/lex/"
$REPOS_DIRECTORY="${HOME_DIRECTORY}repos/"

pacman -S base-devel git libx11 libxft xorg-server xorg-xinit terminus-font --noconfirm

pacman -S tldr --noconfirm
pacman -S code --noconfirm
pacman -S micro --noconfirm
pacman -S neovim --noconfirm

if [ -d "/home/lex/" ]; then
    mkdir /home/lex/repos/ 2> /dev/null
    git clone git://git.suckless.org/st "${REPOS_DIRECTORY}/st"
    git clone git://git.suckless.org/dmenu "${REPOS_DIRECTORY}/dmenu"
    git clone git://git.suckless.org/dwm "${REPOS_DIRECTORY}/dwm"
fi