#!/usr/bin/env bash

###########################
#     Install Script      #
# Étienne "Maiste" Marais #
#  Version 2 - June 2020  #
###########################



#####################
# Utility functions #
#####################

set -e

ARGS=0
OS_NAME=${NAME:-"arch"}

exit_if_not_good () {
  if [[ $ARGS -ne $1 ]]; then
    printf "Not enough argument(s): got $#, wait $1\n"
    exit 1
  fi
  printf ""
}



###########
# Install #
###########

# ------- SHELL ---------- #

install_zsh () {
  printf "** Install zsh **\n- Change shell\n";
  chsh -s /usr/bin/zsh
  printf " - Install omz\n"
  if [ -e "$HOME/.oh-my-zsh" ] ; then
    printf " - OH-MY-ZSH already install...\n"
  else
    printf " - Try curl\n"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  printf " - Link files\n"
  rm -rf ~/.zshrc
  rm -rf ~/.oh-my-zsh/custom/theme
  stow -D shell
  stow -v shell
  stow -D oh-my-zsh
  stow -v oh-my-zsh
}

# ------ GRAPHICS ---------- #

install_i3 () {
  printf "** Install i3 **\n"
  cd ~/.dotfiles
  printf " - Copy xbacklight.conf\n"
  sudo cp res/xbacklight.conf /etc/X11/xorg.conf.d
  rm -rf ~/.config/i3 ~/.config/rofi ~/.config/dunst

  printf " - Link files\n"
  stow -D rofi i3 dunst
  stow -v rofi i3 dunst
}

install_xmonad () {
  printf "** Install xmonad **\n"
  printf " - Link files\n"
  stow -D rofi xmonad dunst
  stow -v rofi xmonad dunst
}

install_lightdm () {
  sudo systemctl disable gdm
  sudo systemctl enable lightdm
}

install_gdm () {
  sudo systemctl disable lightdm
  sudo systemctl enable gdm
}

install_graphic () {
  case $1 in
    "i3"     ) install_i3     ;;
    "xmonad" ) install_xmonad ;;
  esac
}

install_manager () {
  case $1 in
    "gdm"     ) install_gdm     ;;
    "ligthdm" ) install_lightdm ;;
  esac
}

# ------ PROGRAMING -------- #

install_neovim () {
  printf "** Install neovim **\n"
  cd ~/.dotfiles
  printf " - Link files\n"
  stow -D nvim
  stow -v nvim
  printf " - Install plugins\n"
  nvim -c "PlugInstall | q | q"
}

install_java () {
  printf "** Install Sdkman! **\n"
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

install_python () {
  PYTHON_LIST="pynvim \
    python-language-server"

  printf "** Install pip **\n"
  pip3 install --user --upgrade pip
  pip3 install --user $PYTHON_LIST
}

install_rust () {
  printf "** Install rustup **\n"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  rustup update
  rustup component add rls rust-analysis rust-src
}

install_npm () {
  NPM_LIST="ocaml-language-server \
    dockerfile-language-server-nodejs"

  printf "** Install npm **\n"
  sudo npm install -g $NPM_LIST
}

install_go () {
  printf "** Install go **\n"
  go get -u golang.org/x/tools/gopls
}

install_ocaml () {
  printf "** Install OCaml **\n"
  OCAML_VERSION="4.10.0"
  OCAML_LIST="merlin \
    dune \
    menhir \
    odoc"
  printf " - Install switch\n"
  opam switch create "$OCAML_VERSION"
  eval $(opam env)
  printf " - Install opam packages\n"
  opam update
  eval $(opam env)
  opam install $OCAML_LIST
}

install_languages () {
  for lang in $*; do
    case $lang in
      "rust"   ) install_rust   ;;
      "java"   ) install_java   ;;
      "go"     ) install_go     ;;
      "python" ) install_python ;;
      "node"   ) install_node   ;;
      "ocaml"  ) install_ocaml  ;;
    esac
  done
}



###########
#  System #
###########

# Package list
PKG_LIST="gcc \
keepassxc \
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
dunst \
redshift"

install_pkgs () {
  printf "** Install packages **\n"
  case $1 in
    "fedora" ) sudo dnf install -y $PKG_LIST ;;
    *        ) sudo pacman -Syy $PKG_LIST    ;;
  esac
}

update_pkgs () {
  printf "** Update packages **\n"
  case $1 in
    "fedora" ) sudo dnf upgrade -y ;;
    *        ) sudo pacman -Syu   ;;
  esac
}


###########
# Scripts #
###########

ARGS=$#

if [ "$1" = "system" ] ; then
  printf "# Install system #\n"
  exit_if_not_good 2
  update_pkgs $2
  install_pkgs $2
  printf "##########\n\n"
fi

if [ "$1" = "tools" ] ; then
  printf "# Install tools #\n"
  install_zsh
  install_neovim
  install_languages $@
  printf "##########\n\n"
fi

if [ "$1" = "graphic" ] ; then
  printf "# Install graphic #\n"
  exit_if_not_good 2
  install_graphic $2
  printf "##########\n\n"
fi

if [ "$1" == "manager" ]; then
  printf "# Install session manager #\n"
  exit_if_not_good 2
  install_manager $2
  printf "##########\n\n"
fi

if [ "$1" = "help" ] ; then
  printf "Install script : \n\
    -system [name]\n\
    -tools [language list: rust ocaml node python go]\n\
    -graphic [windows manager]\n\
    -manager [session manager]\n"
fi
