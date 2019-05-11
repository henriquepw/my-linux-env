#!/bin/bash

sudo apt-get update

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo "---------"



nvm install node
nvm use node --lts

sudo npm install npm -g
version=$(nvm ls | head -n1 | -dv -f2)
npm="~/.nvm/versions/node/$version/node_modules/npm/bin/npm"

# Create React App
sudo npm install -g create-react-app
