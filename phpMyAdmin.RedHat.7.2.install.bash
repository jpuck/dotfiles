#!/bin/bash

# require root
if ! [[ $EUID -eq 0 ]]; then
  echo "ERROR: not root. Use \`sudo su\`"; exit 1
fi

rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum --enablerepo=remi,remi-test  install phpMyAdmin
# if error, try `yum install phpmyadmin`

# move aliases inside desired virtual host
# remove from phpMyAdmin.conf
# Alias /phpMyAdmin /usr/share/phpMyAdmin
# Alias /phpmyadmin /usr/share/phpMyAdmin
# 
# inside phpMyAdmin.conf <directory> :
# Require all granted
