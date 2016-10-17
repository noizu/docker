#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Install git, make, gcc, automake
#-------------------------------------------------------------------------------
print_heading "Install JDK"
apt-get install -y openjdk-7-jdk
early_exit $?

print_heading "Build Crowd"
cd /src/atlassian-crowd-2.8.3/  && \
./build.sh  && \
mkdir -p /src/atlassian-crowd-2.8.3/logs/  && \
mkdir -p /opt/crowd  && \
chown crowd.crowd /opt/crowd -R
early_exit $?

print_heading "Setting crowd dir to /src/crowd"
echo "crowd.home=/opt/crowd" >> /src/atlassian-crowd-2.8.3/crowd-webapp/WEB-INF/classes/crowd-init.properties

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
