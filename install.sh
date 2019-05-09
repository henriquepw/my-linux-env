#!/bin/bash

echo "Para instalar esses programas é preciso entrar no modo sudo"

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
source ~/.profile

nvm ls-remote

echo "Digite a versão do node a ser instalada, ex: v10.15.3: "
read version
nvm install $version
nvm use $version

sudo npm install npm -g

# Yarn
sudo apt-get install yarn

# Create React App
sudo npm install -g create-react-app

# vscode
sudo apt-get install code
sudo update-alternatives --set editor /usr/bin/code

# Snap
sudo apt install snapd
sudo snap install intellij-idea-community --classic
sudo snap install gitkraken
sudo snap install insomnia

# Anaconda    : https://repo.anaconda.com/archive/Anaconda3-2019.03-MacOSX-x86_64.sh
# Firefox Dev : https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US
# Arduino     : https://www.arduino.cc/download_handler.php

