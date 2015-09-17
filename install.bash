#!/bin/bash

# backup and copy new .bashrc
cp ~/.bashrc ~/.bashrc-bak
cp .bashrc ~/.bashrc

# backup and copy new .gitconfig
cp ~/.gitconfig ~/.gitconfig-bak
cp .gitconfig ~/.gitconfig

# copy git scripts
cp .git-completion.bash ~/.git-completion.bash
cp .git-prompt.sh ~/.git-prompt.sh

# user will need to source .bashrc
echo "installation complete."
echo "in order to activate new changes type:"
echo "   source ~/.bashrc"
