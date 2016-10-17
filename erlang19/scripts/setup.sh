#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# rebar, erlang and elixir
#-------------------------------------------------------------------------------
print_heading "rebar, erlang and elixir"
yes "" | apt-get update --fix-missing
echo " - esl-erlang " && \
dpkg -i /tmp/bin/esl-erlang_19.0.2-1~debian~jessie_amd64.deb && \
cd /tmp/bin && \
tar -xvf elixir-1.3.2.tar.gz
early_exit $?

#-------------------------------------------------------------------------------
# Installing Hex
#-------------------------------------------------------------------------------
print_heading "Installing Hex"
yes "" | mix local.hex && \
mix local.rebar --force && \
cp /root/.mix/rebar /usr/bin/rebar && \
cp /root/.mix/rebar3 /usr/bin/rebar3 
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
