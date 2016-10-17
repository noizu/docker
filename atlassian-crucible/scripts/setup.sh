#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt
echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
apt-get update



#-------------------------------------------------------------------------------
# Install git, make, gcc, automake
#-------------------------------------------------------------------------------
print_heading "Install JDK 8 Backport"
apt-get install -y openjdk-8-jdk
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
