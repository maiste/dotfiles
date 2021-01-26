############################
# Étienne (Maiste ) MARAIS #
#       Shell config       #
#      Version 20210125    #
############################

# Theme
ZSH_THEME="omega"

# zsh plugins management
zstyle :omz:plugins:ssh-agent identities public private

# Plugins
plugins=(git \
         sudo \
         ssh-agent \
         npm \
         colored-man-pages \
         virtualenv)

# Init with oh-my-zsh
. "$HOME/.env"
. "$HOME/.alias"
. "$ZSH/oh-my-zsh.sh"
. "$HOME/.nix-profile/etc/profile.d/nix.sh"
