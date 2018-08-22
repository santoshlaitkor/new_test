#!/bin/sh


read -p "Input repo name " repo_name
read -p "Input GIT username " uname
read -p "Input GIT Password " pass
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u '$uname' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

git init
git add .
git commit -m "`date` new1" .
git remote origin  https://$uname:$pass@github.com/$uname/$repo_name.git
git push -u origin master
~
~
