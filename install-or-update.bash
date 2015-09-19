#!/bin/bash

# remove old prefage files
./uninstall.bash

# common bash preferences
# copy scripts to home directory
cp .prefage-bash-include.bash ~/
cp .prefage-bash-ubuntu14.04.bash ~/
cp .prefage-bash-aliases.bash ~/
cp .prefage-bash-colors.bash ~/

# include resources in .bashrc
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
fi
if ! $(grep -q .prefage-bash-include.bash ~/.bashrc); then
	echo "" >> ~/.bashrc
	echo "# include prefage resources" >> ~/.bashrc
	echo "source ~/.prefage-bash-include.bash" >> ~/.bashrc
else
	echo "WARNING: .prefage-bash-include.bash already in .bashrc"
	echo "   if you're having problems, check the line ordering for overrides"
fi


# common git preferences
# copy scripts to home directory
if $(command -v git >/dev/null 2>&1); then
	cp .prefage-git-completion.bash ~/
	cp .prefage-git-config ~/
	cp .prefage-git-prompt.sh ~/
	cp .prefage-git-ignore ~/
	# include resources in .gitconfig
	if [ ! -f ~/.gitconfig ]; then
	    touch ~/.gitconfig
	fi
	if ! $(grep -q .prefage-git-config ~/.gitconfig); then
		echo "[include]" >> ~/.gitconfig
		echo "	path = ~/.prefage-git-config" >> ~/.gitconfig
	fi

	# if meld installed, set git diff default external
	if $(command -v meld >/dev/null 2>&1); then
		cp .prefage-git-meld.bash ~/
		echo "[diff]" >> ~/.prefage-git-config
		echo "	external = ~/.prefage-git-meld.bash" >> ~/.prefage-git-config
	else
		echo "If this is a desktop, you might consider installing meld."
	fi
fi


# source .bashrc to activate changes
echo "installation complete."
echo "in order to activate new changes type:"
echo "   source ~/.bashrc"
