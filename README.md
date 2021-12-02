Heavily inspired from [mathias' dotfiles](https://github.com/mathiasbynens/dotfiles).

## Installation

    git clone https://github.com/bogem/dotfiles && cd dotfiles && source bootstrap.sh

To update, `cd` into your local `dotfiles` repository and then:

    source bootstrap.sh

Alternatively, to update while avoiding the confirmation prompt:

    set -- -f; source bootstrap.sh

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

    export PATH="/usr/local/bin:$PATH"

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Albert Nigmatzianov"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="albertnigma@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

    ./.macos

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

    ./brew.sh

## Install JS tools

    ./npm.sh
