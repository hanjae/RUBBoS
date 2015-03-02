#!/usr/bin/env bash

# Script for install common things for rubbos
# For ubuntu 14.04 64bit
# 2015.02.26 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# common prerequisites
sudo apt-get update
sudo apt-get install -y git build-essential ssh gettext

cd ~
git clone https://github.com/hanjae/RUBBoS
cd RUBBoS
make flush_cache
mv bench/flush_cache .
 
cd ~
curl -O http://sebastien.godard.pagesperso-orange.fr/sysstat-8.0.3.tar.bz2
tar xvf sysstat-8.0.3.tar.bz2
cd sysstat-8.0.3
./configure
make
sudo make install

echo 'ENABLED="true"' | sudo tee -a /etc/default/sysstat
