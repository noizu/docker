# Noizu.Util.Mysql.Base Container

FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Keith Brings <keith.brings@noizu.com>

#====================================================#
# Setup Instance                                     #
#====================================================#
ADD ./scripts/setup.sh /tmp/scripts/noizu.util.mysql.base/setup.sh
RUN /tmp/scripts/noizu.util.mysql.base/setup.sh

#====================================================#
# Binplace Liquibase Dependencies                    #
#====================================================#
ADD ./ext/liquibase-3.3.2-bin.tar.gz /tmp/liquibase
ADD ./ext/mysql-connector-java-5.1.29-bin.jar ./tmp/mysql-connector-java-5.1.29-bin.jar
