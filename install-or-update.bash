#!/bin/bash

# remove old prefage files
./uninstall.bash

# common bash preferences
echo "copying prefage bash scripts to home directory..."
cp -iv .prefage-bash-include.bash ~/
cp -iv .prefage-bash-ubuntu14.04.bash ~/
cp -iv .prefage-bash-aliases.bash ~/
cp -iv .prefage-bash-colors.bash ~/

# include resources in .bashrc
if [ ! -f ~/.bashrc ]; then
    echo "creating ~/.bashrc"
    touch ~/.bashrc
fi

if ! $(grep -q .prefage-bash-include.bash ~/.bashrc); then
	echo "adding prefage references to ~/.bashrc"
	echo "" >> ~/.bashrc
	echo "# include prefage resources" >> ~/.bashrc
	echo "source ~/.prefage-bash-include.bash" >> ~/.bashrc
else
	echo "WARNING: .prefage-bash-include.bash already in ~/.bashrc"
	echo "   if you're having problems, check the line ordering for overrides"
fi


# common git preferences
# copy scripts to home directory
if $(command -v git >/dev/null 2>&1); then
	echo "copying git scripts and configuration files to home directory..."
	cp -iv .prefage-git-completion.bash ~/
	cp -iv .prefage-git-config ~/
	cp -iv .prefage-git-prompt.sh ~/
	cp -iv .prefage-git-ignore ~/
	# include resources in .gitconfig
	if [ ! -f ~/.gitconfig ]; then
	    echo "creating ~/.gitconfig"
	    touch ~/.gitconfig
	fi
	if ! $(grep -q .prefage-git-config ~/.gitconfig); then
		echo "including prefage-git-config to ~/.gitconfig"
		echo "[include]" >> ~/.gitconfig
		echo "	path = ~/.prefage-git-config" >> ~/.gitconfig
	fi

	# if meld installed, set git diff default external
	if $(command -v meld >/dev/null 2>&1); then
		echo "setting meld as git diff external tool"
		cp -iv .prefage-git-meld.bash ~/
		echo "[diff]" >> ~/.prefage-git-config
		echo "	external = ~/.prefage-git-meld.bash" >> ~/.prefage-git-config
	else
		echo "If this is a desktop, you might consider installing meld."
	fi
fi


# source .bashrc to activate changes
echo
echo "installation complete."
echo "in order to activate new changes type:"
echo
echo "   source ~/.bashrc"
echo
