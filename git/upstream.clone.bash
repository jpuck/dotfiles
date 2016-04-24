#!/bin/bash

# exit on error
trap 'exit' ERR

# name required
if [ $# -eq 0 ]; then
  echo "name required"; exit 1
fi

# default upstream repo
if [ -z ${2+x} ]; then
  REPOSITORY="https://github.com/jeff-puckett/WebSite.git"
else
  REPOSITORY=$2
fi

# repo aliases
if [ "$2" = "html5" ] ; then
  REPOSITORY="https://github.com/admonkey/html5-boilerplate.git"
fi

# clone repository, name remote "upstream", name new repo $1
git clone -o upstream $REPOSITORY $1

# move into repo
cd $1

# document upstream remote
echo "$(date "+%Y-%m-%d %a %T") $REPOSITORY" >> upstream.remote.git.txt

# check if master branch already exists
#git rev-parse --verify master

# create new master branch
#git checkout -b master

# create new remote repository on github
curl --data "{\"name\":\"$1\"}" -u admonkey https://api.github.com/user/repos

# add new ssh remote origin
git remote add origin git@github.com:admonkey/$1.git
