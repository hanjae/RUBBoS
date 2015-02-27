#!/usr/bin/env bash

# Script for install common things for rubbos
# For ubuntu 14.04 64bit
# 2015.02.26 Jaehyun Han <jhhan@dcslab.snu.ac.kr>

# common prerequisites
sudo apt-get update
sudo apt-get install -y tomcat7 libmysql-java openjdk-7-jdk

echo 'export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64' >> ~/.profile
. ~/.profile

sudo sed -i '/^shared.loader/ s|$|,/usr/share/java/*.jar|' /etc/tomcat7/catalina.properties

# Uncomment Connector port="8009" line
targetline=$(grep -n 'Connector port="8009"' /etc/tomcat7/server.xml | cut -d : -f 1)
sudo sed -ie "$((targetline-1))d;$((targetline+1))d" /etc/tomcat7/server.xml

# make Servlet
cd ~/RUBBoS/Servlets
make

# copy config files
cd ~/RUBBoS
sudo mkdir /var/lib/rubbos
sudo cp configfiles/appserver/* /var/lib/rubbos

# copy webapp
sudo cp -r configfiles/webapps/rubbos /var/lib/tomcat7/webapps/
sudo mkdir -p /var/lib/tomcat7/webapps/rubbos/WEB-INF/lib
sudo cp Servlets/rubbos_servlets.jar /var/lib/tomcat7/webapps/rubbos/WEB-INF/lib/

# restart tomcat service
sudo service tomcat7 restart

