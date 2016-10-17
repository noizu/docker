# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

RUN groupadd -g 70827034 crucible && useradd -u 70827035 -g crucible crucible

#================================#
# Volumes                        #
#================================#
VOLUME ["/src"]

#===================================#
# Install Atlassian with Defaults   #
#===================================#
ADD ./bin/crucible-3.10.1.tar.gz /src/

#===================================#
# Daemon                            #
#===================================#
CMD ["/tmp/scripts/noizu.atlassian.crucible/daemon.sh"]

#===================================#
# Binplace                          #
#===================================#
ADD ./scripts/ /tmp/scripts/noizu.atlassian.crucible/
ADD ./config/ /etc/consul.d/


#===================================#
# Build Image                       #
#===================================#
RUN /tmp/scripts/noizu.atlassian.crucible/setup.sh


#===================================#
# Ports                             #
#===================================#
EXPOSE 8060
EXPOSE 8059
