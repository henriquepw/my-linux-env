#!/bin/bash

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

wget http://mirrors.kernel.org/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.8_amd64.deb
wget http://ftp.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb 

sudo dpkg -i libicu52_52.1-3ubuntu0.8_amd64.deb
sudo dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb

sudo apt-get install openjdk-8-jre -y

# Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

[ -d ~/Pictures/icons ] || mkdir ~/Pictures/icons

sudo apt-get update -y
