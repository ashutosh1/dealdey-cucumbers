#!/bin/bash

#run any file on prep server by giving complete path of file, it will copy the file and then run the script and then it will remove the file
if [ "$1" != "" ]; then
  if test -e $1; then 
    FILE_NAME=`basename $1`
    scp $1 vinsol@prep.dealdey.com:~
  else
    echo "file not foud at given path, aborting..."
    exit
  fi
else
  echo "Please provide file(with complete path) to run"
  exit
fi

ssh vinsol@prep.dealdey.com -- <<@@
  cd apps/dealdey_prep/current
  RAILS_ENV=prep ruby ~/$FILE_NAME
  rm ~/$FILE_NAME
  exit
@@
