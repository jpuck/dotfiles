#!/bin/bash

# IF everything goes PERFECTLY, then you could just execute this script as is.
# however, that's ill-advised in case something goes wrong.
# I suggest executing each step line-by-line and observe what's happening.
# this is proprietary software afterall, polluting your open-source environment.

# move to working directory, only needed for script
# ignore this line if manually executing
cd $( dirname "${BASH_SOURCE[0]}" )

# root access needed
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# dependencies
apt-get install make unixodbc php5-odbc libc6 libkrb5-3 libgss3 e2fsprogs openssl libstdc++6 -y

# enable odbc
php5enmod odbc
service apache2 restart

# original download driver link page https://www.microsoft.com/en-us/download/details.aspx?id=50419
wget https://download.microsoft.com/download/2/E/5/2E58F097-805C-4AB8-9FC6-71288AB4409D/msodbcsql-13.0.0.0.tar.gz
tar xvzf msodbcsql-13.0.0.0.tar.gz
cd msodbcsql-13.0.0.0
./build_dm.sh --accept-warning

# driver manager will have custom directory
cd /tmp/unixODBC.*/unixODBC-*; make install
# must type YES to install

# return to download dir
cd -

# backup odbcinst.ini
odbcinibak=$(odbc_config --odbcinstini) && cp $odbcinibak $odbcinibak.bak

# actually install driver
./install.sh verify
./install.sh install --accept-license
# must type YES to install

# problem with missing new library, link to old seems to work
cd /usr/lib/x86_64-linux-gnu
ln -s libodbcinst.so.1 libodbcinst.so.2

# update libraries
add-apt-repository ppa:ubuntu-toolchain-r/test
# hit ENTER to accept new ppa
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
