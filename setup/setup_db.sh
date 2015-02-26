#!/usr/bin/env bash

# Script for install db server for rubbos
# For ubuntu 14.04 64bit
# 2015.02.26 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# install mysql without prompt for root password (root password: rubbos)
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password rubbos'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rubbos'
sudo apt-get install -y mysql-server

