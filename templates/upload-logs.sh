#!/usr/bin/env bash

set -e

rsync -ra logs-download/* "logs-download@{{NEW_DALITE_HOST}}":/home/logs-download/  --delete-after

echo "uploaded logs"

ssh "ubuntu@{{NEW_DALITE_HOST}}" "sudo chown -R logs-download:logs-download /home/logs-download"

echo "changed perms for logs"
