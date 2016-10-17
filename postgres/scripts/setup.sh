#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Setup Postgres Repo Requirements
#-------------------------------------------------------------------------------
print_heading "Setup Postgres Repo Requirements"
apt-get install -y curl && \
gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 && \
curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)"  && \
curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc"  && \
echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list && \
gpg --verify /usr/local/bin/gosu.asc  && \
rm /usr/local/bin/gosu.asc  && \
chmod +x /usr/local/bin/gosu
early_exit $?

#-------------------------------------------------------------------------------
# Install and Configure Postgres
#-------------------------------------------------------------------------------
print_heading "Install and Configure Postgres"
apt-get update && \
mkdir /docker-entrypoint-initdb.d && \
mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql && \
apt-get install -y postgresql-common && \
sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf && \
apt-get install -y postgresql-$PG_MAJOR=$PG_VERSION postgresql-contrib-$PG_MAJOR=$PG_VERSION
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
