#!/bin/bash
# Bash script to launch harrogate web IDE and botui GUI
# created 30 Nov 2018

echo [ZOOBEE] Launching harrogate server.js and botui GUI
sudo python wifi_configurator.py &
cd harrogate
sudo node server.js &
sudo botui &
#sleep 10
#sudo python wifi_configurator.py &
