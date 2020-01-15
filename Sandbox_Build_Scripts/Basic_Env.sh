#!/bin/sh

# Environmental Setup
# Install Linux Ubuntu
# [Ubuntu Linux 18.04 LTS](https://www.ubuntu.com/download/desktop)
# [Lubuntu Linux 18.04 LTS] (https://lubuntu.net)

echo
echo ----------Install basic packages----------
echo
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y vim tmux htop iotop mc bc
    sudo apt install -y wget curl
    sudo apt install -y openssh-server
    sudo apt install -y pandoc
    sudo add-apt-repository ppa:danielrichter2007/grub-customizer
    sudo apt install -y grub-customizer
    sudo apt install gcc-5 g++-5 python-dev python3-dev
echo
echo ---------Install Git for Source Version Control----------
echo
    sudo apt install -y git-all
    sudo apt install -y git
    git config --global user.email "chen115yaohua@gmail.com"
    git config --global user.name "Ivan Chen"
    # update CA certificates
    sudo apt-get install apt-transport-https ca-certificates -y
    sudo update-ca-certificates
    git config --global http.sslverify false
    export GIT_SSL_NO_VERIFY=true
echo
echo ----------BASH Configuration----------
echo
    git clone http://github.com/chen115y/Ubuntu_Sandbox_Setup.git ~/.sandbox_setup
    sudo cp ~/.sandbox_setup/Bash_Env/.bashrc ~/.bashrc
    sudo cp ~/.sandbox_setup/Bash_Env/greeting.sh ~/
    . ~/.bashrc
echo
echo ----------Install Vim awesome version----------
echo
    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    sudo chmod a+xrw ~/.vim_runtime/*.sh
    sudo sh ~/.vim_runtime/install_awesome_vimrc.sh
    sudo cp ~/.sandbox_setup/Bash_Env/.vimrc ~/.vimrc
    mkdir ~/.config/
    mkdir ~/.config/pip/
    sudo cp ~/.sandbox_setup/Bash_Env/pip.conf ~/.config/pip/

