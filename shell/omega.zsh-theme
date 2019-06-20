##############
#  ZSH Theme #
#   Maiste   #
##############


#Modification of lambda-gitster them

# Return statut color
local ret_status="%(?:%{$fg_bold[yellow]%} ▶:%{$fg_bold[red]%} ▶%s)%{$reset_color%}"

# User
if [[ $UID -eq 0 ]]; then
  local me="%{$fg_bold[red]%}god"
else
  local me="%{$fg[green]%}%n%{$fg_bold[green]%}@%m%{$reset_color%}"
fi

# Get Path
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%3~ # Max 3 stages
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

# Defin zsh prompt
PROMPT='
$me %{$fg[cyan]%}[$(get_pwd)] $(git_prompt_info)%{$reset_color%}
$(virtualenv_prompt_info)$ret_status '

# Git color and update
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"

# Update for virtualenv
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[blue]%}"
ZSH_THEME_VIRTUALENV_SUFFIX=" %{$reset_color%}"
