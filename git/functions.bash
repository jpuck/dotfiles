bgcpy()
{
    # using sub shells in this function allow for late alias expansion
    branches="$(bg "$1" | awk '{print $1;}')";
    firstBranch="$(echo "$branches" | head -n 1)"
    otherBranches="$(echo "$branches" | tail -n +2)"

    local yellow="\033[93m"
    local red="\033[31m"

    echo -e "$yellow$firstBranch"
    echo -e "$red$otherBranches"

    # copy the first one to the clipboard
    $(echo "$firstBranch" | cpy);
}

########### personal functions you can delete #################
ouframe(){
  git clone -o ouframe git@bitbucket.org:waltoncollegeofbusiness/omni.frame.git $1
}

github_create() {
  github_username="admonkey"

  httpsgithub="https://github.com/$github_username/$(basename $PWD).git"
  sshgithub="git@github.com:$github_username/$(basename $PWD).git"

  # default origin ssh
  origin="$sshgithub"

  # create remote
  echo "creating $httpsgithub"
  curl --data "{\"name\":\"$(basename $PWD)\"}" -u $github_username https://api.github.com/user/repos

  # add remotes
  git remote add httpsgithub $httpsgithub
  git remote add sshgithub $sshgithub
  git remote add origin $sshgithub
}
