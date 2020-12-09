#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if ls ~/.ssh/id_rsa 2>/dev/null
then
    echo "SSH Key already exists"

else
    # generate ssh Key
    echo "Generate ssh Key"
    ssh-keygen -t rsa -b 4096 -C "larseichler.le@gmail.com"

    # add key to ssh agent
    echo "Add generated Key to ssh-agent"
    ssh-add ~/.ssh/id_rsa
fi