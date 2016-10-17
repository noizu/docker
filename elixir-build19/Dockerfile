# vim:set ft=dockerfile:
# Copyright © 2016 Noizu Labs, Inc. All rights reserved.

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
# 4. User per project container with appropriate consul configuration files
# enabled.
#
#
# -- Environment Variables
# ENV target prod - mix build target prod|test|dev
# ENV action run - script to run on start.  build|run
# ENV project noizu_rpg - name of project for run script.
#-------------------------------------------------------------------------------

FROM registry.noizu.com/noizu.erlang19:latest
MAINTAINER Keith Brings "keith.brings@noizu.com"

#====================================#
# Volumes                            #
#====================================#
# Mounting mnesia to simplify re-use.
VOLUME ["/mnt/mnesia", "/app/src", "/app/rel", "/app/exrm", "/var/log"]

#====================================#
# Build Action                       #
#====================================#
CMD ["/tmp/scripts/noizu.elixir.build/daemon/daemon.sh"]

#====================================#
# SCRIPTS                            #
#====================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.elixir.build/setup.sh
ADD ./bin/node-v6.2.1-linux-x64.tar.xz /tmp/bin/

RUN /tmp/scripts/noizu.elixir.build/setup.sh

#====================================#
# PORTS - Used for Dev Instance      #
#====================================#
EXPOSE 80
EXPOSE 443
EXPOSE 4469
#====================================#
# Adding node/bin to executable path #
#====================================#
ENV PATH /tmp/bin/node-v6.2.1-linux-x64/bin/:$PATH

ENV target prod
ENV action run
ENV project noizu_rpg

#====================================#
# Mounts and Daemons                 #
#====================================#
ADD scripts/daemon /tmp/scripts/noizu.elixir.build/daemon
