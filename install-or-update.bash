#!/bin/bash

# move to working directory
cd $( dirname "${BASH_SOURCE[0]}" )
prefage_directory=$(pwd)

# remove old prefage files
./uninstall.bash

# create bashrc if it doesn't exist
if [ ! -f ~/.bashrc ]; then
    echo "creating ~/.bashrc"
    touch ~/.bashrc
fi

# include bash resources
# check if references already in bashrc
if $(grep -q prefage-bashrc-include.bash ~/.bashrc); then
	echo -e "
	WARNING: prefage-bashrc-include.bash already in ~/.bashrc
	If you're having problems, check the line ordering for overrides
	"
# add references
else
	echo "adding prefage references to ~/.bashrc"
	echo -e "
	# include prefage resources
	source $prefage_directory/bash/prefage-bashrc-include.bash" >> ~/.bashrc
fi

# include git resources
if $(command -v git >/dev/null 2>&1); then
	# create gitconfig if it doesn't exist
	if [ ! -f ~/.gitconfig ]; then
	    echo "creating ~/.gitconfig"
	    touch ~/.gitconfig
	fi
	# check if references already included
	if ! $(grep -q prefage-git-config-include ~/.gitconfig); then
		echo "adding prefage-git-config-include to ~/.gitconfig"
		echo -e "[include]
		path = $prefage_directory/git/prefage-git-config-include" >> ~/.gitconfig
	fi

	# if meld installed, set git diff default external
	if $(command -v meld >/dev/null 2>&1); then
		echo "setting meld as git diff external tool"
		echo -e "[diff]
		external = $prefage_directory/git/meld.bash" >> $prefage_directory/git/prefage-git-config-include
	else
		echo "If this is a desktop, you might consider installing meld."
	fi
fi

# source .bashrc to activate changes
echo -e "
prefage installation complete.
in order to activate new changes type:
   source ~/.bashrc
"
