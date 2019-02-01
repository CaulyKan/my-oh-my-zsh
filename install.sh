#!/bin/bash
echo " _____                 _        _____     _ _      _____         _     _  "
echo "|  _  |___ ___ ___ _ _|_|___   |     |___|_| |_   |   __|___ ___|_|___| |_ "
echo "|   __| -_|   | . | | | |   |  |-   -|   | |  _|  |__   |  _|  _| | . |  _|"
echo "|__|  |___|_|_|_  |___|_|_|_|  |_____|_|_|_|_|    |_____|___|_| |_|  _|_|  "
echo "              |___|                                               |_|      "

cd ~

echo Install Git
echo ===========
apt-get install -y git

echo Install oh-my-zsh
echo =================
apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo Clone my-oh-my-zsh
echo ==================
rm -rf .oh-my-zsh/my-oh-my-zsh
git clone https://github.com/CaulyKan/my-oh-my-zsh.git .oh-my-zsh/my-oh-my-zsh

echo Linking .zshrc
echo ==============
rm .zshrc
ln .oh-my-zsh/my-oh-my-zsh/.zshrc .zshrc

echo Source .zshrc
echo =============
source .zshrc