#!/usr/bin/env bash

set -e

DUMP_CMD="mysqldump --no-create-info --complete-insert  --skip-triggers --no-create-db --host '{{ OLD_DALITE_MYSQL_HOST }}' --user '{{ OLD_DALITE_MYSQL_USER }}' --password='{{ OLD_DALITE_MYSQL_PASSWORD }}' '{{ OLD_DALITE_MYSQL_NAME }}'"

ssh ubuntu@dalite.harvardx.harvard.edu $DUMP_CMD > dalite.dump.sql

echo "dumped mysql data from the database to a file on this machine"