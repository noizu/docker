#!/bin/bash
# Copyright © 2017 Noizu Labs, Inc. All rights reserved.

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
sudo docker build -t "noizulabs/elixir:1.13.2" $DIR