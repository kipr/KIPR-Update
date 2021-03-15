# KIPR-Update
Repository for pulling updates for KIPR Controllers
This is pulled when you hit "Online Update" from the UI

## Startup Functionality
This repository also contains the startup scripts that are called on boot to launch the program. Initilizing script is "zoobee_launcher.sh"

## How to Install
You should usually install this using the "online update" button in Settings->Update.
But you can also install it manually.

1) Plug the Wombat into an internet source with an Ethernet Cable ("the blue internet cable")
2) Hit "Hide UI" in Settings.
3) Double tap on "root terminal" in the top right of the desktop (may be in a different spot).
4) Type the following:
'''bash
mkdir dev
cd dev
git clone https://github.com/kipr/kipr-update
cd kipr-update
sudo chmod 777 wombat_update.sh
sudo ./wombat_update.sh
'''

**Latest versions:**

  -[Botui-25.8](https://github.com/kipr/botui);
  -[Libwallaby-25.8](https://github.com/kipr/libwallaby);
  
  Want to Contribute? Start Here!:
  https://github.com/kipr/KIPR-Development-Toolkit

