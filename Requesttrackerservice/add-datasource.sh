#!/bin/bash

$JBOSS_HOME/bin/jboss-cli.sh --connect <<EOF
batch

data-source add --jndi-name=java:jboss/jdbc/requesttrackerDS --name=RequesttrackerDS --connection-url=jdbc:postgresql://$REQUESTTRACKER_DB_SERVICE_HOST:$REQUESTTRACKER_DB_SERVICE_PORT/requesttracker
 --driver-name=postgresql-9.4-1201.jdbc41.jar --user-name=postgres --password=postgres

run-batch
exit
EOF