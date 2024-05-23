#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#   Sys install script    #
#    Version 20240519     #
###########################

cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "System configuration"
print_root


#-------------- Terminal ------------#

print_section "Terminal"
which curl > /dev/null
if [[ $? -eq 1 ]] ; then
  error_not_found "curl"
  exit 1
fi

print_task "make zsh as default shell"
if [[ "$SHELL" = "/usr/bin/zsh" || "$SHELL" = "/bin/zsh" ]] ; then
    skip_already_installed "zsh"
else
    print_info "setting zsh as default"
    chsh -s /usr/bin/zsh
    print_success "zsh is default: need reboot to take into account"
fi 

print_task "add Starship"
which starship > /dev/null
if [[ $? -eq 1 ]] ; then
  print_info "installing starship"
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  print_success "starship installed"
else
    skip_already_insttalled "starship"
fi

print_task "add oh-my-zsh"
if [ -e "$HOME/.oh-my-zsh" ] ; then
    skip_already_installed "oh-my-zsh"
else
  print_info "run installation scripts"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions \
            $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  print_success "oh-my-zsh installed"
  print_info "create completion directory"
  mkdir -p "$HOME/.oh-my-zsh/completions"
  print_success "oh-my-zsh completion directory add"
fi


#-------------- XOrg ------------#

print_section "Xorg"
print_task "export nocaps"
echo "setxkbmap -option 'ctrl:nocaps'" >> $HOME/.profile
print_task "export shift = capslock"
echo "setxkbmap -option 'shift:both_capslock'" >> $HOME/.profile

