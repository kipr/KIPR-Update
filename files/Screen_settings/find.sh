#!/bin/bash

if grep -q 4000 /etc/X11/xorg.conf.d/99-calibration.conf
then 
	sudo cp /home/pi/got2/Screen_settings/Invert/99-calibration.conf /etc/X11/xorg.conf.d/99-calibration.conf
	sudo cp /home/pi/got2/Screen_settings/Invert/config.txt /boot/config.txt
	echo "Default settings found"

elif grep -q 3935 /etc/X11/xorg.conf.d/99-calibration.conf
then  	
	sudo cp /home/pi/got2/Screen_settings/Default/99-calibration.conf /etc/X11/xorg.conf.d/99-calibration.conf
	sudo cp /home/pi/got2/Screen_settings/Default/config.txt /boot/config.txt
	echo "Inverted settings found"
fi
sleep 2
sudo reboot -h now