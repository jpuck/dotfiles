#!/bin/bash
# https://docs.mongodb.org/manual/tutorial/install-mongodb-enterprise-on-ubuntu/

# Import the public key used by the package management system.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Create a /etc/apt/sources.list.d/mongodb-enterprise.list file for MongoDB.
echo "deb http://repo.mongodb.com/apt/ubuntu trusty/mongodb-enterprise/stable multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-enterprise.list

# Reload local package database.
sudo apt-get update

# Install the MongoDB Enterprise packages.
sudo apt-get install -y mongodb-enterprise

