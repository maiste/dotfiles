#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#      Install script     #
#    Version 20210325     #
###########################

set -e
cd "$(dirname $0)"
. "./scripts/logger.sh"

printf "\t+-----------------------------------+\n"
printf "\t|  DISTRIBUTION INSTALLATION SCRIPT |\n"
printf "\t|  AUTHOR: Maiste <dev@maiste.fr>   |\n"
printf "\t|  VERSION: \e[1;31m20240522\e[0m                |\n"
printf "\t|  LICENCE: MIT                     |\n"
printf "\t+-----------------------------------+\n\n"


print_header "preinstall"
print_task "check distribution"
if [ -f /etc/os-release ]; then
# Load installation from $ID in /etc/os-release
    . /etc/os-release
fi

print_task "cache sudo"
sudo -v

#-------------- Distro posinstall ------------#

case "$ID" in
  "arch")
    ./scripts/arch-install.sh;;
  "fedora")
    ./scripts/fedora-install.sh;;
  *)
    print_warning "no post installation for $ID"
esac


#-------------- Run install ------------#

./scripts/system.sh
./scripts/link.sh
./scripts/language.sh
./scripts/catppuccin.sh

./scripts/flatpak.sh
# ./scripts/nix.sh

