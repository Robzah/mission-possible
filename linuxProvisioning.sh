#!/usr/bin/env bash
echo "***Preparing to install tomcat***"
apt-get update &>/dev/null
echo
echo "***installing tomcat***"
sudo apt-get install -y tomcat8 tomcat8-admin &>/dev/null
sudo cp /vagrant/scripts/tomcat-users.xml /var/lib/tomcat8/conf/tomcat-users.xml
sudo systemctl restart tomcat8 &>/dev/null
echo "***Status***"
echo
curl -I -s -L 192.168.0.40:8080 | grep "HTTP/1.1"
echo
echo "******complete******"
echo
echo "***tomcat manager available at***"
echo "http://192.168.0.40:8080/manager/html"
echo "Username = admin  password = admin"
