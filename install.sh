#!/usr/bin/env bash

###########################
#     Install Script      #
# Étienne "Maiste" Marais #
#  Version 1 - Sept 2019  #
###########################

# Exit in case of error
set -e



###########
# General #
###########

# Python
PYTHON_LIST="pynvim \
'python-language-server' \
sphinx"

# Npm
NPM_LIST="ocaml-language-server \
dockerfile-language-server-nodejs"

# Change shell and terminal
install_zsh () {
  printf "** Install zsh **\n"
  chsh -s /usr/bin/zsh
  if [ -e "$HOME/.oh-my-zsh" ] ; then
    printf "OH-MY-ZSH already install...\n"
  else
    printf "Try curl\n"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  # Remove .zshrc default
  rm -rf ~/.zshrc
  rm -rf ~/.oh-my-zsh/custom/theme
  stow -D shell
  stow -v shell
  stow -D oh-my-zsh
  stow -v oh-my-zsh
}

# Graphics
install_i3 () {
  cd ~/.dotfiles
  sudo cp res/xbacklight.conf /etc/X11/xorg.conf.d
  stow -D rofi i3 dunst
  stow -v rofi i3 dunst
}

# Neovim
install_neovim () {
  cd ~/.dotfiles
  stow -D nvim
  stow -v nvim
  nvim -c "PlugInstall | q | q"
}

# Remove gdm and add lightdm
install_lightdm () {
  sudo systemctl disable gdm
  sudo systemctl enable lightdm 
}

# Install packages from other repositories
general_install () {
  printf "** Install Sdkman! **\n"
  curl -s "https://get.sdkman.io" | bash
  source "/home/maiste/.sdkman/bin/sdkman-init.sh"

  printf "** Install pip **\n"
  pip3 install --user --upgrade pip
  pip3 install --user $PYTHON_LIST

  printf "** Install npm **\n"
  sudo npm install -g $NPM_LIST

  printf "** Install go **\n"
  go get -u github.com/sourcegraph/go-langserver

  printf "** Install rustup **\n"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  rustup update
  rustup component add rls rust-analysis rust-src
}



##########
# Fedora #
##########

# Package list
DNF_LIST="gcc \
keepass \
nextcloud-client \
make \
neovim \
gimp \
inkscape \
thunderbird \
i3-gaps \
i3lock \
compton \
feh \
rofi \
xautolock \
nodejs \
fontawesome-fonts \
curl \
zsh \
stow \
go \
opam \
tcpdump \
util-linux-user \
zeal \
docker \
lxappearance \
lightdm-gtk-greeter-settings \
lightdm \
arc-theme \
numix-icon-theme-circle \
network-managero-applet \
xbacklight \
dunst"


# Update function
fedora_update () {
  printf "** Upgrade packages **\n"
  sudo dnf upgrade -y
}

# Install part
fedora_install () {
  printf "** Install packages dnf **\n"
  sudo dnf copr enable -y gregw/i3desktop 
  sudo dnf install -y $DNF_LIST
}



###########
# Install #
###########

if [ "$1" = "fedora" ] ; then
  printf "# Install Fedora #\n"
  fedora_update
  fedora_install
  general_install
fi

if [ "$1" = "tools" ] ; then
  printf "# Install tools #\n"
  install_neovim
  install_zsh
fi

if [ "$1" = "graphic" ] ; then
  printf "# Install graphic #\n"
  install_i3
fi

if [ "$1" = "manager" ] ; then
  printf "# Change to lightdm #"
  install_lightdm
fi

if [ "$1" = "help" ] ; then
  printf "Install script : \n-fedora\n-global\n-graphic\n\-manager"
fi
