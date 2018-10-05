#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install zgen
git clone git@github.com:tarjoilija/zgen.git /Users/larseichler/zgen

# Install ZSH Quickstart kit
git clone git@github.com:unixorn/zsh-quickstart-kit.git /Users/larseichler/zsh-quickstart-kit

cd zsh-quickstart-kit
stow --target=/Users/larseichler /Users/larseichler/zsh-quickstart-kit/zsh

# Copy ZSH Settings
cp ./.zshrc.d /Users/larseichler