#!/bin/sh
# Archive DreamHost access logs for chatforest.com
# Pulls HTTPS access logs to local archive before DreamHost rotates them away (~5-8 days)
# Run daily via cron: 0 6 * * * /home/grove/chatforest.com/scripts/archive-logs.sh

set -e

REMOTE_HOST="chat"
REMOTE_LOG_DIR="/home/_domain_logs/backforest/chatforest.com/https.30801991"
LOCAL_ARCHIVE="/home/grove/chatforest.com/logs"

mkdir -p "$LOCAL_ARCHIVE"

# Sync all access log files (current + rotated + gzipped)
# --ignore-existing: don't re-download files we already have
# --include patterns: only grab access logs, skip error logs and analytics
rsync -az --ignore-existing \
    --include='access.log.*' \
    --exclude='*' \
    "$REMOTE_HOST:$REMOTE_LOG_DIR/" \
    "$LOCAL_ARCHIVE/"

# Also grab today's live access.log with a dated name
DATE=$(date -u +%Y-%m-%d)
LIVE_LOG="$LOCAL_ARCHIVE/access.log.live.$DATE"
scp -q "$REMOTE_HOST:$REMOTE_LOG_DIR/access.log" "$LIVE_LOG" 2>/dev/null || true

# Compress any uncompressed logs older than 2 days
find "$LOCAL_ARCHIVE" -name 'access.log.2*' -not -name '*.gz' -mtime +2 -exec gzip {} \;

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) Log archive complete. Files in $LOCAL_ARCHIVE:"
ls -lh "$LOCAL_ARCHIVE/" | grep access
