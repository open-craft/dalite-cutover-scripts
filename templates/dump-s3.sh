#!/usr/bin/env bash

set -e

aws s3 sync s3://{{OLD_DALITE_AWS_STORAGE_BUCKET_NAME}}/ local_s3/  --region us-west-2

echo "S3 container dumped"