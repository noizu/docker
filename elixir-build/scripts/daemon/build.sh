#!/bin/bash
# Copyright © 2016 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

print_heading "Call /src/prepare-release.sh"
cd /src
./prepare-release.sh
early_exit $?
