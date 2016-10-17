# Noizu.Util.Mysql.Migrate Container
FROM registry.noizu.com/noizu.util.mysql.base:latest
MAINTAINER Keith Brings <keith.brings@noizu.com>

#-------------------------------------------------------------------------------
# Notes:
# To run you will need to provide MYSQL_USER, MYSQL_PASSWORD and -v mount
# the schema folder.
#
# By default we assume that,
# the database is noizu,
# and the changelog is db.changelog-master.xml
#-------------------------------------------------------------------------------

#====================================================#
# Changeset Mountpoint                               #
#====================================================#
VOLUME /config/schema

#====================================================#
# Migrate Script                                     #
#====================================================#
CMD ["/tmp/scripts/noizu.util.mysql.migrate/migrate.sh"]
ADD ./scripts/migrate.sh /tmp/scripts/noizu.util.mysql.migrate/migrate.sh

#======================#
# Default ENV          #
#======================#
ENV DATABASE $BOE_MYSQL_DATABASE
ENV CHANGELOG db.changelog-master.xml
