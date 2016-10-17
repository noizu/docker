#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install Memcached
#-------------------------------------------------------------------------------

# PHP5 and libraries
print_heading "Installing Composer"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
