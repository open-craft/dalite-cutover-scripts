#!/usr/bin/env bash

set -e

mkdir -p logs-download

mkdir -p logs-download/db
mkdir -p logs-download/logs
mkdir -p logs-download/old-logs

rsync -ra "{{ OLD_DALITE_HOST }}":/home/logs-download/db logs-download

echo "downloaded db dumps"

rsync -ra ubuntu@dalite.harvardx.harvard.edu:/home/logs-download/logs logs-download

echo "downloaded old logs"

rsync -ra "{{ OLD_DALITE_HOST }}":/home/logs-download/old-logs logs-download

echo "downloaded logs"
echo "downloaded all"