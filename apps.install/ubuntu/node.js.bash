#!/bin/bash

# install nvm
# manually check for updates to install script
# https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
# restart shell
nvm install stable
nvm alias default stable

#
# old instructions to install via sudo
#
# curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
# sudo apt-get install -y nodejs

# upgrade npm
# sudo npm update npm -g
