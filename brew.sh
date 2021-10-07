#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Bash 5.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

brew install \
             bat \
             curl \
             fd \
             git \
             gnu-sed \
             go \
             node \
             openssl \
             python \
             safe-rm \
             thefuck \
             tldr \
             yarn \
             youtube-dl \
             vim \
             watch \

brew cask install \
                  adapter \
                  dropbox \
                  gimp \
                  google-chrome \
                  imagealpha \
                  imageoptim \
                  iterm2 \
                  kap \
                  numi \
                  skype \
                  vlc \

# Cleanup
brew cleanup

echo "Install manually:"
echo "* github.com/sindresorhus/macos-trash"
