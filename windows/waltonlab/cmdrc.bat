:: https://superuser.com/a/144348/571125
@echo off

:: files
doskey l=dir
doskey rm=del $*

:: git
git config --global user.name "Jeff Puckett"
git config --global user.email "jeff@jeffpuckett.com"
doskey la=git log --graph --format="%%C(auto)%%h %%s%%d %%Cgreen%%ar"
doskey s=git status
doskey b=git branch -avv
doskey co=git checkout $*
doskey d=git diff $*
doskey dc=git diff --cached $*
doskey a=git add $*
doskey au=git add -u $*
doskey r=git reset $*
doskey cm=git commit $*
doskey cmm=git commit -m $*
doskey cam=git commit -am $*
doskey ammend=git commit --amend --no-edit
doskey show=git show $*
doskey showl=git show --stat --summary $*
doskey gr=git remote -v
doskey f=git fetch --prune $*
doskey ph=git push $*
doskey pl=git pull $*

:: bin
doskey vim="C:\Program Files\Git\usr\bin\vim" $*
doskey curl="C:\Program Files\Git\mingw64\bin\curl" $*
set PATH=%PATH%;S:\jpucket\bin
