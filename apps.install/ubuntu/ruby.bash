#!/bin/bash

# http://stackoverflow.com/a/34523631/4233593

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash # install RVM (development version)

rvm get head # Make Sure RVM up to date

rvm install ruby

# TODO:
# Add RVM to PATH for scripting
# export PATH="$PATH:$HOME/.rvm/bin"
