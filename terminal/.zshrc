############################
# Étienne (Maiste ) MARAIS #
#       Shell config       #
#      Version 20210125    #
############################

# Plugins
zstyle :omz:plugins:ssh-agent identities public private maiste_pub
plugins=(sudo \
         ssh-agent \
         colored-man-pages \
         zsh-autosuggestions)

# Init env
. "$HOME/.config/zsh/.env"
. "$ZSH/oh-my-zsh.sh"
. "$HOME/.config/zsh/.alias"

# Print banner
cat "$HOME/.config/zsh/banner"

# Run the starship prompt
eval "$(starship init zsh)"

