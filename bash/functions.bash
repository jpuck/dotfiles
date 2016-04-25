# thanks vivek@nixCraft
# http://www.cyberciti.biz/faq/linux-random-password-generator/
genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=16
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}



########### personal functions you can delete #################
ouframe(){
  git clone -o ouframe git@bitbucket.org:waltoncollegeofbusiness/omni.frame.git $1
}

github_create() {
  github_username="admonkey"

  httpsgithub="https://github.com/$github_username/$(basename $PWD).git"
  sshgithub="git@github.com:$github_username/$(basename $PWD).git"

  origin="$sshgithub"

  echo "creating $httpsgithub"
  curl --data "{\"name\":\"$(basename $PWD)\"}" -u $github_username https://api.github.com/user/repos
  git remote add httpsgithub $httpsgithub
  git remote add sshgithub $sshgithub
  git remote add origin $sshgithub
}
