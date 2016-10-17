# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest

MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

#====================================#
# Binaries                           #
#====================================#
# - rebar.2.5.1
# - elixir*.deb
# - esl-erlang*.deb
ADD ./bin/ /tmp/bin

ENV PATH /tmp/bin/elixir-1.2/bin/:$PATH

#====================================#
# Setup Container                    #
#====================================#
ADD scripts/setup.sh /tmp/scripts/noizu.erlang.base/setup.sh
RUN /tmp/scripts/noizu.erlang.base/setup.sh
