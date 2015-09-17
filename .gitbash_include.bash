if [ -f ~/.gitbash-ubuntu14.04.bash ]; then
    . ~/.gitbash-ubuntu14.04.bash
fi

if [ -f ~/.gitbash-aliases.bash ]; then
    . ~/.gitbash-aliases.bash
fi

if [ -f ~/.gitbash-colors.bash ]; then
    . ~/.gitbash-colors.bash
fi

if [ -f ~/.gitbash-git-completion.bash ]; then
    . ~/.gitbash-git-completion.bash
fi

if [ -f ~/.gitbash-git-prompt.sh ]; then
    . ~/.gitbash-git-prompt.sh
	# Change command prompt
	export GIT_PS1_SHOWDIRTYSTATE=1
	# '\u' adds the name of the current user to the prompt
	# '\h' adds the name of the host
	# '\W' adds the name of the current directory
	# '\$(__git_ps1)' adds git-related stuff
	export PS1="$lime\u$darkgraylight@$green\h $bluebright\W$green\$(__git_ps1) $lime$ $reset"
fi
