#!/bin/bash

# remove bash scripts
echo "Removing old prefage bash files..."
if [ -f ~/.prefage-bash-include.bash ]; then
	rm ~/.prefage-bash-include.bash
fi
if [ -f ~/.prefage-bash-ubuntu14.04.bash ]; then
	rm ~/.prefage-bash-ubuntu14.04.bash
fi
if [ -f ~/.prefage-bash-aliases.bash ]; then
	rm ~/.prefage-bash-aliases.bash
fi
if [ -f ~/.prefage-bash-colors.bash ]; then
	rm ~/.prefage-bash-colors.bash
fi

# FIX: remove line from .bashrc
#if ! $(grep -q .prefage-bash-include.bash ~/.bashrc); then
#	echo "" >> ~/.bashrc
#	echo "# include prefage resources" >> ~/.bashrc
#	echo "source ~/.prefage-bash-include.bash" >> ~/.bashrc
#else
#	echo "WARNING: .prefage-bash-include.bash already in .bashrc"
#	echo "   if you're having problems, check the line ordering for overrides"
#fi

# remove git scripts
echo "Removing old prefage git files..."
if [ -f ~/.prefage-git-completion.bash ]; then
	rm ~/.prefage-git-completion.bash
fi
if [ -f ~/.prefage-git-config ]; then
	rm ~/.prefage-git-config
fi
if [ -f ~/.prefage-git-prompt.sh ]; then
	rm ~/.prefage-git-prompt.sh
fi
if [ -f ~/.prefage-git-ignore ]; then
	rm ~/.prefage-git-ignore
fi
if [ -f ~/.prefage-git-meld.bash ]; then
	rm ~/.prefage-git-meld.bash
fi

# FIX: remove line from .gitconfig
#if ! $(grep -q .prefage-git-config ~/.gitconfig); then
#	echo "[include]" >> ~/.gitconfig
#	echo "	path = ~/.prefage-git-config" >> ~/.gitconfig
#fi

## add main references if not already included
#if ! $(grep -q "path = $prefage_directory/git/prefage-git-config-include" ~/.gitconfig); then
#	echo "adding prefage-git-config-include to ~/.gitconfig"
#	echo -e "[include]
#	path = $prefage_directory/git/prefage-git-config-include" >> ~/.gitconfig
#fi

## add git ignore if not already included
#if ! $(grep -q "path = $prefage_directory/git/ignore" ~/.gitconfig); then
#	echo -e "[core]
#	excludesfile = $prefage_directory/git/ignore" >> ~/.gitconfig
#fi

## if meld installed, set git diff default external if not already
#if [[ $(command -v meld >/dev/null 2>&1) && ! $(grep -q "external = $prefage_directory/git/prefage-git-config-meld.bash" ~/.gitconfig) ]]; then
#	echo "setting meld as git diff external tool"
#	echo -e "[diff]
#	external = $prefage_directory/git/prefage-git-config-meld.bash" >> ~/.gitconfig
#else
#	echo "If this is a desktop, then you might consider installing meld."
#fi

# remove old gitbash named files
echo "Removing old gitbash files..."
if [ -f ~/.gitbash-aliases.bash ]; then
	rm ~/.gitbash-aliases.bash
fi
if [ -f ~/.gitbash-colors.bash ]; then
	rm ~/.gitbash-colors.bash
fi
if [ -f ~/.gitbash-git-completion.bash ]; then
	rm ~/.gitbash-git-completion.bash
fi
if [ -f ~/.gitbash-git-prompt.sh ]; then
	rm ~/.gitbash-git-prompt.sh
fi
if [ -f ~/.gitbash-gitconfig ]; then
	rm ~/.gitbash-gitconfig
fi
if [ -f ~/.gitbash-meld.bash ]; then
	rm ~/.gitbash-meld.bash
fi
if [ -f ~/.gitbash-ubuntu14.04.bash ]; then
	rm ~/.gitbash-ubuntu14.04.bash
fi
if [ -f ~/.gitbash_include.bash ]; then
	rm ~/.gitbash_include.bash
fi

# restart terminal
echo "Removal complete."
echo "Restart Terminal to purge cached effects."
