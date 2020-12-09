#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install stow

# Install zsh
brew install zsh

# Install svn
brew install svn

# Apps
apps=(
  alfred
  brave-browser
  google-chrome
  franz
  homebrew/cask-versions/firefox-developer-edition
  iterm2
  kaleidoscope
  slack
  spotify
  tower
  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew install --cask --appdir="/Applications" ${apps[@]}

# fonts
brew tap homebrew/cask-fonts
fonts=(
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
brew install ${fonts[@]}

# Install MAS CLI
brew install mas

echo "Installing App Store Applications"

# soulver
mas install 413965349

# Hyperdock
mas install 449830122

# Remove outdated versions from the cellar.
brew cleanup