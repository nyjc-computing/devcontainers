#!/bin/bash

# Update package lists
sudo apt-get update

# Install required packages
sudo apt-get install -y bash git curl

# Install GitHub CLI
deb_keyring="/usr/share/keyrings/githubcli-archive-keyring.gpg"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee $deb_keyring > /dev/null
echo "deb [signed-by=$deb_keyring] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install -y gh
