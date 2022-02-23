from os import system
import sys

## update arch
#system("sudo pacman -Syyu --noconfirm")

## add a script to run on startup
system("sudo cp /arch/main.sh /etc/profile.d/")
system("sudo chmod +x /etc/profile.d/main.sh")
