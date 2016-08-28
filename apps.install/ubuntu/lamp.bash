#!/bin/bash

# https://www.atlantic.net/community/howto/install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04/

sudo apt install apache2 -y
sudo apt install mysql-server php7.0-mysql -y
mysql_secure_installation
sudo apt install php libapache2-mod-php -y
sudo service apache2 restart
