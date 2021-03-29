# KIPR-Update
Repository for pulling updates for KIPR Controllers
This is pulled when you hit "Online Update" from the UI

This repository also contains the startup scripts that are called on boot to launch the program. Initilizing script is "zoobee_launcher.sh"

## Ethernet Instructions
1) Plug the Wombat into an internet source with an Ethernet Cable ("the blue internet cable")
2) Wait a few seconds for the internet to connect
3) Go to Settings->Update
4) Click "Online Update"

If it says "failed to clone ___"

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

**Latest versions:**

  -[Botui-25.8](https://github.com/kipr/botui);
  -[Libwallaby-25.8](https://github.com/kipr/libwallaby);
  
  Want to Contribute? Start Here!:
  https://github.com/kipr/KIPR-Development-Toolkit

