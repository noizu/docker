#!/bin/bash

cd /

# Migrate Database
/tmp/liquibase/liquibase --driver=com.mysql.jdbc.Driver --changeLogFile=config/schema/$CHANGELOG --url="jdbc:mysql://$MYSQL_SERVER_PORT_3306_TCP_ADDR:$MYSQL_SERVER_PORT_3306_TCP_PORT/$DATABASE?allowMultiQueries=true&createDatabaseIfNotExist=true" --username=$MYSQL_USER --password=$MYSQL_PASSWORD --classpath=/tmp/mysql-connector-java-5.1.29-bin.jar migrate
