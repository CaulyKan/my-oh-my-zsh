#!/bin/bash
echo " _____                 _        _____     _ _      _____         _     _  "
echo "|  _  |___ ___ ___ _ _|_|___   |     |___|_| |_   |   __|___ ___|_|___| |_ "
echo "|   __| -_|   | . | | | |   |  |-   -|   | |  _|  |__   |  _|  _| | . |  _|"
echo "|__|  |___|_|_|_  |___|_|_|_|  |_____|_|_|_|_|    |_____|___|_| |_|  _|_|  "
echo "              |___|                                               |_|      "

cd ~

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi


echo "Update apt"
echo "==========="
apt-get update
echo "Done."

echo "Install Git"
echo "==========="
apt-get install -y git
echo "Done."

echo "Install oh-my-zsh"
echo "================="
apt-get install -y zsh
alias exit=return
sudo -u $real_user sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/custom/plugins/zsh-vi-mode
unalias exit
echo "Done."

echo "Clone my-oh-my-zsh"
echo "=================="
rm -rf .oh-my-zsh/my-oh-my-zsh
sudo -u $real_user git clone --recurse-submodules https://github.com/CaulyKan/my-oh-my-zsh.git .oh-my-zsh/my-oh-my-zsh
echo "Done."

echo "Config python"
echo "============="
apt-get install -y python3-pip
echo "Done."

# echo "Install docker"
# echo "=============="
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
# apt-get update
# apt-get install -y docker-ce

echo "Install tldr"
echo "==============="
apt-get install -y tldr
echo "Done."

echo "Linking .zshrc"
echo "=============="
rm .zshrc
sudo -u $real_user ln .oh-my-zsh/my-oh-my-zsh/.zshrc .zshrc
echo "Done."

echo "Installing VIM"
echo "=============="
apt-get install -y vim
rm -rf ~/.vim
ln -s .oh-my-zsh/my-oh-my-zsh/.vim ~/.vim

echo "==============================="
echo "Penguin Init Script Completed."
echo "source .zshrc"
