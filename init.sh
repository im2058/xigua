#!/bin/bash
###for xigua
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y vim tmux samba phantomjs python3-selenium
sudo apt-get install -y python3-dev build-essential libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev zlib1g-dev libcurl4-openssl-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install pyquery

git clone https://github.com/piksel/phantomjs-raspberrypi.git
