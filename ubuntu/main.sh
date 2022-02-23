#!/bin/sh

## update system
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get clean -y

## installing dependencies
sudo apt install apt-transport-https curl git python3-pip os-prober -y 

## install spotify
echo installing spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client
echo Done!

## install brave browser
echo installing brave browser
curl -sS https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install brave-browser -y
echo Done! 

## install vscode
echo installing vscode
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-key add /etc/apt/trusted.gpg.d/packages.microsoft.gpg
sudo apt-get update
sudo apt-get install -y code
echo Done!

## grub config
echo configuring grub
sudo mv ./grub.cfg /boot/grub/grub.cfg
sudo mv ./themes /boot/grub/
sudo mv /grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo Done!

