#!/bin/bash
PROJECT_NAME="rslang-backend"
HOST="aggregator"
BACKEND_DIR="/root/backend"

echo "Building"
npm run build

echo "Uploading"
rsync --files-from=rsync-files -r --delete . $HOST:$BACKEND_DIR || exit 2

echo "Restarting process"
ssh $HOST pm2 reload index || exit 4

echo "DONE"
