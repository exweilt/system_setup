!#/bin/bash

$HOME_DIRECTORY="/home/lex/"
$REPOS_DIRECTORY="${HOME_DIRECTORY}repos/"

pacman -Syu --noconfirm

pacman -S base-devel git libx11 libxft xorg-server xorg-xinit terminus-font --noconfirm --needed

pacman -S tldr --noconfirm --needed
pacman -S code --noconfirm --needed
pacman -S micro --noconfirm --needed
pacman -S neovim --noconfirm --needed

if [ -d "/home/lex/" ]; then
    mkdir /home/lex/repos/ 2> /dev/null
    git clone git://git.suckless.org/st "${REPOS_DIRECTORY}/st"
    git clone git://git.suckless.org/dmenu "${REPOS_DIRECTORY}/dmenu"
    git clone git://git.suckless.org/dwm "${REPOS_DIRECTORY}/dwm"
fi