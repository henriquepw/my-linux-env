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

# Discord
wget https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo dpkg -i discord-0.0.9.deb

# Chromium
sudo apt install --assume-yes chromium-browser

# Steam
# wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
# sudo dpkg -i steam_latest.deb

# cd $local

# Gnome Tweak
sudo apt install gnome-tweak-tool -y
sudo apt install chrome-gnome-shell -y

# Icons
sudo add-apt-repository -u ppa:snwh/ppa -y
sudo apt install paper-icon-theme -y

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