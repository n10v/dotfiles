#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install native apps
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install some usual programs
brew install youtube-dl
brew cask install adapter
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-drive
brew cask install imagealpha
brew cask install imageoptim
brew cask install opera
brew cask install selfcontrol
brew cask install skype
brew cask install the-unarchiver
brew cask install torbrowser
brew cask install transmission
brew cask install tunnelblick
brew cask install vlc

# Install some dev tools
brew install ctags
brew install curl
brew install git
brew install graphviz # Need for go tool pprof
brew install openssl
brew install python
brew install python3
brew install ruby
brew install tmux
brew install tree
brew install vim --with-override-system-vi
brew cask install atom
brew cask install iterm2
brew cask install wireshark

# Cleanup
brew cask cleanup
brew cleanup

echo "Install manually:"
echo "  * Go
echo "  * Pocket"
echo "  * Syncthing"
