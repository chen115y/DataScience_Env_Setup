#!/bin/bash
# This script will clean up disk space by remove some nonuseful data.
if [ "$(whoami)" != 'root' ]; then
    space="$(sudo df -h | grep root | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -)"
else
    space="$(df -h | grep root | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -)"
fi

echo "Checking the disk space......"
# This script does a very simple test for checking disk space.
echo "The root disk space is $space% full."
case $space in
    [1-6]*)
        Message="It is still okay. No worry for now!"
        ;;
    [7-8]*)
        Message="Need to start thinking about cleaning out some stuff."
        ;;
    9[1-9])
        Message="Better hurry with that new disk... One partition is $space % full."
        ;;
    *)
        Message="It seems like an nonexistent amount of disk space..."
        ;;
esac
echo $Message

echo "Checking apt cache archives folder..."
sudo du -sh /var/cache/apt/archives
echo
read -p 'Do you want to start clean up apt cache and archives?[y]: ' Answer
if [ $Answer == "Y" ] || [ $Answer == "y" ]; then
    echo "Apt cache and archives clean up processes are started..."
    sudo apt update
    sudo apt clean
    sudo apt autoremove --purge
    exit 0
else
    exit 1
fi
