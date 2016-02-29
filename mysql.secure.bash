#!/bin/bash
is_red_hat_maria_db=true
my_cnf_file="/etc/mysql/my.cnf"

# require root
if ! [[ $EUID -eq 0 ]]; then
  echo "ERROR: not root. Use \`sudo su\`"; exit 1
fi

if [ $is_red_hat_maria_db ]; then service mariadb stop; fi

mysql_install_db

if [ $is_red_hat_maria_db ]; then service mariadb start; fi

mysql_secure_installation

if [ -f $my_cnf_file ]; then
  echo "local-infile=0" >> $my_cnf_file
  echo "sql-mode=STRICT_TRANS_TABLES" >> $my_cnf_file
fi

if [ $is_red_hat_maria_db ]; then service mariadb restart; fi
