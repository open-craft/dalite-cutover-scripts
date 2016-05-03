#!/usr/bin/env bash

set -e

mysql --host '{{ NEW_MYSQL_DALITE_HOST }}' --user '{{ NEW_MYSQL_DALITE_USER }}' '--password={{ NEW_MYSQL_DALITE_PASSWORD }}' '{{ NEW_MYSQL_DALITE_DATABASE }}' < drop-database.sql

echo "Cleared new database. Loading dump"

mysql --host '{{ NEW_MYSQL_DALITE_HOST }}' --user '{{ NEW_MYSQL_DALITE_USER }}' '--password={{ NEW_MYSQL_DALITE_PASSWORD }}' '{{ NEW_MYSQL_DALITE_DATABASE }}' < dalite.dump.sql

echo "Loaded db dump on remote mysql database"

