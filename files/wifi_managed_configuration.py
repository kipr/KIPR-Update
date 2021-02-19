#wifi_managed_configuration.py <"SSID"> <password>

#Required:
#sudo apt-get install rfkill -y
#sudo apt-get install wpasupplicant -y

#Call after the system has fully booted up, to revert simply restart.

import os
import sys

os.system('systemctl stop hostapd')                 #Stop the AP service
os.system('systemctl stop NetworkManager')
os.system('systemctl disable NetworkManager')

os.system('ip link set wlan0 down')
os.system('iwconfig wlan0 mode managed')            #Change the network adapter mode to managed
os.system('ip link set wlan0 up')

os.system('systemctl start wpa_supplicant')         #Doublecheck this service is running

os.system('wpa_passphrase "{}" "{}" | sudo tee /etc/wpa_supplicant.conf'.format(sys.argv[1], sys.argv[2]))
os.system('wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlan0')
os.system('dhclient wlan0 -r')
os.system('dhclient wlan0 ')
