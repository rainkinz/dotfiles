# Brendan's dotfiles

I originally forked [Zack Holman's](https://github.com/holman/)' comprehensive
[dotfiles](https://github.com/holman/dotfiles) and have been slowly adding
my own tweaks to suit my own preferences. You're probably looking for what he
has as a good starting point.

Most of the rest is a copy of Zach's README:

## Topical

See Zach Holman's post on why you might want to create a system around a
topic areas [dotfiles are meant to be forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/holman/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](https://caskroom.github.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## Todo

* Change the symlinking to be explicit as per:
  https://github.com/nicksp/dotfiles/blob/master/setup.sh#L171

## bugs

* tmux doesn't scroll back properly

https://stackoverflow.com/questions/12865559/leaving-tmux-scrollback-in-terminal-iterm2


## Thanks

* I originally forked [Zack Holman's](https://github.com/holman/)' comprehensive
  [dotfiles](https://github.com/holman/dotfiles) and have been slowly adding
  my own tweaks to suit my own preferences.

* I like keep an eye on [Nick Plekhanov’s](https://github.com/nicksp/)
  [dotfiles](https://github.com/nicksp/dotfiles) for inspiration.

* tmux config copied from here: https://github.com/hjwp/dotfiles/blob/master/.tmux.conf
