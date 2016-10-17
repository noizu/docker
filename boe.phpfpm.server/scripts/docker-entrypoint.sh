#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh
set -e

echo "---------------------------------------------------------"
echo "-           NGINX Docker EntryPoint                     -"
echo "---------------------------------------------------------"

# Register Service
consul_register



# Dependency
print_heading "Starting php5-fpm"
service php5-fpm start

service newrelic-daemon restart

# Daemon
print_heading "Running CMD"
mkdir -p /var/log/nginx
chown nginx.nginx /src -R
$@
