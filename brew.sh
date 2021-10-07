#!/bin/bash

brew update
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Bash 5.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/opt/homebrew/bin/bash' /etc/shells; then
  echo '/opt/homebrew/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# CLI apps
brew install \
             bat \
             curl \
             fd \
             git \
             gnu-sed \
             macos-trash \
             node \
             python \
             safe-rm \
             thefuck \
             tldr \
             yarn \
             youtube-dl \
             vim \
             watch \

# Desktop apps
brew install \
             adapter \
             dropbox \
             gimp \
             imagealpha \
             imageoptim \
             kap \
             numi \
             skype \
             vlc \

brew cleanup