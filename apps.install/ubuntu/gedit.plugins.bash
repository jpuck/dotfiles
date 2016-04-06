#!/bin/bash

# plugins for gedit
if $(command -v gedit >/dev/null 2>&1); then
        sudo apt-get install gedit-plugins
fi
