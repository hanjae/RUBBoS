#!/usr/bin/env bash

# Script for install db server for rubbos
# For ubuntu 14.04 64bit
# 2015.02.26 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# install mysql without prompt for root password (root password: rubbos)
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password rubbos'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rubbos'
sudo apt-get install -y mysql-server

cd ~
if [ ! -f ~/dbdump.tar.gz ]; then
  echo "DB dump not found on ~/dbdump.tar.gz download smallDB"
  curl http://jmob.ow2.org/rubbos/smallDB.tgz -o ~/dbdump.tar.gz
fi

mkdir /tmp/dbdump
tar xvf dbdump.tar.gz -C /tmp/dbdump/

# disable the apparmor for mysql to import dbdump
sudo apparmor_parser -R /etc/apparmor.d/usr.sbin.mysqld

# import db
cd ~/RUBBoS/database
mysql -uroot -prubbos < rubbos.sql
mysql -uroot -prubbos rubbos < load.sql
mysql -uroot -prubbos rubbos < test.sql

# add privileges
mysql -uroot -prubbos mysql -e "GRANT ALL PRIVILEGES ON *.* TO root@appserver IDENTIFIED BY 'rubbos' WITH GRANT OPTION;"

# re-enable the AppArmor profile (Should I??)
sudo apparmor_parser /etc/apparmor.d/usr.sbin.mysqld

# remove db dump
rm -r /tmp/dbdump

# comment out bind-address line
sudo sed -i 's/^bind-address/#bind-address/g' /etc/mysql/my.cnf

sudo service mysql restart
