# RabbitMQ Server
FROM registry.noizu.com/noizu.erlang18:latest
MAINTAINER Keith Brings <keith.brings@noizu.com>

#------------------------------------------------------------------------------#
#
# Notes:
# ==========
#
# This is the base rabbitmq object. In the future our topology will include
# redundancy of these instances to insure uptime.
#
# The /data folder is flagged as a volume
# to allow for -v mounting and separation from the union file system.
#
# = Ports
# Rabbit MQ uses a number of ports, we currently only expose two  required AMQP
# ports along with the Management Plugin port.
# == Exposed Ports
# 5671 - AMQP 0-9-1 (TLS)
# 5672 - AMQP 0-9-1
# 15672 - Management Plugin
#
# == Other Ports
# 4369 - epmd
# 25672 - erlang distribution(?)
# 61613, 61614 - STOMP
# 1883, 8883 - MQTT
#------------------------------------------------------------------------------#

RUN groupadd -g 70827011 rabbitmq && useradd -u 70827012 -g rabbitmq rabbitmq

#====================================#
# RabitMq Env Vars                   #
#====================================#
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

#====================================#
# Ports                              #
#====================================#
EXPOSE 5671 5672 15672

#====================================#
# Separate /data from unionfs        #
#====================================#
VOLUME ["/data"]

#====================================#
# Setup container                    #
#====================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.rabbitmq/setup.sh
RUN /tmp/scripts/noizu.rabbitmq/setup.sh

#====================================#
# Consul.IO                          #
#====================================#
ADD ./config/consul.rabbitmq.json ./config/consul.rabbitmq-tls.json ./config/consul.rabbitmq-management.json /etc/consul.d/

#====================================#
# Add Daemon Script                  #
#====================================#
# Adding this separatly from setup.sh because we will need to add some
# tweaks to configure /data on initial run if using a mounted folder.
ADD ./scripts/daemon.sh /tmp/scripts/noizu.rabbitmq/daemon.sh

#====================================#
# RabbitMq Config                    #
#====================================#
# This is done after installation to allow configuration updates with out
# rebuilding entire container..
ADD ./config/rabbitmq.config /etc/rabbitmq/rabbitmq.config

#=================================#
# Daemon & Run Options            #
#=================================#
ENV ULIMIT_OPTION 8192
CMD ["/tmp/scripts/noizu.rabbitmq/daemon.sh"]
