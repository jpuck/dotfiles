#!/bin/bash
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

# upgrade npm
sudo npm update npm -g
