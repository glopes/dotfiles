#!/bin/bash
REPO_NAME=...
OLD_SERVER=git@github.com:glopes/dotfiles.git
NEW_SERVER=user@server
git clone ssh://$OLD_SERVER/$REPO_NAME temp &&
cd temp &&
for BRANCH in $(ls -1 .git/refs/heads/)
	do git push ssh://$NEW_SERVER/$REPO_NAME $BRANCH
done &&
git push --tags ssh://$NEW_SERVER/$1 &&
cd .. &&
rm -rf temp
