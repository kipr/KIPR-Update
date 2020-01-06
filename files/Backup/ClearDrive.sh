#!/bin/bash

sudo umount /dev/sd??
sudo mkfs.vfat -F 32 /dev/sd??
    
echo -e "\nFlash drive is now cleared. \n \n"
