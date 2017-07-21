# vim:set ft=dockerfile:
# Copyright © 2017 Noizu Labs, Inc. All rights reserved.

#-------------------------------------------------------------------------------
# Usage: Elixir container for building, running or debugging projects.
#
# --- build notes:
# 1. set $action to build
# 2. Mount project to be built to /src folder.
# 3. Script works on assumption that a build script /src/prepare-release.sh
# exists and is executable.
# --- run notes:
# 1. set $action to run
# 2. Mount your project's rel/ folder to /release
# 3. set env variable project to name of your project
# (so run can start/stop node)
# 4. User per project conatiner with appropriate consul configuration files
# enabled.
#
#
# -- Environment Variables
# ENV target prod - mix build target prod|test|dev
# ENV action run - script to run on start.  build|run
# ENV project noizu - name of project for run script.
#-------------------------------------------------------------------------------

FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Keith Brings "keith.brings@noizu.com"

#=================================================#
# Setup Container - base                          #
#=================================================#
ADD scripts/setup.deps.sh /tmp/scripts/noizu.elixir/setup.deps.sh
RUN /tmp/scripts/noizu.elixir/setup.deps.sh

#=================================================#
# Setup Container - Erlang                        #
#=================================================#
ENV ERLANG_PACKAGE esl-erlang_20.0-1~debian~jessie_amd64
ADD ./bin/${ERLANG_PACKAGE}.deb /tmp/deb/
ADD scripts/setup.erlang.sh /tmp/scripts/noizu.elixir/setup.erlang.sh
RUN /tmp/scripts/noizu.elixir/setup.erlang.sh

#=================================================#
# Setup Container - Elixir                        #
#=================================================#
ENV ELIXIR_PACKAGE elixir-1.5.0-rc.2
ENV PATH /usr/share/${ELIXIR_PACKAGE}/bin/:$PATH
ADD ./bin/${ELIXIR_PACKAGE}.tar.xz /usr/share/
RUN yes "" | mix local.hex && mix local.rebar --force && cp /root/.mix/rebar /usr/bin/rebar && cp /root/.mix/rebar3 /usr/bin/rebar3

#=================================================#
# Setup Container - Node                          #
#=================================================#
ENV NODE_PACKAGE node-v8.2.1-linux-x64
ADD ./bin/${NODE_PACKAGE}.tar.xz /usr/share/
ENV PATH /usr/share/${NODE_PACKAGE}/bin/:$PATH

#====================================#
# Other Environment Variables
#====================================#
ENV target prod

#====================================#
# Volumes                            #
#====================================#
# Mounting mnesia to simplify re-use.
#VOLUME ["/mnt/", "/app/src", "/app/relelease", "/var/log"]

#=================================================#
# Fine tune terminal settings.                    #
#=================================================#
#ADD scripts/setup.term.sh /tmp/scripts/noizu.elixir/setup.term.sh
#RUN /tmp/scripts/noizu.elixir/setup.term.sh
#ADD scripts/daemon /tmp/scripts/noizu.elixir/daemon

#====================================#
# PORTS - Used for Dev Instance      #
#====================================#
EXPOSE 80
EXPOSE 443
EXPOSE 4469
