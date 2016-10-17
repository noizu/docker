#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

# Register Service
consul_register

# Set Permissions
mkdir -p /opt/atlassian/confluence/conf/Standalone
chown confluence.confluence /opt/atlassian/confluence/conf/Standalone -R 
chown confluence.confluence /opt/atlassian/confluence/logs -R
chown confluence.confluence /var/atlassian/application-data/confluence -R

# Start Jira
/opt/atlassian/confluence/bin/start-confluence.sh

# tail logs
tail -f /opt/atlassian/confluence/logs/catalina.out
