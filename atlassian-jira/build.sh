#!/bin/bash

# build docker and tag as elixir-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

INSTALLER=atlassian-jira-software-7.1.6-jira-7.1.6-x64.bin
INSTALLER_DL=https://www.dropbox.com/s/aiapvzc73iv21pp/atlassian-jira-software-7.1.6-jira-7.1.6-x64.bin?dl=0

if [ -f "$DIR/bin/$INSTALLER" ]
then
  echo "$INSTALLER already exists. Skipping download."
  echo "------------------------------------------------------------------------------------"
  echo ""
else
  echo "downloading $INSTALLER file required to build crowd image."
  echo "------------------------------------------------------------------------------------"
  echo ""
  mkdir -p $DIR/bin
  wget $INSTALLER_DL -O $DIR/bin/$INSTALLER
  chmod u+x $DIR/bin/$INSTALLER
fi

sudo docker build -t "registry.noizu.com/noizu.atlassian.jira" $DIR
