#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install libwxgtk3, libssl, rebar, erlang and elixir
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
apt-get install -y git && \
echo " - esl-erlang " && \
dpkg -i /tmp/bin/esl-erlang_18.2-1-debian-jessie_amd64.deb  && \
cd /tmp/bin && \
tar -xvf elixir-1.2.tar.gz && \
cd / && \
mv /tmp/bin/rebar.2.5.1 /usr/bin/rebar && \
chmod u+x /usr/bin/rebar
early_exit $?

#-------------------------------------------------------------------------------
# Installing Hex
#-------------------------------------------------------------------------------
print_heading "Installing Hex"
yes "" | mix local.hex
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
