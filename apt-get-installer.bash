#!/bin/bash

# latest version of git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y

# plugins for gedit
if $(command -v gedit >/dev/null 2>&1); then
	sudo apt-get install gedit-plugins
fi
