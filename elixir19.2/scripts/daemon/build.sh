#!/bin/bash
# Copyright © 2017 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

print_heading "Call /src/prepare-release.sh"
cd /app/src
./prepare-release.sh
early_exit $?
