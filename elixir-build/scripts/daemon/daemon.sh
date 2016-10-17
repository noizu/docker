#!/bin/bash
# Copyright © 2016 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


_sigterm() {
  echo "Forwarding SIGTERM"
  kill -SIGTERM "$child" > /dev/null 2>/dev/null
  echo "waiting for child to exit"
  wait "$child"
}

_term() {
  echo "Forwarding TERM"
  kill -TERM "$child" > /dev/null 2>/dev/null
  echo "waiting for child to exit"
  wait "$child"
}

_int() {
  echo "Forwarding INT"
  kill -INT "$child" > /dev/null 2>/dev/null
  echo "waiting for child to exit"
  wait "$child"
}

#-------------------------------------------------------------------------------
# Run sub script based on $action variable.
#-------------------------------------------------------------------------------
print_heading "Running Action $action"

trap _sigterm SIGTERM
trap _term TERM
trap _int INT

# -- Run action
if [ "$action" == "run" ]
then
  $DIR/run.sh &
  child=$!
  echo "Waiting for $child"
  wait "$child"
  early_exit $?; exit 0
fi

# -- Build action
if [ "$action" == "build" ]
then
  $DIR/build.sh &
  child=$!
  echo "Waiting for $child"
  wait "$child"
  early_exit $?; exit 0
fi

echo "Unknown or No Action Specified ($action)"
echo ""
exit 1
