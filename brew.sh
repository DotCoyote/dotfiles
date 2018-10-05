#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew initially
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install stow
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install zsh
brew install zsh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install MAS CLI
brew install mas

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install imagemagick --with-webp
brew install p7zip
brew install rename
brew install webkit2png
brew install zopfli

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node

# Install NVM instead
brew install nvm

# Install yarn
brew install yarn

# Install Cask
brew install caskroom/cask/brew-cask

# Apps
apps=(
  1password
  alfred
  appcleaner
  bear
  flux
  franz
  homebrew/cask-versions/firefox-developer-edition
  google-chrome
  hyper
  istat-menus
  jumpshare
  kaleidoscope
  opera
  postman
  quicklook-json
  sequel-pro
  slack
  soulver
  spotify
  sublime-text3
  tower
  transmit
  virtualbox
  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package


# fonts
brew tap caskroom/fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-input
  font-source-code-pro
  font-source-sans-pro
  font-open-sans-condensed
  font-open-sans
  font-inconsolata
  font-fira-sans
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# install gulp
echo "installing gulp"
yarn global add gulp

echo "Installing App Store Applications"
mas signin larseichler.le@gmail.com

# Bear
mas install 1091189122

# soulver
mas install 413965349

# Hyperdock
mas install 449830122

# Remove outdated versions from the cellar.
brew cleanup
