#!/usr/bin/env bash

set -e

echo "Dumping MySQL"

./dump-data.sh

echo "Restoring mysql"

./restore-to-new-dalite.sh

echo "Dumping s3"

./dump-s3.sh

echo "Restoring S3"

./restore-data-swift.sh

echo "Downloading logs"

./download-logs.sh

echo "Uploading logs"

./upload-logs.sh

echo "SUCCESS"
