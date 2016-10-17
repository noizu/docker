# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.erlang17:latest
MAINTAINER Keith Brings "keith.brings@noizu.com"

#====================================#
# Volumes                            #
#====================================#
VOLUME /src
VOLUME /root/.hex

#====================================#
# Build Action                       #
#====================================#
CMD ["/tmp/scripts/noizu.erlang17.build/build.sh"]

#====================================#
# SCRIPTS                            #
#====================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.erlang17.build/setup.sh
RUN /tmp/scripts/noizu.erlang17.build/setup.sh

ADD ./scripts/build.sh /tmp/scripts/noizu.erlang17.build/build.sh
