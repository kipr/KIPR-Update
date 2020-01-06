#!/bin/bash

FW_VERSION=25.3

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


# libwallaby
echo "Updating libwallaby..."
sudo apt-get remove libwallaby -y
sudo dpkg -i pkgs/libwallaby_25.3-1_armhf.deb

# botui
echo "Updating botui..."
sudo apt-get remove botui -y
sudo dpkg -i pkgs/botui_25.3-1_armhf.deb

#Harrogate
echo "Updating harrogate..."
sudo tar -C /home/pi -zxvf pkgs/harrogate.tar.gz


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

#sh file needed to start the botui
TARGET=files/wifi_configurator.py
echo "Copying the Wifi Configurator"
cp $TARGET /home/pi
cp $TARGET /home/pi/harrogate

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

sudo chmod u+x /usr/bin/wallaby_*
echo "Permissions Granted."

#Copying the Backup Code
TARGET=files/Backup
sudo cp -r $TARGET /home/root/got2/


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
