#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh
set -e

echo "---------------------------------------------------------"
echo "-           NGINX Docker EntryPoint                     -"
echo "---------------------------------------------------------"

# Register Service
consul_register

# Daemon
mkdir -p /var/log/nginx
print_heading "Running CMD"
$@
