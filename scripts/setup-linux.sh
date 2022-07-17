#!/bin/bash

# ------------------------------------------------------------------------ #
# Script Name:   setup-linux.sh 
# Description:   Automate first-time linux boot up setup.
# Written by:    Gary Wahyudi
# Maintenance:   Gary Wahyudi
# ------------------------------------------------------------------------ #
# Usage:         
#       $ ./setup-linux.sh

#Update & Upgrade
sudo apt update
sudo apt upgrade -y

#VSCodium Setup (Ubuntu/Mint)
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update

#Installing Packages & Programming Language I use
sudo apt install git neovim vlc codium software-properties-common wget

#GNS3 Setup
sudo add-apt-repository ppa:gns3/ppa
sudo apt update                                
sudo apt install gns3-gui gns3-server

#Mikrotik X86 CD iso (7.3.1)
sudo wget -O /tmp/myfile https://download.mikrotik.com/routeros/7.3.1/mikrotik-7.3.1.iso

#nicotine+ Setup
sudo apt install software-properties-common
sudo add-apt-repository ppa:nicotine-team/stable
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CEB6050A30E5769
sudo apt update
sudo apt install nicotine

#Brave Browser Setup
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

#Flatpak Applications
flatpak install flathub com.obsproject.Studio
flatpak install flathub org.blender.Blender

#QEMU/KVM Setup
#sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

#Wine Setup
wget -O /tmp/myfile https://dl.winehq.org/wine/source/6.0/wine-6.0.tar.xz
cd /tmp/myfile
tar -xvf wine-6.0.tar.xz
cd wine-6.0/
sudo ./configure 
sudo ./configure --enable-win64   [For 64-bit platform]
sudo make && sudo make install
