# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

#====================================#
# Users                              #
#====================================#
# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -g 70827009 postgres && useradd -u 70827010 -g postgres postgres

# Environment Variables
ENV PG_MAJOR 9.4
ENV PG_VERSION 9.4.5-1.pgdg80+1
ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH
ENV PGDATA /var/lib/postgresql/data

# Volume
VOLUME /var/lib/postgresql/data

# EntryPoint & Daemon
ENTRYPOINT ["/tmp/scripts/noizu.postgres/docker-entrypoint.sh"]
CMD ["postgres"]

# Ports
EXPOSE 5432

# Setup
COPY ./scripts/setup.sh /tmp/scripts/noizu.postgres/setup.sh
RUN /tmp/scripts/noizu.postgres/setup.sh

# Copy Commands Last To Reduce Build Times
COPY scripts/docker-entrypoint.sh /tmp/scripts/noizu.postgres/docker-entrypoint.sh
COPY config/ /etc/consul.d/
