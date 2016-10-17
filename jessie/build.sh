#!/bin/bash

# build docker and tag as elixir-container
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

sudo docker build -t "registry.noizu.com/noizu.debian.jessie" $DIR  
