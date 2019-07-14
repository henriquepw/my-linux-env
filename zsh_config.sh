#!/bin/bash

sudo chown -R $USER ~/.oh-my-zsh
sudo chown -R $USER ~/.zplugin

chsh -s /bin/zsh

# Colors
sudo apt-get install dconf-cli -y

git clone https://github.com/dracula/zsh.git
ln -s $DRACULA_THEME/dracula.zsh-theme $OH_MY_ZSH/themes/dracula.zsh-theme

# Theme
git clone https://github.com/denysdovhan/spaceship-prompt.git \
    "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Puglins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

mv ~/.zshrc ./config/cp.zshrc
cp ./config/.zshrc ~