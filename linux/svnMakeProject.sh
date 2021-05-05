#!/bin/bash

SVN_HOME=/archive/files/repository

argc=$#
argv0=$0
argv1=$1

echo 'create project' $SVN_HOME/$argv1

svnadmin create $SVN_HOME/$argv1
echo 'complete create project'

echo 'chown www-data'
chown -R root:www-data $SVN_HOME/$argv1

echo 'chmod 770'
chmod -R 770 $SVN_HOME/$argv1

exit 0
