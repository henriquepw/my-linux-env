# Debian based systems
#!/bin/bash

init()
{
  echo "$1: INIT ================="
  echo ""
}

echo "Root mode necessary."

mkdir installation && cd installation
local=$(pwd)

sudo apt-get update -y

###############
# Dependecies #
###############
init DEPENDECIES

sudo bash ./deps.sh

################
# Repositories #
################
init REPOSITORIES

sudo bash ./reps.sh

#################
# installations #
#################
init INSTALLATIONS

# Git
sudo apt-get install git -y

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

sudo chown -R $USER ~/.nvm

# Yarn
sudo apt-get install yarn -y

# vscode
sudo apt-get install code -y
sudo update-alternatives --set editor /usr/bin/code

# Reactotron
wget https://github.com/infinitered/reactotron/releases/download/v2.16.0/Reactotron.2.16.0.AppImage -O reactotron.appimage
chmod +x reactotron.appimage
sudo mv reactotron.appimage ~/Appimages/

cd ~/Appimages && sudo ./reactotron.appimage && cd $local

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

# Discord
wget https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo dpkg -i discord-0.0.9.deb

# Chromium
sudo apt install --assume-yes chromium-browser

# Steam
# wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
# sudo dpkg -i steam_latest.deb

#Virtual Box
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

# Theme
sudo add-apt-repository ppa:daniruiz/flat-remix -y
sudo apt-get update -y
sudo apt-get install flat-remix-gnome -y

# end
sudo apt-get install -f
sudo apt --fix-broken install -y

# oh my zsh - terminal
sudo apt-get install zsh 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo "I recommend reboot the system"