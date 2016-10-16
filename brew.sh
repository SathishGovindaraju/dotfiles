#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
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

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install git
brew install nvm
brew install tree

# Remove outdated versions from the cellar.
brew cleanup

# install latest LTS node
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"

nvm install --lts
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

# install cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install useful casks.
brew cask install alfred
brew cask install caffeine
brew cask install charles
brew cask install cheatsheet
brew cask install cleanmymac
brew cask install dash
brew cask install dashlane
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install franz
brew cask install gitup
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install iterm2-beta
brew cask install lastfm
brew cask install macdown
brew cask install macpaw-gemini
brew cask install opera
brew cask install shades
brew cask install skype
brew cask install slowy
brew cask install spectacle
brew cask install spotify
brew cask install sublime-text
brew cask install tower
brew cask install virtualbox

# Remove outdated versions from the cask cellar.
brew cask cleanup
