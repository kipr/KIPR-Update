#!/bin/bash

FW_VERSION=26.0

echo "   "
echo "Starting Wombat Update #$FW_VERSION"
echo "..."


###############################
#
# update boot files
#
###############################

#remount root filesystem as read write
mount -o remount,rw /


###############################
#
# update packages
#
###############################
rm -r /usr/local/bin/botui
rm -r /usr/bin/botui

# libwallaby
echo "Updating libwallaby..."
sudo apt-get remove libwallaby -y
sudo dpkg -i pkgs/libwallaby.deb

# botui
echo "Updating botui..."
sudo apt-get remove botui -y
sudo dpkg -i pkgs/botui.deb

#Harrogate
echo "Updating harrogate..."
sudo rm -r /home/pi/harrogate
sudo tar -C /home/pi -zxvf pkgs/harrogate.tar.gz
sudo chmod 777 /home/pi/harrogate
cd /home/pi/harrogate
sudo npm install
sudo killall node
sudo gulp &
cd /home/pi

###############################
#
# edit misc files
#
###############################

#sh file needed to start the botui
TARGET=files/zoobee_launcher.sh
echo "Copying the launcher"
cp $TARGET /home/root
cp $TARGET /home/root/harrogate

#Python file that starts the wifi access point
TARGET=files/wifi_configurator.py
echo "Copying the Wifi Configurator"
cp $TARGET /home/pi
cp $TARGET /home/pi/harrogate
cp $TARGET /usr/bin/


#Experimental python script that does managed wifi
TARGET=files/wifi_managed_configuration.py
echo "Copying Experimental Managed Wifi Configurator"
cp $TARGET /home/pi
cp $TARGET /home/pi/harrogate
cp $TARGET /usr/bin

#Copying the screen invert settings
TARGET=files/Screen_settings
cp -r $TARGET /home/root/got2/

#Copying the get serial Code
TARGET=files/wallaby_get_serial.sh
sudo cp $TARGET /usr/bin/

#Copying the set serial Code
TARGET=files/wallaby_set_serial.sh
sudo cp $TARGET /usr/bin/

#Copying the get Pi ID Code
TARGET=files/wallaby_get_id.sh
sudo cp $TARGET /usr/bin/

sudo chmod u+x /usr/bin/wifi_*
sudo chmod u+x /usr/bin/wallaby_*
echo "Permissions Granted."

#Copying the Backup Code
TARGET=files/Backup
sudo cp -r $TARGET /home/root/got2/

#Adding Default Programs
TARGET=Default_User
sudo cp -r $TARGET /home/root/Documents/KISS

#Copy the firmware
echo "Adding updated firmware files"
sudo cp -r files/flash/* /home/pi


echo "Flashing the Processor"
cd /home/pi
sudo ./wallaby_flash



###############################
#
# sync and reboot
#
###############################
echo "Finished Wombat Update #$FW_VERSION"
echo "Rebooting..."
sleep 3
reboot
