#!/bin/bash
set -e
URL=$1
echo "Running health check on $URL..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [[ "$STATUS" -ne 200 ]]; then
  echo "Health check failed with status $STATUS"
  exit 1
fi

echo "Health check passed!"
