#!/bin/bash

# build docker and tag as elixir-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

INSTALLER=atlassian-bitbucket-4.1.0-x64.bin
INSTALLER_DL=https://www.dropbox.com/s/be81hq1df64fx4x/atlassian-bitbucket-4.1.0-x64.bin?dl=1

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

sudo docker build -t "registry.noizu.com/noizu.atlassian.bitbucket" $DIR
