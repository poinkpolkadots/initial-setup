#!/bin/bash

sudo apt update
sudo update-pciids
sudo apt install firmware-b43-installer
sudo apt install linux-firmware
sudo reboot
