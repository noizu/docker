#!/bin/bash

HP=1
print_heading() {
  echo ""
  echo "$HP. $1"
  echo "------------------------------------------------------------"
  HP=$((HP + 1))
}

early_exit() {
  if [ $1 -eq 0 ]
  then
    echo "[Success] Proceeding"
  else
    echo "[Failure] Halting Build"
    exit $1
  fi
}

update_apt() {
  print_heading "Refresh Apt Cache"
  rm -f /var/cache/apt/partial/*  && \
  rm -f /var/cache/apt/*.deb && \
  yes "" | apt-get update
  early_exit $?
}

purge_apt() {
  print_heading "Purging Apt Cache"
  rm -rf /var/lib/apt/lists/*  && \
  rm -f /var/cache/apt/partial/*  && \
  rm -f /var/cache/apt/*.deb
  early_exit $?
}

consul_register() {
  if [ "$DISABLE_CONSUL" = true ] ; then
    print_heading "Skipping Consul Service"
  else
    print_heading "Registering Consul Service"
    ping dns.node.consul -c 5
    if [ "$DOCKER_DEV" =  true ] ; then
       echo "Starting Consul in Dev Mode. Output piped to /var/log/consul.log"
       echo "Note: We may need to tweak config files here to differentiate dev nodes"
       consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join dns.node.consul > /var/log/consul.log 2>&1  &
    else
       consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join dns.node.consul & 
    fi
  fi
}

log_verbose() {
  if [ "$VERBOSE" = true ] ; then
    echo "$1"
  else
    echo "Supressed"
  fi
}

check_outcome() {
  OUTCOME=$?
  echo $1
  log_verbose $1
  early_exit $OUTCOME
}
