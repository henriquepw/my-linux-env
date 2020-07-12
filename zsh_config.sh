#!/bin/bash

sudo chown -R $USER ~/.oh-my-zsh
sudo chown -R $USER ~/.zplugin

chsh -s /bin/zsh

# Colors
sudo aptitude install dconf-cli -y

# Theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

mv ~/.zshrc ./config/cp.zshrc
cp ./config/.zshrc ~/
