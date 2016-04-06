#!/bin/bash
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

# upgrade npm
sudo npm update npm -g
