#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

# Register Service
consul_register

# Update Permissions
chown jira.jira /opt/atlassian/jira/logs -R
chown jira.jira /var/atlassian/application-data/jira -R

# Start Jira
/opt/atlassian/jira/bin/start-jira.sh

# tail logs
tail -f /opt/atlassian/jira/logs/catalina.out
