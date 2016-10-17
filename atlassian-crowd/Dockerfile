# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

RUN groupadd -g 70827032 crowd && useradd -u 70827033 -g crowd crowd

#================================#
# Volumes                        #
#================================#
VOLUME ["/opt/crowd"]

#===================================#
# Install Atlassian with Defaults   #
#===================================#
ADD ./bin/atlassian-crowd-2.8.3.tar.gz /src

#===================================#
# Daemon                            #
#===================================#
CMD ["/tmp/scripts/noizu.atlassian.crowd/daemon.sh"]

#===================================#
# Binplace                          #
#===================================#
ADD ./scripts/ /tmp/scripts/noizu.atlassian.crowd/
ADD ./config/consul.d/ /etc/consul.d/
ADD ./config/crowd/build.properties /src/atlassian-crowd-2.8.3/build.properties


#===================================#
# Build Image                       #
#===================================#
RUN /tmp/scripts/noizu.atlassian.crowd/setup.sh


#===================================#
# Ports                             #
#===================================#
EXPOSE 80
