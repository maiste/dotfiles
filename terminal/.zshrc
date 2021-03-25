############################
# Étienne (Maiste ) MARAIS #
#       Shell config       #
#      Version 20210125    #
############################

# Plugins
zstyle :omz:plugins:ssh-agent identities public private
plugins=(git \
         tig \
         sudo \
         ssh-agent \
         colored-man-pages \
         zsh-autosuggestions \
         docker-compose \
         sdk \
         cargo \
         flutter \
         sbt)

# Init env
. "$HOME/.config/zsh/.env"
. "$HOME/.config/zsh/.alias"
. "$ZSH/oh-my-zsh.sh"
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Run the starship prompt
eval "$(starship init zsh)"
