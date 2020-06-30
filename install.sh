#!/bin/bash
# Debian based systems

init()
{
  echo "-"
  echo "| $1: INIT ---------------"
  echo "-"
}

mkdir -p ./installation
cd installation

local=$(pwd)

sudo aptitude install gconf2 -y
sudo dpkg-reconfigure gconf2
sudo aptitude update -y
 
# Mint tricia, tessa or tina    -> bionic
# Ubuntu 20.04          -> bionic or eoan
# Outher                -> lsb_release -cs
version=$(lsb_release -cs)

# For Linux Mint
if [ $version = "tricia" ] || [ $version = "tina" ] || [ $version = "tessa" ]; then
  version="bionic"
fi

# Form Ubunto 20.04
if [ $version = "focal" ]; then
  version="bionic"
fi

#if [ $version = "eoan" ]; then
#  version="disco"
#fi

###############
# Dependecies #
###############
init DEPENDECIES

sudo aptitude install  \
    libgl1-mesa-glx \
    libegl1-mesa  \
    libxrandr2  \
    libxrandr2  \
    libxss1  \
    libxcursor1  \
    libxcomposite1  \
    libasound2  \
    libxi6  \
    libxtst6  \
    xz-utils \
    libqt5webkit5  \
    libqt5multimedia5  \
    libqt5xml5  \
    libqt5script5 \
    libqt5scripttools5 \
    gcc-multilib \
    lib32z1 \
    lib32stdc++6 \
    g++ -y

# Docker
sudo aptitude install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

sudo wget http://mirrors.kernel.org/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.8_amd64.deb \
  -O libicu52.deb

sudo wget http://ftp.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb \
  -O libpng12.deb

sudo dpkg -i libicu52.deb
sudo dpkg -i libpng12.deb

mkdir -p ~/Pictures/icons
mkdir -p ~/AppImages
mkdir -p ~/Android/Sdk

sudo aptitude update -y

################
# Repositories #
################
init REPOSITORIES

# Java
sudo add-apt-repository ppa:openjdk-r/ppa

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $version \
#   stable"
echo -e "\ndeb [arch=amd64] https://download.docker.com/linux/ubuntu $version stable" | \
  sudo tee -a /etc/apt/sources.list

sudo aptitude update -y

#################
# installations #
#################
init INSTALLATIONS

sudo aptitude install \
    openjdk-8-jre \    # JRE 8
    openjdk-8-jdk \    # JDK 8
    git -y             # Git

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

# Yarn
sudo aptitude install yarn -y

# Reactotron
sudo wget https://github.com/infinitered/reactotron/releases/download/v2.17.1/Reactotron-2.17.1.AppImage \
  -O reactotron.AppImage

sudo chmod +x reactotron.AppImage
sudo mv reactotron.AppImage ~/AppImages/

cd ~/AppImages
sudo ./reactotron.AppImage
cd $local

# MongoDb Compass
sudo wget https://downloads.mongodb.com/compass/mongodb-compass_1.20.5_amd64.deb -O compass.deb
sudo dpkg -i compass.deb

# Snap
sudo aptitude install snapd -y

sudo snap install --classic code # VS Code
sudo snap install intellij-idea-community --classic
sudo snap install insomnia
sudo snap install postbird

# Social
sudo snap install discord
sudo snap install slack --classic
sudo snap install zoom-client

# Media
sudo snap install obs-studio
sudo snap install spotify
sudo snap install vlc

# Photo editor
sudo snap install krita

# Arduino
sudo wget https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz -O arduino.tar.xz
tar xf arduino.tar.xz
sudo rm arduino.tar.xz

sudo mv arduino* /opt
sudo bash /opt/arduino*/install.sh

# Docker
sudo aptitude install \
    docker-ce \
    docker-ce-cli \
    containerd.io -y

sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Compose
sudo wget -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Databases
sudo docker pull influxdb
sudo docker pull postgres
sudo docker pull mongo
sudo docker pull redis

# Virtual Box 6
sudo wget https://download.virtualbox.org/virtualbox/6.1.6/virtualbox-6.1_6.1.6-137129~Ubuntu~${version}_amd64.deb -O vmbox.deb
sudo dpkg -i vmbox.deb

# Genymotion for fun
sudo wget https://dl.genymotion.com/releases/genymotion-3.0.2/genymotion-3.0.2-linux_x64.bin -O genymotion.bin
sudo chmod +x ./genymotion.bin

sudo mv genymotion.bin /opt/genymotion.bin
cd /opt && ./genymotion.bin

cd $local

# Hyper Terminal
sudo wget https://github.com/zeit/hyper/releases/download/3.0.2/hyper_3.0.2_amd64.deb -O hyper.deb
sudo dpkg -i hyper.deb

# Finishing
sudo aptitude install -fy 
sudo aptitude --fix-broken install -y
sudo aptitude autoremove -y

sudo chown -R $USER ~/*

# oh my zsh - terminal
sudo aptitude install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

bash ./zsh_config.sh

echo "================================="
echo "| I recommend reboot the system |"
echo "================================="
