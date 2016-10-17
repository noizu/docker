# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.wheezy:latest

MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

#====================================#
# Users                              #
#====================================#
RUN groupadd -g 70827007 erluser && useradd -u 70827008 -g erluser erluser

#====================================#
# Binaries                           #
#====================================#
# - rebar.2.5.1
# - elixir*.deb
# - esl-erlang*.deb
ADD ./bin /tmp/bin

#====================================#
# Setup Container                    #
#====================================#
ADD scripts/setup.sh /tmp/scripts/noizu.erlang17.base/setup.sh
RUN /tmp/scripts/noizu.erlang17.base/setup.sh
