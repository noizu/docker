# Memcached Container
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Keith Brings <keith.brings@noizu.com>

#================================#
# users                          #
#================================#
RUN groupadd -g 70827003 mongodb && useradd -u 70827004 -g mongodb mongodb


#================================#
# Ports                          #
#================================#
EXPOSE 27017

#================================#
# Volumes                        #
#================================#
VOLUME /var/lib/mongodb

#====================================================#
# Configure Container                                #
#====================================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.mongodb/setup.sh
RUN /tmp/scripts/noizu.mongodb/setup.sh

#====================================================#
# Daemon                                             #
#====================================================#
ENTRYPOINT ["/tmp/scripts/noizu.mongodb/docker-entrypoint.sh"]
CMD ["/usr/bin/mongod", "-f", "/etc/mongodb.conf"]

#====================================================#
# Binplace Config & Daemon                           #
#====================================================#
ADD ./config/mongodb.json /etc/consul.d/
ADD ./config/mongodb.conf /etc/mongodb.conf
ADD ./scripts/docker-entrypoint.sh /tmp/scripts/noizu.mongodb/docker-entrypoint.sh
