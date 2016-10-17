#!/bin/bash

# build docker and tag as elixir-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


if [ -f "$DIR/bin/atlassian-crowd-2.8.3.tar.gz" ]
then
  echo "atlassian-crowd-2.8.3.tar.gz already exists. Skipping download."
  echo "------------------------------------------------------------------------------------"
  echo ""
else
  echo "downloading atlassian-crowd-2.8.3.tar.gz file required to build crowd image."
  echo "------------------------------------------------------------------------------------"
  echo ""
  mkdir -p $DIR/bin
  wget https://www.dropbox.com/s/qyxqvznnrfly0s1/atlassian-crowd-2.8.3.tar.gz?dl=1 -O $DIR/bin/atlassian-crowd-2.8.3.tar.gz
  chmod u+x $DIR/bin/atlassian-jira-6.4.7-x64.bin
fi

sudo docker build -t "registry.noizu.com/noizu.atlassian.crowd" $DIR
