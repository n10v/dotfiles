#!/bin/bash

# Install native apps
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Usual programs
brew cask install adapter
brew cask install chrome
brew cask install gimp
brew cask install google-drive
brew cask install lantern
brew cask install skype
brew cask install spectacle
brew cask install torbrowser
brew cask install transmission
brew cask install tunnelblick
brew cask install vlc
brew install taglib
brew install the-unarchiver
brew install youtube-dl

# Dev
brew cask install atom
brew cask install imagealpha
brew cask install imageoptim
brew cask install iterm2
brew install bash
brew install ctags
brew install curl
brew install git
brew install go
brew install graphviz
brew install vim --with-lua

# Cleanup
brew cask cleanup
brew cleanup

# Add symlinks to dotfiles
rm ~/.bash_profile
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
rm ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

echo "Install manually:"
echo "  * Pocket"
echo "  * Syncthing"
