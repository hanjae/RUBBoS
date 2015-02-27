#!/usr/bin/env bash

# Script for setup remotely for rubbos
# For ubuntu 14.04 64bit
# 2015.02.27 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# set hosts
cat hosts | ssh webserver "sudo sh -c 'cat >> /etc/hosts'"
cat hosts | ssh appserver "sudo sh -c 'cat >> /etc/hosts'"
cat hosts | ssh dbserver "sudo sh -c 'cat >> /etc/hosts'"
