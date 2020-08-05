############################
# Étienne (Maiste ) MARAIS #
#       shell config       #
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
