#!/bin/bash

# build docker and tag as rabbit-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
sudo docker build -t "registry.noizu.com/noizu.rabbitmq" $DIR/
