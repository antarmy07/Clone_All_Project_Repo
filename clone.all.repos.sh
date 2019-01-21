#!/bin/bash

echo -n "Username: ";
read username;

#Enabling echo
echo

echo -n "Location to clone repositories in: ";
read location;

mkdir -p "$location";
cd "$location";

#Getting all projects

curl --user $username "URL OF THE REPO OR PROJECT" | grep _COMMON NAME OF THE REPOS | awk -F ">" '{print$2}' | sed 's:</a::' | xargs -I {} echo "git@github:REPONAME/{}" > clone_project_repos.sh
sh clone_project_repos.sh

exit 0;
