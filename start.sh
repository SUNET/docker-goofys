#!/bin/sh

mkdir ~/.aws /tmp/cache
cat<<EOF>~/.aws/credentials
[default]
aws_access_key_id = $S3_ACCESS_KEY_ID
aws_secret_access_key = $S3_SECRET_ACCESS_KEY
EOF

exec goofys -f -o allow_other --cache /tmp/cache --endpoint $S3_URL $S3_BUCKET $MOUNTPOINT
