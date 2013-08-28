#!/bin/bash

sudo mkdir -p /cdrom
sudo mount /dev/cdrom /cdrom

sudo apt-get install build-essential linux-headers-`uname -r`

sudo /cdrom/VBoxLinuxAdditions.run

mkdir -p ~/share

sudo cp rc.local /etc/rc.local
