#!/bin/bash

echo "---------------------------------------------------------"
echo "-           RabbitMQ Docker Daemon                      -"
echo "---------------------------------------------------------"

# Register Service
echo "1. Registering Consul Service"
ping dns.node.consul -c 5
consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join dns.node.consul &

echo "2. Setting ulimit to $ULIMIT_OPTION"
ulimit -n $ULIMIT_OPTION

# Setup Data Folder
echo "3. Set /data folder permissions"
# TODO need to force UIDs and perform initial setup if this is a mounted not initial folder created on build.
mkdir -p /home/rabbitmq
chown rabbitmq:rabbitmq /data -R
chown rabbitmq:rabbitmq /home/rabbitmq -R

# Enable  Management Plugin
echo "4. Enable Management Plugin"
rabbitmq-plugins enable rabbitmq_management

echo "5. Start rabbitmq-server"
rabbitmq-server

# Legacy - we may need this in the future.
#echo "Starting rabbitmq-server (passing options)"
#exec rabbitmq-server $@
