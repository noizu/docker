# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.erlang18:latest
MAINTAINER Keith Brings "keith.brings@noizu.com"

#====================================#
# Users                              #
#====================================#
RUN groupadd -g 70827007 erluser && useradd -u 70827008 -g erluser erluser

#====================================#
# Volumes                            #
#====================================#
VOLUME /src
VOLUME /root/.hex

#====================================#
# Build Action                       #
#====================================#
CMD ["/tmp/scripts/noizu.erlang18.build/build.sh"]

#====================================#
# SCRIPTS                            #
#====================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.erlang18.build/setup.sh
RUN /tmp/scripts/noizu.erlang18.build/setup.sh

ADD ./scripts/build.sh /tmp/scripts/noizu.erlang18.build/build.sh
