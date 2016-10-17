#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

cd /src
print_heading "Rebar Getting Dependencies"
rebar g-d

print_heading "Rebar Compiling"
rebar co
