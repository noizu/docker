# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.phpfpm:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

#====================================================#
# Static Conent                                      #
#====================================================#
VOLUME /src


COPY ./scripts/setup.sh /tmp/scripts/boe.cron.daemon/setup.sh

#================================#
# EntryPoint                     #
#================================#
ENTRYPOINT []
CMD ["/tmp/scripts/boe.cron.daemon/daemon.sh"]

#================================#
# Bin Place                      #
#================================#
COPY ./config/ /etc/
COPY ./scripts/daemon.sh /tmp/scripts/boe.cron.daemon/daemon.sh
