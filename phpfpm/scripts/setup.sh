#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# PHP5 and libraries
#-------------------------------------------------------------------------------
print_heading "Installing PHP-FPM"
apt-get install -y php5 && \
apt-get install -y php5-fpm && \
apt-get install -y php5-mysql && \
apt-get install -y php5-memcached && \
apt-get install -y php5-dev && \
apt-get install -y erlang-dev
early_exit $?

#-------------------------------------------------------------------------------
# CURL Support for API Clients
#-------------------------------------------------------------------------------
print_heading "Installing php5-curl"
apt-get install -y curl php5-curl
early_exit $?

#-------------------------------------------------------------------------------
# APC Support
#-------------------------------------------------------------------------------
print_heading "Installing APC Module"
apt-get -y install libpcre3-dev && \
apt-get -y install php5-apcu
early_exit $?


#-------------------------------------------------------------------------------
# Compile and Deploy "Installing Peb"
#-------------------------------------------------------------------------------
print_heading "Installing PEB Module"
cd /opt/peb/mypeb-master && \
phpize && \
./configure && \
make && \
make install
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
