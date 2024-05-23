#!/usr/bin/env bash

#############################
#   Maiste <dev@maiste.fr>  #
#  Flatpak install script   #
#     Version 20240519      #
#############################

set -e

cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "Flapak configuration"
print_root


FLATPAK_PKGS="org.signal.Signal \
com.valvesoftware.Steam"

#---- Add remotes ----#

print_section "flatpak remotes"
print_task "add flathub remote"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
print_success "added flathub remote"


#---- Install Flatpak packages ----#

print_section "flapak packages"
print_task "installing flatpak packages"
for PKG in $FLATPAK_PKGS; do
    print_info "install $PKG"
done
flatpak install -y flathub $FLATPAK_PKGS
print_success "installed flatpak packages"

