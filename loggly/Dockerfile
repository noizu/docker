#################################################################
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
#################################################################
# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

COPY scripts/setup.sh /tmp/scripts/noizu.loggly/setup.sh
RUN /tmp/scripts/noizu.loggly/setup.sh



EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/scripts/noizu.loggly/daemon.sh"]

# Copy directives last for faster image updates
COPY scripts/daemon.sh /tmp/scripts/noizu.loggly/daemon.sh
COPY config/50-default.conf /etc/rsyslog.d/50-default.conf
COPY config/rsyslog.conf /etc/rsyslog.conf
COPY config/loggly.json /etc/consul.d/
