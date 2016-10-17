#!/bin/bash
# Copyright © 2016 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Interrupt Handler
#-------------------------------------------------------------------------------
graceful_shutdown() {
    echo ""
    echo "|------------------------------------"
    echo "| Stopping $project service      "
    echo "|------------------------------------"
    /release/bin/$project stop
    exit $1
}

#-------------------------------------------------------------------------------
# Verify Environment variables are set and provide defaults.
#-------------------------------------------------------------------------------
if [ -z "$project" ];
then
  echo "Can not run. Environment variable \$project must be specified."
  exit 1;
fi ;

#-------------------------------------------------------------------------------
# Start Consul
#-------------------------------------------------------------------------------
consul_register

#-------------------------------------------------------------------------------
# Caputure Interrupt and Terminate signals
#-------------------------------------------------------------------------------
trap graceful_shutdown INT
trap graceful_shutdown TERM
trap graceful_shutdown SIGTERM

#-------------------------------------------------------------------------------
# Start Release
#-------------------------------------------------------------------------------
print_heading "Starting project ($project)"c
/release/bin/$project start
early_exit $?

#-------------------------------------------------------------------------------
# Verify Release is Reachable.
#-------------------------------------------------------------------------------
sleep 5
/release/bin/$project ping
early_exit $?
#-------------------------------------------------------------------------------
# Tail logs to keep service running and provide output
#-------------------------------------------------------------------------------
tail -f /release/log/* &

#-------------------------------------------------------------------------------
# Spin Lock until interrupt recieved or elixir exits.
#-------------------------------------------------------------------------------
while :
do
  sleep 5
  /release/bin/$project ping
  early_exit $?
done
