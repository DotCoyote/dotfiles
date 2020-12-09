#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cwd=$(pwd)

# Set ZSH as shell
chsh -s /usr/local/bin/zsh

# Install Zgen
cd ~ && git clone git@github.com:tarjoilija/zgen.git

cd ~ && git clone git@github.com:unixorn/zsh-quickstart-kit.git

cd ~/zsh-quickstart-kit && stow --target=/Users/larseichler zsh

yes | cp -r "$cwd/partials/.zshrc.d" ~/

echo "Close and Restart Terminal to make changes affect. Then run zsh-quickstart-select-bullet-train to select correct zsh theme."