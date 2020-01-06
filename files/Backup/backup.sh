#!/bin/bash

sudo mount /dev/sd?? /mnt
echo -e "Copying Files to USB Drive...\n" 

cp -r /home/root/Documents/KISS/* /mnt
echo -e "Removing unwanted files... \n"

cd /mnt && rm *.json && rm -r bin && rm -r data && rm -r lib && rm -r src && rm -r include
sudo umount /dev/sd??


echo -e "\n \nAll projects backed up on flash drive! \n"
