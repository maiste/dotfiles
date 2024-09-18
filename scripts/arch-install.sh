#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#    Arch Post install    #
#    Version 20240518     #
###########################

cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "Arch post installation"
print_root

print_section "pacman"

# Upgrade package
print_task "update pacman packages"
sudo pacman -Syu

TERMINAL_PKGS="foot\
ttf-jetbrains-mono-nerd \
ttf-hack \
ttf-font-awesome \
fastfetch"

# Install packages
SWAY_PKGS="sway \
swaybg \
swaylock \
wl-clipboard \
waybar \
kanshi \
dunst \
brightnessctl \
arc-gtk-theme \
papirus-icon-theme \
lxappearance \
network-manager-applet \
xdg-desktop-portal \
xdg-desktop-portal-wlr \
mpv \
imv \
glow \
ranger"

SYS_PKGS="stow \
zsh \
mosh \
curl \
wget \
zip \
unzip \
htop \
bluez \
bluez-utils \
blueberry \
pavucontrol \
flatpak  \
cups \
hplip \
fwupd"

DEV_PKGS="neovim \
python-pip \
python-pynvim \
gcc \
make \
git \
tig \
m4 \
patch \
diffutils \
bubblewrap \
docker \
docker compose \
strace \
hyperfine \
zeal"

TOOL_PKGS="fzf \
ripgrep \
bat \
tree \
eza \
fd \
zoxyde \
git-delta \
pandoc \
texlive \
texlive-xetex \
texlive-latexmk \
zathura \
zathura-pdf-mupdf \
grim \
slurp \
obsidian \
simple-scan \
calibre \
libreoffice-fresh \
torbrowser-launcher \
transmission-gtk \
firefox"

AUR_PKGS="fswatch \
wlay \
tofi"

PACMAN_PKGS="$SYS_PKGS $SWAY_PKGS $DEV_PKGS $TOOL_PKGS"

print_task "pacman packages"
sudo pacman -Sy --noconfirm $PACMAN_PKGS


# --- Install Yay -- #

print_section "yay"

print_task "install yay"
which "yay" > /dev/null
if [[ $? -eq 1 ]] ; then
    print_info "install Yay"
    cd /tmp
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ../
    print_info "delete yay temporary directory"
    rm -rf yay
    print_success "yay installed"
else
    skip_already_installed "yay"
fi

# Install AUR packages
print_task "installing AUR packages"
yay -Sy $AUR_PKGS
print_success "AUR packages installed"
