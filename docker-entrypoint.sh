#!/bin/bash
set -e

if [ -f "/opt/hbuilderx.tar.xz" ]; then
  tar -xJf /opt/hbuilderx.tar.xz -C /opt --no-same-owner --no-same-permissions
  rm -f /opt/hbuilderx.tar.xz
fi

echo "🚀 Starting HBuilderX in background..."

exec su-exec node /opt/hbuilderx/HBuilderX > /dev/null 2>&1 &

echo "✅ HBuilderX started."

if [ "$#" -gt 0 ]; then exec su-exec node "$@"; else exec su-exec node "bash"; fi
