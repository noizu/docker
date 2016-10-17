# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest


#------------------------------- Notes -----------------------------------------
# Environment Variables:
# ----- Required
# MYSQL_ROOT_PASSWORD
# MYSQL_PASSWORD
# MYSQL_USER
# ----- Optional
# MYSQL_DATABASE=noizu
# MYSQL_ALLOW_EMPTY_PASSWORD
#

#================================#
# Setup Users                    #
#================================#
# add our user and group first to make sure their IDs get assigned consistently,
# regardless of whatever dependencies get added later on
RUN groupadd -g 70827005 mysql && useradd -u 70827006 -g mysql mysql

#================================#
# Environment Variables          #
#================================#
ENV PERCONA_MAJOR 5.6
ENV PERCONA_VERSION 5.6.27-75.0-1.jessie
ENV MYSQL_DATABASE=noizu

#================================#
# Ports                          #
#================================#
EXPOSE 3306

#================================#
# Volumes                        #
#================================#
VOLUME /var/lib/mysql

#================================#
# EntryPoint                     #
#================================#
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld"]

#================================#
# Setup Container                #
#================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.mysql/setup.sh
RUN /tmp/scripts/noizu.mysql/setup.sh

#================================#
# Binplace Required Files        #
#================================#
COPY config/etc/ /etc/
COPY scripts/docker-entrypoint.sh /
