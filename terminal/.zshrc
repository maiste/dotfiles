############################
#  Maiste <dev@maiste.fr>  #
#       Shell config       #
#      Version 20230511    #
############################

# Uncomment to analyse ZSH startup (1)
# zmodload zsh/zprof

# Set nvm plugin as lazy
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd typescript prettier nvim vim dune opam
zstyle ':omz:plugins:ssh-agent' lazy

# Plugins
plugins=(sudo \
         ssh-agent \
         nvm \
         colored-man-pages \
         zsh-syntax-highlighting \
         zsh-autosuggestions )

# Init
. "$HOME/.config/zsh/env"
. "$HOME/.config/zsh/alias"
. "$HOME/.config/zsh/functions"

# Init zoxyde
eval "$(zoxide init zsh)"

# Print banner
cat "$HOME/.config/zsh/banner"

# Run the starship prompt
eval "$(starship init zsh)"

# Uncomment to analyse ZSH startup (2)
# zprof
# Run exec zsh to avoid issue when profiling (3)

# dune
source $HOME/.local/share/dune/env/env.zsh
