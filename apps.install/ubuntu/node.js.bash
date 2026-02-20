#!/bin/bash

set -e

# install nvm
# manually check for updates to install script
# https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# reload env for nvm paths and completion in prefage-include
. ~/.bashrc

# LTS
nvm install --lts
