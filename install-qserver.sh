#!/bin/bash
# This script installs a Quake II server on Ubuntu 20.04
# Note: it will not work on 20.10 or 22.04

### Install dependencies for LinuxGSM
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils 
sudo apt install python3 util-linux ca-certificates binutils bc jq tmux netcat

sudo apt install lib32gcc1
sudo apt install lib32stdc++6

### Install the software
sudo adduser q2server
su - q2server
cd ~
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh q2server
./q2server install


### extra stuff after server is installed

# download the abandon map
su - q2server
mkdir -p ~/serverfiles/baseq2/maps/
wget -o ~/serverfiles/baseq2/maps/abandon.zip http://www.3dgamersedge.com/Maps/abandon.zip
cd ~/serverfiles/baseq2/maps
unzip abandon.zip

# modify the default map so it's the abandon map
cd ~/lgsm/config-lgsm/q2server
echo 'defaultmap="abandon"' >> common.cfg

