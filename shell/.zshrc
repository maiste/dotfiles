############################
# Étienne (Maiste ) MARAIS #
#       shell config       #
############################


export DOT=~/.dotfiles/

# Theme
ZSH_THEME="omega"

# zsh plugins management
zstyle :omz:plugins:ssh-agent identities id_rsa github

# Plugins
plugins=(git sudo ssh-agent npm virtualenv)

# Init with oh-my-zsh
. "$DOT/res/.env"
. "$DOT/res/.alias"
. "$ZSH/oh-my-zsh.sh"

#todo.txt list
