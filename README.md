# KIPR-Update
Repository for pulling updates for KIPR Controllers

It contains files relevant to the software, as well as binaries of the software itself.

This is pulled when you hit "Online Update" from the UI

## Ethernet Instructions
1) Plug the Wombat into an internet source with an Ethernet Cable ("the blue internet cable")
2) Wait a few seconds for the internet to connect
3) Go to Settings->Update
4) Click "Online Update"

If it says "failed to clone ___" or "sudo: ./wombat_update.sh not found",

The internet is not connected, try again a few more times and if it persists, there is an issue with the internet source.

## USB Instructions:
1) Download this repository (big green "Code" button, download as .zip)
2) Extract the .zip somewhere on your computer or the flash drive. (Right click, hit "Extract Here")
3) Rename the extracted folder to "wombat_master" or "wombat_(anything you want)"
4) Put the "wombat_master" file in the root/base of the flash drive (just don't put it in a folder).
5) Plug the flash drive into the Wombat
6) Go to Settings->Update, select on "wombat_master" in the menu on the right, and click "Update"


## How to Install (manually)
You should usually install this using the "online update" button in Settings->Update.
But you can also install it manually.

1) Plug the Wombat into an internet source with an Ethernet Cable
2) Hit "Hide UI" in Settings.
3) Double tap on "root terminal" in the top right of the desktop (may be in a different spot).
4) Type the following:


```bash
mkdir dev
cd dev
git clone https://github.com/kipr/kipr-update
cd kipr-update
sudo chmod 777 wombat_update.sh
sudo ./wombat_update.sh
```

## Flashing a fresh OS
You can install any OS that will run on a Raspberry Pi (3B+) on a Wombat.
This is how to flash a fresh installation of BOS (Botball Operating System).
If you do not have an SD card that you want to use, you can unscrew the panel on the bottom of the Wombat and use that SD card.

### Windows:
1) Download a .img file from here, BOS is labeled according to the periodic table (ie the first release is Hydrogen, the second is Helium, etc):
https://www.dropbox.com/sh/s4lkx9qo7h3xc6d/AAAdFrSIWdEv_nFEpsvKPN9ka?dl=0

2) Download Balena Etcher
https://www.balena.io/etcher/

3) Plug your SD card into the SD card reader/writer.

4) Follow the prompts on Balena Etcher, selecting the .img file you downloaded and the SD card you want to write to.

5) Unscrew the panel on the bottom of the Wombat and swap/insert the SD card.

### Linux/MacOS
1) Download a .img file from here, BOS is labeled according to the periodic table (ie the first release is Hydrogen, the second is Helium, etc):
https://www.dropbox.com/sh/s4lkx9qo7h3xc6d/AAAdFrSIWdEv_nFEpsvKPN9ka?dl=0

2) Open a terminal and type the following:

```bash
fdisk -l 
#or
sudo fdisk -l 
```
Then find which one of the drives is your SD card.
It will probably be /dev/sdb, unless you have multiple drives.

3) Navigate to where you have the .img file and type:

```bash
sudo dd if="(.img filename)" of="/dev/(drivename)" bs=4M status=progress

#Example using BOS-Hydrogen on a SD card that is mounted at /dev/sdb
sudo dd if="BOS-Hydrogen.img" of="/dev/sdb" bs=4M status=progress
```
**Latest versions:**

  -[Botui-25.8](https://github.com/kipr/botui);
  -[Libwallaby-25.8](https://github.com/kipr/libwallaby);
  
  Want to Contribute? Start Here!:
  https://github.com/kipr/KIPR-Development-Toolkit

