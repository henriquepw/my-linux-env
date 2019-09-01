# Debian based systems
#!/bin/bash

init()
{
  echo "=========================="
  echo "$1: INIT ================="
  echo "=========================="
}

echo "======================="
echo "| Root mode necessary |"
echo "======================="

sudo dpkg-reconfigure gconf2

[ -d ./installation ] || mkdir ./installation
cd installation

local=$(pwd)

sudo apt-get update -y

###############
# Dependecies #
###############
init DEPENDECIES

sudo apt-get install  \
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
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

wget http://mirrors.kernel.org/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.8_amd64.deb
wget http://ftp.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb 

sudo dpkg -i libicu52_52.1-3ubuntu0.8_amd64.deb
sudo dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb

[ -d ~/Pictures/icons ] || mkdir ~/Pictures/icons
[ -d ~/Appimages ] || mkdir ~/Appimages
[ -d ~/Android/Sdk ] || mkdir -p ~/Android/Sdk

sudo apt-get update -y

################
# Repositories #
################
init REPOSITORIES

# Java
sudo add-apt-repository ppa:openjdk-r/ppa

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/  -y
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' -y

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# vlc
sudo add-apt-repository ppa:videolan/master-daily -y

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ask for OS -----
# Mint tessa   -> bionic
# Ubuntu 19.04 -> Cosmic
# Outher       -> lsb_release -cs
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Virtual Box
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

sudo apt-get update -y
sudo apt update -y

#################
# installations #
#################
init INSTALLATIONS

sudo apt-get install \
    openjdk-8-jre \    # JRE 8
    openjdk-8-jdk \    # JDK 8
    git -y             # Git

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

sudo chown -R $USER ~/.nvm # Set owner

# Yarn
sudo apt-get install yarn -y

# vscode
sudo apt-get install code -y
sudo update-alternatives --set editor /usr/bin/code

# Reactotron
wget https://github.com/infinitered/reactotron/releases/download/v2.16.0/Reactotron.2.16.0.AppImage -O reactotron.appimage
chmod +x reactotron.appimage
sudo mv reactotron.appimage ~/Appimages/

cd ~/Appimages
sudo ./reactotron.appimage
cd $local

# MongoDb Compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.18.0_amd64.deb -O compass.deb
sudo dpkg -i compass.deb

# Snap
sudo apt install snapd -y

sudo snap install intellij-idea-community --classic
sudo snap install insomnia
sudo snap install postbird
sudo snap install spotify

# Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
sudo bash ./Anaconda3*.sh
sudo rm Anaconda3*.sh
sudo chown -R $USER ~/anaconda3

# Arduino
wget https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz
tar xf arduino*.tar.xz
sudo rm arduino*.tar.xz

sudo mv arduino* /opt
sudo bash /opt/arduino*/install.sh

# Packet Tracer -> to Fix
[ -d ./packet-tracer ] || mkdir packet-tracer
cd packet-tracer

wget https://downloads.itechtics.com/Packet%20Tracer%207.2.1%20for%20Linux%2064%20bit.tar.gz
wget https://www.etindy.com/sessions/managing-enterprise-networks-with-cisco-prime-infrastructure-nmenpi/icon.png

tar xf Packet*.tar.gz
sudo rm Packet*.tar.gz

sudo mv icon.png packet-icon.png
sudo mv packet-icon.png ~/Pictures/icons

sudo bash ./install -y
cd ..
sudo cp /launchers/Packet\ Tracer.desktop /usr/share/applications

# VLC
sudo apt-get install vlc -y

# Docker
sudo apt-get install \
    docker-ce \
    docker-ce-cli \
    containerd.io -y

sudo groupadd docker
sudo usermod -aG docker $USER

# Databases
sudo docker pull postgres
sudo docker pull mongo
sudo docker pull redis

# Discord
wget https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo dpkg -i discord-0.0.9.deb

# Chromium
sudo apt install --assume-yes chromium-browser

# PuTTY
sudo apt install putty -y 

# Steam
# wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
# sudo dpkg -i steam_latest.deb

# Virtual Box 6
wget https://download.virtualbox.org/virtualbox/6.0.8/virtualbox-6.0_6.0.8-130520~Ubuntu~bionic_amd64.deb
sudo dpkg -i virtualbox-6.0_6.0.8-130520_Ubuntu_bionic_amd64.deb

# Genymotion for fun
wget https://dl.genymotion.com/releases/genymotion-3.0.2/genymotion-3.0.2-linux_x64.bin
sudo chmod +x ./genymotion-3.0.2-linux_x64.bin

sudo mv genymotion-3.0.2-linux_x64.bin /opt/genymotion.bin
cd /opt && ./genymotion.bin -y

cd $local

# Gnome Tweak
sudo apt install gnome-tweak-tool -y
sudo apt install chrome-gnome-shell -y

# end
sudo apt-get install -f
sudo apt --fix-broken install -y

# oh my zsh - terminal
sudo apt-get install zsh 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

bash ./zsh_config.sh

echo "================================="
echo "| I recommend reboot the system |"
echo "================================="