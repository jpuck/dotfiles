#!/bin/bash

# copy scripts to home directory
cp .gitbash_include.bash ~/
cp .gitbash-ubuntu14.04.bash ~/
cp .gitbash-aliases.bash ~/
cp .gitbash-colors.bash ~/
cp .gitbash-git-completion.bash ~/
cp .gitbash-gitconfig ~/
cp .gitbash-git-prompt.sh ~/

# include resources in .bashrc
if ! $(grep -q .gitbash_include.bash ~/.bashrc); then
	echo "" >> ~/.bashrc
	echo "# include gitbash resources" >> ~/.bashrc
	echo "source ~/.gitbash_include.bash" >> ~/.bashrc
else
	echo "WARNING: .gitbash_include.bash already in .bashrc"
	echo "   if you're having problems, check the line ordering for overrides"
fi

# include resources in .gitconfig
if [ ! -f ~/.gitconfig ]; then
    touch ~/.gitconfig
fi
if ! $(grep -q .gitbash-gitconfig ~/.gitconfig); then
	echo "[include]" >> ~/.gitconfig
	echo "	path = ~/.gitbash-gitconfig" >> ~/.gitconfig
fi

# source .bashrc to activate changes
echo "installation complete."
echo "in order to activate new changes type:"
echo "   source ~/.bashrc"
