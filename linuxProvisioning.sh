#!/usr/bin/env bash
echo "***Preparing to install tomcat***"
apt-get update &>/dev/null
echo
echo "***installing tomcat***"
sudo apt-get install -y tomcat8 tomcat8-admin &>/dev/null
sudo cp /vagrant/scripts/tomcat-users.xml /var/lib/tomcat8/conf/tomcat-users.xml
sudo systemctl restart tomcat8 &>/dev/null
echo
echo "***Status***"
echo
responce=$(curl -so /dev/null -w '%{response_code}' 192.168.0.40:8080) 
if [ $responce -eq 200 ]; then
	echo "Tomcat status (200) ok"
else
	echo "An error occured during tomcat instalation"
	exit -1
fi
echo
echo "******installation complete******"
echo "***tomcat manager available at***"
echo "http://192.168.0.40:8080/manager/html"
echo "Username = admin  password = admin"
