#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh


#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Newrelic
#-------------------------------------------------------------------------------
print_heading "Setting up newrelic"
apt-get update && \
apt-get install -y sudo wget && \
wget -O - https://download.newrelic.com/548C16BF.gpg | sudo apt-key add - && \
echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
apt-get update && \
apt-get install -y newrelic-php5 && \
yes $NEWRELIC | newrelic-install install && \
yes "" | apt-get remove wget
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt

