#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

read -p "SSH E-Mail-Address: " mail

# generate ssh Key
echo "Generate SSH Key"
ssh-keygen -t rsa -b 4096 -C $mail

# add key to ssh agent
echo "Add generated Key to ssh-agent"
ssh-add ~/.ssh/id_rsa