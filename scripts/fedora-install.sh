#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#   Fedora Post install   #
#   Version 20240521      #
###########################


cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "Fedora post installation (WIP & broken)"
print_root

print_section "dnf"

# Add rpm fusion repo
print_task "add RPM Fusion packages"
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add external copr

# Update packages
print_task "updating dnf packages"
sudo dnf upgrade -y


TERMINAL_PKGS="foot\
ttf-jetbrains-mono-nerd \
source-foundry-hack-fonts.\
fastfetch" # condition with alacritty + check monosapace from GitHub

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
imv"
# TODO: ajouter les tools pour le screensharing

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
blueberry"

DEV_PKGS="neovim \
python-pip \
gcc \
make \
git \
tig \
m4 \
patch \
diffutils \
bubblewrap"

TOOL_PKGS="fzf \
ripgrep \
bat \
tree \
exa \
fd \
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
firefox"


# Install packages
DNF_PKGS="$SYS_PKGS $SWAY_PKGS $DEV_PKGS $TOOL_PKGS"

print_task "install dnf package"
sudo dnf install -y $DNF_PKGS

# Install JetBrains Mono Nerd

print_task "install jet brain mono nerd font"
mkdir -p ~/.local/share/fonts
cd "$HOME/.local/share/fonts"
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
xz -d JetBrainsMono.tar.xz
tar xvf JetBrainsMono.tar
# TODO Copy files

