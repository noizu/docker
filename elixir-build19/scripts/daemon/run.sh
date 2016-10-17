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
    /app/rel/bin/$project stop
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
wait_exrm() {
  if [ $1 -eq 0 ]
  then
    echo "[Success] Elixir EXRM start succeeded."
  else
    echo "[Failure] Elixir EXRM not yet started. . ."
    sleep 20
  fi
}
/app/rel/bin/$project ping

#-------------------------------------------------------------------------------
# Start Consul
#-------------------------------------------------------------------------------

if [ -z "$CONSUL_ENABLED" ];
then
  echo "Consul Disabled."
else
  consul_register
fi

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
/app/rel/bin/$project start
early_exit $?

#-------------------------------------------------------------------------------
# Verify Release is Reachable.
#-------------------------------------------------------------------------------
/app/rel/bin/$project ping
wait_exrm $?
/app/rel/bin/$project ping
wait_exrm $?
/app/rel/bin/$project ping
wait_exrm $?
/app/rel/bin/$project ping
wait_exrm $?
/app/rel/bin/$project ping
wait_exrm $?
/app/rel/bin/$project ping
wait_exrm $?
/app/rel/bin/$project ping
early_exit $?

#-------------------------------------------------------------------------------
# Pipe output
#-------------------------------------------------------------------------------
tail -F /app/rel/log/* &

#-------------------------------------------------------------------------------
# Spin Lock until interrupt recieved or elixir exits.
#-------------------------------------------------------------------------------
while :
do
  /app/rel/bin/$project ping > /dev/null 2>&1
  OUTCOME=$?

  if [ $OUTCOME -eq 0 ]
  then
   sleep 30
  else
    echo "[Failure] Unable to reach project. Waiting 30 seconds then restarting."
    sleep 30
    /app/rel/bin/$project ping > /dev/null 2>&1
    OUTCOME=$?
    if [ $OUTCOME -eq 0 ]
    then
       sleep 30
    else
       echo "[Failure] Unable to reach project. Restarting"
       /app/rel/bin/$project restart
       # Sleep 30 then do: /app/rel/bin/$project start
       sleep 300
    fi
  fi
done
