# prefage
this is a compilation of common preferences for bash prompt, aliases,  
and git version 1.7.10+ tools (tab completion, custom prompt, & meld for desktops).

.bashrc originally taken from stock [Ubuntu](http://www.ubuntu.com/) 14.04 desktop  

git complete & prompt settings taken from [Udacity](https://www.udacity.com) course ["How to Use Git and GitHub"](https://www.udacity.com/wiki/ud775/lesson-1-notes#morsel-30-setting-up-your-workspace-on-mac)  
- https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
- https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

git ignore mostly thanks to [Octocat](https://gist.github.com/octocat/9257657)

## getting started

clone to home directory

run `./install-or-update.bash`

to remove, run `./uninstall.bash`

## tmux

install [tmux plugin manager][tpm]

    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

don't forget to install the plugins

> Press `prefix` + `I` (capital i, as in Install) to fetch the plugin

## Kate Snippets

create symlinks to xml files in your system snippets directory.

    ln -s /this/repo/kate/snippets/snip.xml ~/.local/share/ktexteditor_snippets/data/snip.xml

## Atom

Restart atom after symlinking style sheet.

    ln -s /this/repo/atom/styles.less ~/.atom/styles.less

[tpm]:https://github.com/tmux-plugins/tpm
