##################
# Étienne MARAIS #
#  shell config  #
##################


export DOT=~/dotfiles/

# Theme
ZSH_THEME="omega"

# Plugins
plugins=(git sudo ssh-agent npm virtualenv)

# Init with oh-my-zsh
. "$DOT/shell/.env"
. "$ZSH/oh-my-zsh.sh"
. "$DOT/shell/.alias"

#todo.txt list
