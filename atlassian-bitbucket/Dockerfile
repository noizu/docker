# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

RUN groupadd -g 70827024 atlbitbucket && useradd -u 70827025 -g atlbitbucket atlbitbucket

#================================#
# Volumes                        #
#================================#
VOLUME ["/var/atlassian/application-data/bitbucket", "/opt/atlassian/bitbucket/logs/"]

#===================================#
# Install Atlassian with Defaults   #
#===================================#
ADD ./bin/atlassian-bitbucket-4.1.0-x64.bin /
RUN yes "" | /atlassian-bitbucket-4.1.0-x64.bin -c

#===================================#
# Daemon                            #
#===================================#
CMD ["/tmp/scripts/noizu.atlassian.bitbucket/daemon.sh"]

#===================================#
# Configure                          #
#===================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.atlassian.bitbucket/setup.sh
RUN /tmp/scripts/noizu.atlassian.bitbucket/setup.sh

#===================================#
# Binplace                          #
#===================================#
ADD ./config/ /etc/consul.d/
ADD ./scripts/daemon.sh /tmp/scripts/noizu.atlassian.bitbucket/daemon.sh

#===================================#
# Ports                             #
#===================================#
EXPOSE 7990
EXPOSE 8006
