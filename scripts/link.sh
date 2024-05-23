#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#      Linking script     #
#    Version 20240519     #
###########################

cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "Linking configuration"
print_root



#-------------- Remove ------------#

print_section "remove links"

function remove_link () {
  print_info "remove $1\n"
  rm -rf "$1"
}

print_task "removing links"
remove_link "$HOME/.config/zsh"
remove_link "$HOME/.zshrc"
remove_link "$HOME/.gitconfig"
remove_link "$HOME/.Xresources"
remove_link "$HOME/.config/foot"
remove_link "$HOME/.config/alacritty"
remove_link "$HOME/.config/starship"
remove_link "$HOME/.config/sway"
remove_link "$HOME/.config/kanshi"
remove_link "$HOME/.config/dunst"
remove_link "$HOME/.config/tofi"
remove_link "$HOME/.config/asset"
remove_link "$HOME/.berkelium"
remove_link "$HOME/.config/nvim"



#-------------- Install ------------#

print_section "install links"

function install_link () {
  print_info "link bundle $1"
  stow -v $1
}

print_task "installing bundle with stow"
install_link "terminal"
install_link "desktop"
install_link "editor"
install_link "asset"
