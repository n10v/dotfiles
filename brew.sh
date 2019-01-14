#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install some usual programs
brew install safe-rm
brew install youtube-dl
brew cask install adapter
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install opera
brew cask install skype
brew cask install the-unarchiver
brew cask install torbrowser
brew cask install transmission
brew cask install vlc

# Install some dev tools
brew install bat
brew install cloc
brew install ctags
brew install curl
brew install fd
brew install ffmpeg
brew install fzf
brew install git
brew install go
brew install httpie
brew install neovim
brew install node
brew install openssl
brew install python
brew install python3
brew install ruby
brew install the_silver_searcher
brew install tmux
brew install tree
brew install yarn
brew cask install iterm2
brew cask install wireshark

# Cleanup
brew cleanup

echo "Install manually:"
echo "* Pocket"
echo "* github.com/sindresorhus/macos-trash"
