#!/bin/sh

# Data Science Environmental Setup
# Install Linux Ubuntu
# [Ubuntu Linux 18.04 LTS](https://www.ubuntu.com/download/desktop)
# [Windows Subsystem for Linux Ubuntu 18.04 LTS] (https://docs.microsoft.com/en-us/windows/wsl/install-win10)

echo
echo ----------Install basic packages----------
echo
    sudo apt update
    sudo apt -y install vim tmux
    sudo apt -y install wget curl
echo
echo ---------Install Git for Source Version Control----------
echo
    sudo apt -y install git-all
    sudo apt -y install git
echo
echo ----------Install Anaconda----------
echo
    cd /tmp
    curl -O -k https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
    sudo bash Anaconda3-2019.10-Linux-x86_64.sh
    sudo chmod -R 777 ~/anaconda3/
    CONDA_HOME=~/anaconda3/bin
    PATH=$CONDA_HOME:$PATH
    sudo source ~/.bashrc
    conda config --set ssl_verify false
    conda config --add channels conda-forge
    conda config --add channels pytorch
    conda config --add channels plotly
    conda config --add channels anaconda
    sudo chmod -R 777 ~/.conda/
echo ----------Import Environment-----------
echo
    curl -O -k https://github.com/chen115y/DataScience_Env_Setup/blob/master/Environment_Build_Scripts/Ubuntu18/spec_list.txt
    conda env create --name DSIA --file spec_list.txt
    conda env list
    conda activate DSIA
    conda update --all --yes