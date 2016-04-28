#!/usr/bin/env bash

set -e

source openstackrc.sh

cd local_s3

swift upload {{ DALITE_MEDIA_CONTAINER }} .

echo "Swift upload done"