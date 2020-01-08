alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# Aliases
alias vim="nvim"
alias top="vtop --theme=wizard"
alias ls="colorls -lA --sd"

# Allow for 'local', i.e. not checked into dotfiles repo aliases
if [ -e "$HOME/.aliases.local" ] ; then
  source "$HOME/.aliases.local"
fi
