#!/bin/bash

# TODO: Make sure to add extra and multilib repos in pacman

# Constants ===================================================
USERNAME="lex"
HOME_DIRECTORY="/home/${USERNAME}"
REPOS_DIRECTORY="${HOME_DIRECTORY}/repos"

# Run As Root =================================================
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# if [ -d "${HOME_DIRECTORY}" ]; then
#     echo "The home directory <${HOME_DIRECTORY}> is present!"
#     echo "Aborting!!!"
#     exit 1
# fi

# Add User ====================================================
useradd --shell /bin/bash "${USERNAME}"
usermod -aG wheel "${USERNAME}"
usermod -aG audio "${USERNAME}"
mkdir "${HOME_DIRECTORY}" 2> /dev/null
mkdir "${REPOS_DIRECTORY}" 2> /dev/null
# TODO: edit sudoers file

# Update System ===============================================
pacman -Syu --noconfirm

# Install base ================================================
pacman -S base-devel git libx11 libxft xorg-server xorg-xinit terminus-font --noconfirm --needed
pacman -S iw networkmanager --noconfirm --needed
pacman -S exfat-utils --noconfirm --needed

# Install fonts ===============================================
pacman -S noto-fonts --noconfirm --needed

# Install programs ============================================
pacman -S tldr --noconfirm --needed
pacman -S code --noconfirm --needed
pacman -S micro --noconfirm --needed
pacman -S neovim --noconfirm --needed
pacman -S neofetch --noconfirm --needed
pacman -S redshift --noconfirm --needed
pacman -S nvtop --noconfirm --needed
pacman -S htop --noconfirm --needed
pacman -S gparted --noconfirm --needed
pacman -S gimp --noconfirm --needed
pacman -S zoxide --noconfirm --needed
pacman -S alacritty --noconfirm --needed
pacman -S flameshot --noconfirm --needed # For taking screenshots
pacman -S thefuck --noconfirm --needed

git clone git://git.suckless.org/st "${REPOS_DIRECTORY}/st"
git clone git://git.suckless.org/dmenu "${REPOS_DIRECTORY}/dmenu"
git clone git://git.suckless.org/dwm "${REPOS_DIRECTORY}/dwm"
git clone https://aur.archlinux.org/yay.git "${REPOS_DIRECTORY}/yay"
git clone https://aur.archlinux.org/librewolf-bin.git "${REPOS_DIRECTORY}/librewolf"

# Set Up Zoxide ===============================================
mkdir "${HOME_DIRECTORY}/.config" 2> /dev/null
touch "${HOME_DIRECTORY}/.config/zoxide.init"
zoxide init bash --cmd cd > "${HOME_DIRECTORY}/.config/zoxide.init"
touch "${HOME_DIRECTORY}/.bashrc"
echo "source ${HOME_DIRECTORY}/.config/zoxide.init" >> "${HOME_DIRECTORY}/.bashrc"

# Set Up The Fuck ==============================================
echo "eval \"\$(thefuck --alias)\"" >> "${HOME_DIRECTORY}/.bashrc"



# cd "${REPOS_DIRECTORY}/st" ; makepkg -si
# cd "${REPOS_DIRECTORY}/dmenu" ; makepkg -si
# cd "${REPOS_DIRECTORY}/dwm" ; makepkg -si
# cd "${REPOS_DIRECTORY}/yay" ; makepkg -si
# cd "${REPOS_DIRECTORY}/librewolf" ; makepkg -si


# TODO: edit sudoers file