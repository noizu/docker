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
# Add Elixir, Erlang Installers                   #
#=================================================#
# - elixir-1.4.2.tar.gz
# - esl-erlang*19*.deb
# - node-v8.1.3-linux.x64.tar.xz
ADD ./bin/ /tmp/bin

#====================================#
# Updating executable path and env vars
#====================================#
ENV PATH /tmp/bin/elixir-1.4.2/bin/:/tmp/bin/node-v8.1.3-linux-x64/bin/:$PATH
ENV target prod

#=================================================#
# Setup Container - elixir                        #
#=================================================#
ADD ./bin/node-v8.1.3-linux-x64.tar.xz /tmp/bin/
ADD scripts/setup.elixir.sh /tmp/scripts/noizu.elixir/setup.elixir.sh
RUN /tmp/scripts/noizu.elixir/setup.elixir.sh

#====================================#
# Volumes                            #
#====================================#
# Mounting mnesia to simplify re-use.
VOLUME ["/mnt/", "/app/src", "/app/relelease", "/var/log"]

#=================================================#
# Fine tune terminal settings.                    #
#=================================================#
ADD scripts/setup.term.sh /tmp/scripts/noizu.elixir/setup.term.sh
RUN /tmp/scripts/noizu.elixir/setup.term.sh

ADD scripts/daemon /tmp/scripts/noizu.elixir/daemon

#====================================#
# PORTS - Used for Dev Instance      #
#====================================#
EXPOSE 80
EXPOSE 443
EXPOSE 4469
