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
brew cask install adapter
brew cask install gimp
brew cask install google-chrome
brew cask install google-drive
brew cask install lantern
brew cask install skype
brew cask install the-unarchiver
brew cask install torbrowser
brew cask install transmission
brew cask install tunnelblick
brew cask install vlc
brew install youtube-dl

# Install some dev tools
brew cask install atom
brew cask install imagealpha
brew cask install imageoptim
brew cask install iterm2
brew install ctags
brew install curl
brew install git
brew install graphviz
brew install vim --with-override-system-vi

# Cleanup
brew cask cleanup
brew cleanup

# Make symlinks to dotfiles
for file in .{bash_profile,.bashrc,bash_prompt,exports,aliases,functions,vimrc,gitconfig,gitignore}; do
	rm ~/$file 2>/dev/null
	ln -s ~/dotfiles/$file ~/$file
done;
unset file;

echo "Install manually:"
echo "  * Go
echo "  * Google Chrome Canary"
echo "  * Pocket"
echo "  * Syncthing"
