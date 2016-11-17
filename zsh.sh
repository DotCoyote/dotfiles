#!/usr/bin/env bash

# Install ZSH Settings

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install zsh quickstart-kit
brew install stow

# Change the user login default shell to zsh
chsh -s /usr/local/bin/zsh

# Insall Zgen
cd ~
git clone git@github.com:tarjoilija/zgen.git

# Install the starter kit
git clone git@github.com:unixorn/zsh-quickstart-kit.git

# Configure zsh by symlinking the .zshrc, .zsh_aliases and .zsh-completions from this repo into your ~.
cd zsh-quickstart-kit
stow --target=/Users/$(whoami) zsh