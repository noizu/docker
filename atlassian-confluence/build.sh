#!/bin/bash

# build docker and tag as elixir-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

INSTALLER=atlassian-confluence-5.9.10-x64.bin
INSTALLER_DL=https://www.dropbox.com/s/0y93sq53268p10w/atlassian-confluence-5.9.10-x64.bin?dl=1

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

sudo docker build -t "registry.noizu.com/noizu.atlassian.confluence" $DIR
