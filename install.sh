#!/bin/bash

echo "Root mode necessary."

sudo apt-get update

sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# Debian based systems

################
# Repositories #
################

# vscode repository
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# yarn repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt update

# installations
sudo apt-get install apt-transport-https
sudo apt-get install openjdk-8-jre
sudo apt-get install git

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

# Yarn
sudo apt-get install yarn

# vscode
sudo apt-get install code
sudo update-alternatives --set editor /usr/bin/code

# Snap
sudo apt install snapd
sudo snap install intellij-idea-community --classic
sudo snap install gitkraken
sudo snap install insomnia

# Anaconda
curl https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh | sudo bash

# Firefox Dev : https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US
# Arduino     : https://www.arduino.cc/download_handler.php

