#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

# Register Service
consul_register

# Update Permissions
mkdir -p /src/fecru-3.10.1/var/log/
touch /src/fecru-3.10.1/var/log/fisheye.out
chown crucible.crucible /src -R

# Start Crucible
cd /src/fecru-3.10.1/bin/
./start.sh

# tail logs
tail -f /src/fecru-3.10.1/var/log/fisheye.out

