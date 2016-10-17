#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install Nodejs and NPM
#-------------------------------------------------------------------------------
print_heading "Install NodeJs, CoffeeScript & Compass"
apt-get -y install nodejs && \
apt-get -y install npm && \
apt-get -y install coffeescript && \
apt-get -y install ruby ruby-dev && \
gem update && \
gem install compass && \
gem install bootstrap-sass
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
