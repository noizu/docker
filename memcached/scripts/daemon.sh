#!/bin/bash


# Register Service
echo "Registering Consul Service"
ping dns.node.consul -c 5
consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join dns.node.consul &

# force mysql start (should conditionally check and only restart if needed - would be nice to be able to save image ram and reload)
echo "Starting Memcached Daemon"
service memcached restart
service memcached status 

# tail logs for daemon
echo "following log"
tail -f /var/log/memcached.log
