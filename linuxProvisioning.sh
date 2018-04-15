#!/usr/bin/env bash

LOGFILE="/vagrant/tomcatinstall.log"
TOMCAT_URL="192.168.0.40:8080"
APPS=(tomcat8 tomcat8-admin)
SCRIPT="/vagrant/scripts/tomcat-users.xml"
TDIR="/var/lib/tomcat8/conf/"

install_apps(){
    echo "Installing tomcat 8 please wait..."
    apt-get update &>/dev/null
    sudo apt-get install -y ${APPS[*]} > "$LOGFILE" 2>&1
    cp "$SCRIPT" "$TDIR" >> "$LOGFILE" 2>&1
    sudo systemctl restart tomcat8 >> "$LOGFILE" 2>&1
}

test_tomcat(){
    response=$(curl -sSo /dev/null 2>> "$LOGFILE" -w '%{response_code}' "$TOMCAT_URL")
    if [ $response -eq 200 ]; then
        echo "installation complete..."
	      echo  "tomcat manager available at..."
        echo "http://192.168.0.40:8080/manager/html"
        echo "Username: admin  password: admin"
    else
	      echo "An error occurred during tomcat installation"
        echo "Please check" "$LOGFILE" 
	      exit -1
    fi
}

install_apps
test_tomcat
