#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh
set -e

echo "---------------------------------------------------------"
echo "-           Boe Cron Daemon                             -"
echo "---------------------------------------------------------"


touch /var/log/cron.log &&
chgrp nginx /var/log/cron.log &&
chmod g+rw /var/log/cron.log

touch /var/log/cron.1m.log &&
chgrp nginx /var/log/cron.1m.log &&
chmod g+rw /var/log/cron.1m.log

touch /var/log/cron.5m.log &&
chgrp nginx /var/log/cron.5m.log &&
chmod g+rw /var/log/cron.5m.log

touch /var/log/cron.60m.log &&
chgrp nginx /var/log/cron.60m.log &&
chmod g+rw /var/log/cron.60m.log

touch /var/log/cron.24h.log &&
chgrp nginx /var/log/cron.24h.log &&
chmod g+rw /var/log/cron.24h.log



mkdir -p /var/log/exim4
chmod go+rwx /var/log/exim4

# Daemon
print_heading "Running Cron"
rsyslogd
cron
tail -f /var/log/syslog /var/log/cron.60m.log /var/log/cron.24h.log
