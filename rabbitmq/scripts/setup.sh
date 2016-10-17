#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Setup Repo for RabbitMq
#-------------------------------------------------------------------------------
echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list && \
wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
yes "" | apt-key add rabbitmq-signing-key-public.asc && \
apt-get update
early_exit $?

#-------------------------------------------------------------------------------
# Install RabbitMq
#-------------------------------------------------------------------------------
print_heading "Install RabbitMq"
yes "" | apt-get install rabbitmq-server
early_exit $?

#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
