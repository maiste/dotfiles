#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#    Nix install script   #
#    Version 20240519     #
###########################

cd "$(dirname $0)/.."

. "./scripts/logger.sh"

print_section "nix configuration"
print_root

NIX_PKGS="signal-desktop"


#-------- Install Nix --------#

print_section "nix package manager"
print_task "install Nix"
which "nix-env" > /dev/null # Check if nix exists
if [[ $? -eq 1 ]] ; then
  warning_not_found "nix"
  which curl > /dev/null # Check if curl exists
  if [[ $? -eq 0 ]] ; then
    print_info "installing Nix"
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    print_success "nix installed"
  else
    error_not_found "curl"
    exit 1
  fi
else
    skip_already_installed "nix"
fi


#----- Ensure Nix in path -----#

print_task "source Nix in path"
. "$HOME/.nix-profile/etc/profile.d/nix.sh"


#------ Install packages ------#

export NIXPKGS_ALLOW_UNFREE=1

print_task "nix packages"
for PKG in $NIX_PKGS; do
    print_info "Install $PKG"
done

nix-env -i "$NIX_PKGS"
print_success "install nix packages"
