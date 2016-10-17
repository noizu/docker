# Noizu.Coffee.Build Container
FROM registry.noizu.com/noizu.util.node:latest
MAINTAINER Keith Brings <keith.brings@noizu.com>

#====================================================#
# Changeset Mountpoint                               #
#====================================================#
VOLUME /docker-source
VOLUME /docker-output

#====================================================#
# Migrate Script                                     #
#====================================================#
CMD ["/tmp/scripts/noizu.coffee.build/build.sh"]
ADD ./scripts/build.sh /tmp/scripts/noizu.coffee.build/build.sh
