#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

print_heading "Compile CoffeeScript Source"
coffee --compile --output /build/  /src/
