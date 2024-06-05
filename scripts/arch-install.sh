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
hplip"

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
strace"

TOOL_PKGS="fzf \
ripgrep \
bat \
tree \
exa \
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


# --- Install Paru -- #

print_section "paru"

print_task "install Paru"
which "paru" > /dev/null
if [[ $? -eq 1 ]] ; then
    print_info "install Paru"
    cd /tmp
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ../
    print_info "delete paru temporary directory"
    rm -rf paru
    print_success "aru installed"
else
    skip_already_installed "paru"
fi

# Install AUR packages
print_task "installing paru packages"
paru -Sy $AUR_PKGS
print_success "AUR packages installed"
