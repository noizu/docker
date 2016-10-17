# Memcached Container

FROM registry.noizu.com/noizu.debian.jessie:latest

MAINTAINER Keith Brings <keith.brings@noizu.com>

#================================#
# Ports                          #
#================================#
EXPOSE 11211

#====================================================#
# Daemon                                             #
#====================================================#
CMD ["/tmp/scripts/noizu.memcached/daemon.sh"]

#====================================================#
# Setup Instance                                     #
#====================================================#
ADD ./config/memcached.json /etc/consul.d/
ADD ./scripts/setup.sh /tmp/scripts/noizu.memcached/setup.sh
RUN /tmp/scripts/noizu.memcached/setup.sh

#====================================================#
# Binplace Config & Daemon                           #
#====================================================#
ADD ./scripts/daemon.sh /tmp/scripts/noizu.memcached/daemon.sh
ADD ./config/memcached.conf /etc/memcached.conf
