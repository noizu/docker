#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

print_heading "Compile Compass Source"
cd /src
compass compile
