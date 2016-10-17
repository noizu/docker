#!/bin/bash

# Register Service
echo "Registering Consul Service"
ping dns.node.consul -c 5
consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join dns.node.consul &
chown atlbitbucket.atlbitbucket /opt/atlassian/ -R
chown atlbitbucket.atlbitbucket /var/atlassian/ -R

# Start Jira
cd /opt/atlassian/bitbucket/4.1.0/bin/
./start-bitbucket.sh

# tail logs
tail -f /opt/atlassian/bitbucket/4.1.0/logs/*
