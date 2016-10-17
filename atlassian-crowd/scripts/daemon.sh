#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

# Register Service
consul_register

# Update Permissions
touch /src/atlassian-crowd-2.8.3/logs/atlassian-crowd.log
chown crowd.crowd /src -R
chown crowd.crowd /opt/crowd -R

# Start Crowd
cd /src/atlassian-crowd-2.8.3/
./start_crowd.sh

# tail logs
tail -f logs/atlassian-crowd.log

