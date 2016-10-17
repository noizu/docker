#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install git, make, gcc, automake
#-------------------------------------------------------------------------------
print_heading "Install git, make, gcc, automake"
apt-get install -y git && \
apt-get install -y make && \
apt-get install -y gcc && \
apt-get install -y automake
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
