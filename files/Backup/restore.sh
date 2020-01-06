#!/bin/bash

echo -e"Mounting USB drive... \n"
sudo mount /dev/sd?? /mnt
	
echo -e "Moving projects from flash drive to the Controller... \n"
cp -r /mnt/* /home/root/Documents/KISS
	
sudo umount /dev/sd??
echo -e "\n \nAll programs restored with USB flash drive \n \n"
