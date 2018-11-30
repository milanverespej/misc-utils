#! /bin/env sh

for repo in $(ls -d */*); do
   pushd $repo
   git checkout master
   git pull
   git remote prune origin
   git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d
   popd
done
