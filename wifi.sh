#!/bin/bash

sudo apt update -y
sudo update-pciids -y
sudo apt install firmware-b43-installer -y
sudo apt install linux-firmware -y
sudo reboot -y
