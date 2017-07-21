#!/bin/bash
# Copyright © 2017 Noizu Labs, Inc. All rights reserved.
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# changing Directory Colors to Yellow to play nice with windows.
#-------------------------------------------------------------------------------
print_heading "Setting Directory Color to Yellow for better Readability"
echo "LS_COLORS=\$LS_COLORS:'di=0;93:' ; export LS_COLORS" >> ~/.bashrc
