#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

INSTALLER=mypeb-master.tar.gz
INSTALLER_DL=https://www.dropbox.com/s/tjn2q9f8s6a3sq5/mypeb-master.tar.gz?dl=1

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


sudo docker build -t "registry.noizu.com/noizu.phpfpm" $DIR  
