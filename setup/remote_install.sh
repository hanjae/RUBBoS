#!/usr/bin/env bash

# Script for setup remotely for rubbos
# For ubuntu 14.04 64bit
# 2015.02.27 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# get hosts
webserver=$(grep webserver hosts | awk '{print $1}')
dbserver=$(grep dbserver hosts | awk '{print $1}')
appserver=$(grep appserver hosts | awk '{print $1}')

# set hosts and common
cat hosts | ssh $webserver "sudo sh -c 'cat >> /etc/hosts'"
ssh $webserver 'bash -s' < setup_common.sh

cat hosts | ssh $dbserver "sudo sh -c 'cat >> /etc/hosts'"
ssh $dbserver 'bash -s' < setup_common.sh

cat hosts | ssh $appserver "sudo sh -c 'cat >> /etc/hosts'"
ssh $appserver 'bash -s' < setup_common.sh

# setup dbserver
ssh $dbserver 'bash -s' < setup_db.sh

# setup appserver
ssh $appserver 'bash -s' < setup_was.sh

# setup webserver
ssh $webserver 'bash -s' < setup_web.sh


