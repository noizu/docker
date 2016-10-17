#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install libwxgtk2.8, rebar, erlang and elixir
#-------------------------------------------------------------------------------
print_heading "Install libwxgtk2.8, rebar, erlang and elixir"
apt-get install -y libwxgtk2.8-0 && \
apt-get install -y libssl1.0.0  && \
apt-get install -y procps  && \
apt-get install -y wget && \
apt-get install -y ca-certificates && \
dpkg -i /tmp/bin/esl-erlang_17.5.3-1~debian~wheezy_amd64.deb && \
dpkg -i /tmp/bin/elixir_1.0.5-2-debian-wheezy_amd64.deb	 && \
mv /tmp/bin/rebar.2.5.1 /usr/bin/rebar && \
chmod u+x /usr/bin/rebar
early_exit $?

# UNKNOWN Dependencies for BOE
print_heading "Installing ChicagoBoss Dependencies"
apt-get install -y git && \
apt-get install -y libxmlrpc-epi-dev libxmlrpc-epi0 && \
apt-get install -y libpam0g-dev libpam0g
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
