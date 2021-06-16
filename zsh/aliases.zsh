alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# Aliases
alias vim="nvim"
alias top="vtop --theme=wizard"

# Replaced with https://github.com/Peltoche/lsd
# alias ls="colorls -lA --sd"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Allow for 'local', i.e. not checked into dotfiles repo aliases
if [ -e "$HOME/.aliases.local" ] ; then
  source "$HOME/.aliases.local"
fi
