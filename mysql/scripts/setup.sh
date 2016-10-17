#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Add and Configure Percona Repository
#-------------------------------------------------------------------------------
print_heading "Add and Configure Percona Repository"
rm -f /var/cache/apt/partial/* && \
rm -f /var/cache/apt/*.deb && \
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 430BDF5C56E7C94E848EE60C1C4CBDCDCD2EFD2A && \
echo 'deb http://repo.percona.com/apt jessie main' > /etc/apt/sources.list.d/percona.list && \
{ \
	echo percona-server-server-$PERCONA_MAJOR percona-server-server/root_password password 'unused'; \
	echo percona-server-server-$PERCONA_MAJOR percona-server-server/root_password_again password 'unused'; \
} | debconf-set-selections
early_exit $?

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install Percona
#-------------------------------------------------------------------------------
print_heading "Install Percona"
apt-get install -y percona-server-server-$PERCONA_MAJOR=$PERCONA_VERSION
early_exit $?

#-------------------------------------------------------------------------------
# Purge mysql directory
# - this will be instiated on mounted folder by entry-point script.
#-------------------------------------------------------------------------------
print_heading "Flush unused mysql directory "
rm -rf /var/lib/mysql/* && \
mkdir -p /var/lib/mysql
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
