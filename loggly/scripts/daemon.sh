#!/bin/bash

echo "Registering Consul Service"
ping dns.node.consul -c 5
consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join dns.node.consul &

echo "Starting rsylogd daemon"
if [ -z "$TOKEN" ]; then
  echo "Missing \$TOKEN"
  exit 1
fi

if [ -z "$TAG" ]; then
  echo "Missing \$TAG"
  exit 1
fi

sed -i "s/TOKEN/$TOKEN/" /etc/rsyslog.d/50-default.conf
sed -i "s/TAG/$TAG/" /etc/rsyslog.d/50-default.conf

exec /usr/sbin/rsyslogd -n
