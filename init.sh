#!/usr/bin/env bash

# Install Homebrew components
sh brew.sh

# Add ssh-key
sh addssh.sh

# Install Zgen and ZSH Quickstart Kit
sh zgen.sh

# Copy hyper Settings
cp ./.hyper.js /Users/$(whoami)

# Copy EURKey Keyboard Layout
cp ./EurKey\ -\ modified-us.keylayout /Users/$(whoami)/Lirary/Keyboard\ Layouts

# Set macOS Settings
sh .macos.sh