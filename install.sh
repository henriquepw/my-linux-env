# Debian based systems
#!/bin/bash

echo "Root mode necessary."

local=$(pwd)

sudo apt-get update -y

###############
# Dependecies #
###############

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
    libqt5scripttools5 -y

wget https://mirrors.kernel.org/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.8_amd64.deb -y
wget http://ftp.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb -y 

dpkg -i libicu52_52.1-3ubuntu0.8_amd64.deb  -y
dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb -y

sudo apt-get install openjdk-8-jre -y

# Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

[ -d ~/Pictures/icons ] || sudo mkdir ~/Pictures/icons -y

################
# Repositories #
################

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/  -y
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' -y

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# vlc
sudo add-apt-repository ppa:videolan/master-daily -y

sudo apt-get update -y
sudo apt update -y

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Mint tessa   -> bionic
# Ubuntu 19.04 -> Cosmic 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

#################
# installations #
#################

# Git
sudo apt-get install git -y

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

# Yarn
sudo apt-get install yarn -y

# vscode
sudo apt-get install code -y
sudo update-alternatives --set editor /usr/bin/code

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

# Arduino
wget https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz
tar xf arduino*.tar.xz
sudo rm arduino*.tar.xz

sudo mv arduino* /opt
sudo bash /opt/arduino*/install.sh

# Firefox Dev 
wget https://download-installer.cdn.mozilla.net/pub/devedition/releases/68.0b4/linux-x86_64/en-US/firefox-68.0b4.tar.bz2
wget https://upload.wikimedia.org/wikipedia/commons/f/fd/Firefox_Developer_Edition_Logo%2C_2017.png
tar jxf firefox-*.tar.bz2

sudo rm firefox*.tar.bz2
sudo mv firefox /opt

sudo mv Firefox_Developer_Edition_Logo,_2017.png firefox-dev-icon.png
sudo mv firefox-dev-icon.png ~/Pictures/icons
sudo cp /launchers/Firefox\ dev.desktop /usr/share/applications

# Packet Tracer
[ -d ./packet-tracer ] || mkdir packet-tracer
cd packet-tracer

wget https://downloads.itechtics.com/Packet%20Tracer%207.2.1%20for%20Linux%2064%20bit.tar.gz
wget https://www.etindy.com/sessions/managing-enterprise-networks-with-cisco-prime-infrastructure-nmenpi/icon.png

tar xf Packet*.tar.gz
sudo rm Packet*.tar.gz

sudo mv icon.png packet-icon.png
sudo mv packet-icon.png ~/Pictures/icons

sudo bash install -y
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

# Steam
wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
sudo dpkg -i steam_latest.deb

# cd $local

# end
sudo apt-get install -fy
# sudo apt-get upgrade

# oh my zsh - terminal
sudo apt-get install zsh 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

# I recommend reboot the system