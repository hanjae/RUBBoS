#!/usr/bin/env bash

# Script for install web server for rubbos
# For ubuntu 14.04 64bit
# 2015.02.26 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# common prerequisites
#sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-jk

cd ~/RUBBoS

pwd
# copy web files
sudo cp -r statichtml/* /var/www/html/

# copy worker config
sudo cp configfiles/webserver/workers.properties /etc/apache2/

# edit JkWorkersFile
sudo sed -i 's|^    JkWorkersFile.*|    JkWorkersFile /etc/apache2/workers.properties|g' /etc/apache2/mods-available/jk.conf
sudo sed -i "s|^</V.*|\tJkMount /rubbos/servlet* worker1\n</VirtualHost>|g" /etc/apache2/sites-available/000-default.conf

# restart apache2 service
sudo service apache2 restart

