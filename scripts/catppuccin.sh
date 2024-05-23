#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#  Catpuccin get script   #
#    Version 20240521     #
###########################

set -ue
cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "Catpuccin configuration"
print_root

#-------------- BAT ------------#

print_section "Bat Catppuccin"
if [ -e "$HOME/$(bat --config-dir)/themes/Catppuccin\ Macchiato.tmTheme" ] ; then
    skip_already_installed "bat catppuccin themes"
else
    print_task "Create bat themes/ directory"
    mkdir -p "$(bat --config-dir)/themes"
    print_task "Get themes"
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
    print_task "Build bat cache"
    bat cache --build
fi

