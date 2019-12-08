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

brew install \
             bat \
             cloc \
             ctags \
             curl \
             fd \
             ffmpeg \
             fzf \
             git \
             gnu-sed \
             go \
             httpie \
             neovim \
             node \
             openssl \
             python \
             python3 \
             pv \
             ruby \
             safe-rm \
             the_silver_searcher \
             thefuck \
             tldr \
             tmux \
             tree \
             yarn \
             youtube-dl \
             watch \

brew cask install \
                  adapter \
                  docker \
                  dropbox \
                  firefox \
                  gimp \
                  google-chrome \
                  imagealpha \
                  imageoptim \
                  iterm2 \
                  kap \
                  numi \
                  opera \
                  skype \
                  the-unarchiver \
                  torbrowser \
                  transmission \
                  vlc \
                  wireshark \

# Cleanup
brew cleanup

echo "Install manually:"
echo "* github.com/sindresorhus/macos-trash"
