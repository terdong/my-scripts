#!/bin/bash

GIT_HOME=/gehem/git_repos/

argc=$#
argv0=$0
argv1=$1

#example: ./gitMakeProject project_name
#echo $argc $argv0 $argv1
#exit 0

if [ $# -eq 0 ]
then
  echo "project name is empty"
  exit 0
fi

echo 'create project' $GIT_HOME/$argv1

mkdir $GIT_HOME/$argv1

cd $GIT_HOME/$argv1

git init --bare --shared

echo 'complete create project'

echo 'chown git'
chown -R git:git $GIT_HOME/$argv1

echo 'chmod 770'
chmod -R 770 $GIT_HOME/$argv1

exit 0
