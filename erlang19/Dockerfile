# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

#====================================#
# Setup Elixir Deps                  #
#====================================#
ADD scripts/setup-deps.sh /tmp/scripts/noizu.erlang.base/setup-deps.sh
RUN /tmp/scripts/noizu.erlang.base/setup-deps.sh

#====================================#
# Binaries                           #
#====================================#
# - rebar3
# - elixir*.deb
# - esl-erlang*.deb
ADD ./bin/ /tmp/bin
ENV PATH /tmp/bin/elixir-1.3.2/bin/:$PATH

#====================================#
# Setup Erlang & Elixir              #
#====================================#
ADD scripts/setup.sh /tmp/scripts/noizu.erlang.base/setup.sh
RUN /tmp/scripts/noizu.erlang.base/setup.sh

