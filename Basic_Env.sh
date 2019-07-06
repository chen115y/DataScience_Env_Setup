#!/bin/sh

# Environmental Setup
# Install Linux Ubuntu
# [Ubuntu Linux 18.04 LTS](https://www.ubuntu.com/download/desktop)
# [Lubuntu Linux 18.04 LTS] (https://lubuntu.net)

echo
echo ----------Install basic packages----------
echo
    sudo apt update
    sudo apt install vim tmux htop iotop mc bc
    sudo apt install wget curl
    sudo apt install -y openssh-server
    sudo apt install pandoc 
    sudo add-apt-repository ppa:danielrichter2007/grub-customizer
    sudo apt install grub-customizer
echo
echo ---------Install Git for Source Version Control----------
echo
    sudo apt install git-all
    sudo apt install git
    git config --global user.email "chen115yaohua@gmail.com"
    git config --global user.name "Ivan Chen"
echo
echo ----------BASH Configuration----------
echo
    git clone http://github.com/chen115y/Ubuntu_Sandbox_Setup.git ~/.sandbox_setup
    cp ~/.sandbox_setup/Bash_Env/.bashrc ~/.bashrc
    cp ~/.sandbox_setup/Bash_Env/greeting.sh ~/
    source ~/.bashrc
echo
echo ----------Install Vim awesome version----------
echo
    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    sudo chmod a+xrw ~/.vim_runtime/*.sh
    sudo sh ~/.vim_runtime/install_awesome_vimrc.sh

echo
echo ----------install java 8-----------
echo
    sudo apt install openjdk-8-jdk
    sudo update-alternatives --config java
    sudo echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"" >> /etc/environment
    source /etc/environment
