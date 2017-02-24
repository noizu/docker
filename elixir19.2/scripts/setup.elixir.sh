#!/bin/bash
# Copyright © 2017 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Bin Place binaries
#-------------------------------------------------------------------------------
print_heading "Binplacing Node & Elixir"
cd /tmp/bin && \
tar -xf node-v6.2.1-linux-x64.tar.gz && \
rm node-v6.2.1-linux-x64.tar.gz && \
tar -xf elixir-1.4.2.tar.gz  && \
rm elixir-1.4.2.tar.gz  && \
early_exit $?

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install Erlang
#-------------------------------------------------------------------------------
yes "" | apt-get update --fix-missing
echo " - esl-erlang " && \
dpkg -i /tmp/bin/esl-erlang_19.2.3-1-debian-jessie_amd64.deb && \
early_exit $?

#-------------------------------------------------------------------------------
# Installing Hex
#-------------------------------------------------------------------------------
print_heading "Installing Hex, Rebar, Rebar3"
yes "" | mix local.hex && \
mix local.rebar --force && \
cp /root/.mix/rebar /usr/bin/rebar && \
cp /root/.mix/rebar3 /usr/bin/rebar3
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
