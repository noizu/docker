#!/bin/bash

# build docker and tag as elixir-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

INSTALLER=crucible-3.10.1.tar.gz
INSTALLER_DL=https://www.dropbox.com/s/2ksq9arajy2ckvt/crucible-3.10.1.tar.gz?dl=1 crucible-3.10.1.tar.gz

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

sudo docker build -t "registry.noizu.com/noizu.atlassian.crucible" $DIR
