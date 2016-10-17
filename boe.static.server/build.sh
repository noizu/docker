#!/bin/bash

# working dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

sudo docker build -t "registry.noizu.com/boe.static.server" $DIR
