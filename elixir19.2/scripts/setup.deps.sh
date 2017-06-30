#!/bin/bash
# Copyright © 2017 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install libwxgtk3, libssl, make, gcc, etc.
#-------------------------------------------------------------------------------
print_heading "Install libwxgtk3, libssl, rebar, gcc"
yes "" | apt-get update --fix-missing
echo " - libwxgtk 3.0" && \
apt-get install -y libwxgtk3.0-0
apt-get install -y libwxgtk3.0-0 && \
echo " - libsctp1" && \
apt-get -y install libsctp1 && \
echo " - libssl 1.0" && \
apt-get install -y libssl1.0.0 && \
echo " - wget " && \
apt-get install -y wget && \
echo " - git " && \
apt-get install -y git && \
echo " - gcc g++ make" && \
apt-get install -y gcc g++ make && \
echo " - python" && \
apt-get install -y python && \
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
