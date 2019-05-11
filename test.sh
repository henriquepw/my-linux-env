#!/bin/bash

sudo apt-get update

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo "---------"
. ~/.profile

echo "source ~/.profile"

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
