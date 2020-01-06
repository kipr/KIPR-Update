#
# Wesley Myers
# wmyers@kipr.org
#
# This script is designed to configure Wi-Fi for the Wallaby.  It attempts to find the best channel
# to be on given the current environment.  It favors channels 1, 6, and 11.  However  channels 3, 9
# 13 are also available.

import os
import hashlib
import time

#wifi channel mapping
chan={'2412':'1', '2417':'2', '2422':'3', '2427':'4', '2432':'5', '2437':'6', '2442':'7', '2447':'8', '2452':'9', '2457':'10', '2462':'11', '2467':'12', '2472':'13'};

os.system('wpa_cli scan')

f = os.popen('wpa_cli scan_results')
results_of_scan = f.read()

networks = results_of_scan.splitlines(True)

count = 0

#tracks if there are strong devices nearby
chan_strength = 0

#array stores number of devices in each Wi-Fi Channel, indexed by chan num
chan_count=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

for device in networks:
    if count >= 2:
        info = networks[count].split()
        
        print info
        chan_count[int(chan[info[1]])]+=1

        #-55 dBm is considered mid-range for good signal quality
        #This implies that the other signals around aren't strong
        if int(info[2]) > -55:
            chan_strength+=1
    count+=1

# ===== Find the best channel to be on =====

#initially assume 6 is the best
best_channel=6
dev_count = chan_count[6]
    
#if there are less devices on channel 1, then move
if dev_count > chan_count[1]:
    dev_count = chan_count[1]
    best_channel = 1
    
    #if there are less devices on channel 11, then move
    if dev_count > chan_count[11]:
        dev_count = chan_count[11]
        best_channel = 11
        
        if dev_count > chan_count[3]:
            dev_count = chan_count[3]
            best_channel = 3
                
            if dev_count > chan_count[9]:
                dev_count = chan_count[9]
                best_channel = 9

print "The best channel is " + str(best_channel)
best_channel=str(best_channel)

# ===== generate the hostapd.conf file =====

#generate the ssid
f = os.popen('wallaby_get_id.sh')
wallaby_id = f.read()

f = os.popen('wallaby_get_serial.sh')
wallaby_serial = f.read()

#gives unique password for the AP
hash_id=hashlib.sha256(wallaby_id).hexdigest()[0:6]+'00'

#strings for the /etc/hostapd.conf file
interface='interface=wlan0\n'
ssid='ssid=' + wallaby_serial + '-wombat\n'
channel='channel=' + best_channel + '\n'
wpa='wpa=3\n'
wpa_passphrase='wpa_passphrase=' + hash_id + '\n'

os.system('chmod +x /etc/hostapd_wallaby.conf')

#remove any old files
os.system('rm /etc/hostapd_wallaby.conf')

f=open('/etc/hostapd_wallaby.conf', 'w')
f.write(interface)
f.write(ssid)
f.write(channel)
f.write(wpa)
f.write(wpa_passphrase)
f.close()

# ===== Start Wi-Fi =====
os.system('ifconfig wlan0 192.168.125.1')
time.sleep(1)
os.system('wpa_cli ter')
time.sleep(1)
os.system('hostapd /etc/hostapd_wallaby.conf &')

time.sleep(10)
os.system('wall -n \"Wombat Name: ' + wallaby_serial + '-wombat\nPassword: ' + hash_id + '\"')

#start DHCP
os.system('/usr/sbin/udhcpd /etc/udhcpd.conf')

#alert user via sound
os.system('/usr/bin/amixer set PCM 100%')
