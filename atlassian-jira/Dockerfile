# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

RUN groupadd -g 70827022 jira && useradd -u 70827023 -g jira jira

#================================#
# Volumes                        #
#================================#
VOLUME ["/var/atlassian/application-data/jira","/opt/atlassian/jira/logs/"]

#===================================#
# Install Atlassian with Defaults   #
#===================================#
ADD ./bin/atlassian-jira-software-7.1.6-jira-7.1.6-x64.bin /
RUN yes "" | /atlassian-jira-software-7.1.6-jira-7.1.6-x64.bin && \
    echo "JIRA_USER=jira" >> /opt/atlassian/jira/bin/user.sh && \
    echo "export CONF_USER" ?? /opt/atlassian/jira/bin/user.sh && \
    chown jira.jira /opt/atlassian/jira/work -R && \
    chown jira.jira /opt/atlassian/jira/temp -R && \
    chown jira.jira /var/atlassian/application-data/jira



#===================================#
# Daemon                            #
#===================================#
CMD ["/tmp/scripts/noizu.atlassian.jira/daemon.sh"]

#===================================#
# Binplace                          #
#===================================#
ADD ./scripts/ /tmp/scripts/noizu.atlassian.jira/
ADD ./config/ /etc/consul.d/

#===================================#
# Ports                             #
#===================================#
EXPOSE 8080
EXPOSE 8005
