# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

RUN groupadd -g 70827020 confluence && useradd -u 70827021 -g confluence confluence

#================================#
# Volumes                        #
#================================#
VOLUME ["/var/atlassian/application-data/confluence","/opt/atlassian/confluence/logs/"]

#===================================#
# Install Atlassian with Defaults   #
#===================================#
ADD ./bin/atlassian-confluence-5.9.10-x64.bin /
RUN yes "" | /atlassian-confluence-5.9.10-x64.bin -c  && \
    echo "CONF_USER=confluence" >> /opt/atlassian/confluence/bin/user.sh && \
    echo "export CONF_USER" ?? /opt/atlassian/confluence/bin/user.sh && \
    chown confluence.confluence /opt/atlassian/confluence/work -R && \
    chown confluence.confluence /opt/atlassian/confluence/temp -R && \
    chown confluence.confluence /var/atlassian/application-data/confluence

#===================================#
# Daemon                            #
#===================================#
CMD ["/tmp/scripts/noizu.atlassian.confluence/daemon.sh"]

#===================================#
# Binplace                          #
#===================================#
ADD ./scripts/ /tmp/scripts/noizu.atlassian.confluence/
ADD ./config/ /etc/consul.d/

#===================================#
# Ports                             #
#===================================#
EXPOSE 8090
EXPOSE 8000
