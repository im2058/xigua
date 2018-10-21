#!/bin/bash
###for xigua
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf_bak
sudo cp ./smb.conf /etc/samba/
sudo service smbd restart
sudo chmod -R 777 ../download
sudo chmod -R 777 ../source
sudo chmod 755 ../download/update.log
#crontab -e 
#*/30 * * * * cd /home/pi/KK/xigua && bash xigua.sh > tmp/cron.log

usb=`ls /dev/sd*`
sudo mount -t vfat -o umask=000 $usb /home/pi/KK/xigua/download
