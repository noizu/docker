#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install git, make, gcc, automake, vim, hex and pheonix
# Vim: for dev instances based on build image.
#-------------------------------------------------------------------------------
print_heading "Install git, make, gcc, automake, node and tools for dev"
apt-get install -y git && \
apt-get install -y make && \
apt-get install -y gcc && \
apt-get install -y automake && \
apt-get install -y vim && \
apt-get -y install tree && \
apt-get -y install mysql-client && \
yes "" | mix local.hex
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
