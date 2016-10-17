#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install libwxgtk3, libssl
#-------------------------------------------------------------------------------
print_heading "Install libwxgtk3, libssl, rebar, erlang and elixir"
yes "" | apt-get update --fix-missing
echo " - libwxgtk 3.0" && \
apt-get install -y libwxgtk3.0-0
apt-get install -y libwxgtk3.0-0 && \
echo " - libssl 1.0" && \
apt-get install -y libssl1.0.0 && \
echo " - wget " && \
apt-get install -y wget && \
echo " - git " && \
apt-get install -y git
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
