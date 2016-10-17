#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh
set -e

echo "---------------------------------------------------------"
echo "-           Percona Db Docker EntryPoint                -"
echo "---------------------------------------------------------"

# Configuration
print_heading "Fixing Permissions and setting up folders"
chown mongodb.mongodb /var/lib/mongodb -R
chown mongodb.mongodb /etc/mongodb.conf
mkdir -p /var/log/mongodb

# Register Service
consul_register

# Daemon
print_heading "Running CMD"
exec "$@"
