sudo rm -r KIPR-Update
git clone https://github.com/kipr/KIPR-Update.git && cd KIPR-Update && sudo chmod u+x wombat_update.sh && sudo ./wombat_update.sh && echo "Update Complete" || echo "Update Failed"
