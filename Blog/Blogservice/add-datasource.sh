#!/bin/bash

$JBOSS_HOME/bin/jboss-cli.sh --connect <<EOF
batch

data-source add --jndi-name=java:jboss/jdbc/blogserviceDS --name=BlogServiceDS --connection-url=jdbc:postgresql://$BLOG_DB_MASTER_SERVICE_HOST:$BLOG_DB_MASTER_SERVICE_PORT/blogservice
 --driver-name=postgresql-9.4-1201.jdbc41.jar --user-name=postgres --password=postgres

run-batch
exit
EOF