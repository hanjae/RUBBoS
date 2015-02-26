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
 
