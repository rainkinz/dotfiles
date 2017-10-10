alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# Allow for 'local', i.e. not checked into dotfiles repo aliases
if [ -e "$HOME/.aliases.local" ] ; then
  source "$HOME/.aliases.local"
fi
