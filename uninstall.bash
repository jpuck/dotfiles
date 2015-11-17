#!/bin/bash

# remove legacy gitbash named files
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

# remove legacy copied bash scripts
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

# remove lines from .bashrc
echo "Removing prefage references from .bashrc..."
grep -v \
	-e ".prefage-bash-include.bash" \
	-e "prefage-bashrc-include.bash" \
	~/.bashrc > temp
mv temp ~/.bashrc

# remove legacy copied git scripts
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

# remove references from .gitconfig
echo "Removing prefage references from .bashrc..."
grep -v \
	-e ".prefage-git-config" \
	-e "prefage-gitconfig-include" \
	-e "prefage-gitconfig-ignore" \
	-e "prefage-gitconfig-meld.bash" \
	~/.gitconfig > temp
mv temp ~/.gitconfig

# restart terminal
echo "Removal complete."
echo "Restart Terminal to purge cached effects."
