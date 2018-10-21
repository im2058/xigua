#!/bin/bash
###for xigua
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf_bak
sudo cp ./smb.conf /etc/samba/
sudo service smbd restart
sudo chmod -R 777 ../download
sudo chmod -R 777 ../source
sudo chmod 755 ../download/update.log
