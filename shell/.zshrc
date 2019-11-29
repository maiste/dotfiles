############################
# Étienne (Maiste ) MARAIS #
#       shell config       #
############################

# Theme
ZSH_THEME="omega"

# zsh plugins management
zstyle :omz:plugins:ssh-agent identities ssh_rsa git_rsa ip7_rsa

# Plugins
plugins=(git sudo ssh-agent npm virtualenv)

# Init with oh-my-zsh
. "./.env"
. "./.alias"
. "$ZSH/oh-my-zsh.sh"

