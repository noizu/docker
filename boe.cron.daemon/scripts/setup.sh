#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install Percona
#-------------------------------------------------------------------------------
print_heading "Install Cron"
yes "" | apt-get install -y cron && 
touch /var/log/cron.log && 
chgrp nginx /var/log/cron.log && 
chmod g+rw /var/log/cron.log &&
chmod go-rw /var/log/cron.d/* &&
chown nginx /var/log/cron.d/boe-cron
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
