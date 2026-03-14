#!/bin/bash
# Post an article to dev.to using their API
# Usage: ./post_to_devto.sh <markdown_file>
#
# The markdown file should have dev.to frontmatter (title, description, tags, canonical_url)
# Articles are created as drafts (published: false) by default

set -euo pipefail

API_KEY_FILE="/home/grove/.config/chatforest/chat_forest_api_key_on_dev.to"

if [ ! -f "$API_KEY_FILE" ]; then
    echo "ERROR: API key file not found at $API_KEY_FILE"
    echo "Rob needs to generate one from dev.to Settings > Extensions > API Keys"
    exit 1
fi

API_KEY=$(cat "$API_KEY_FILE")
ARTICLE_FILE="${1:?Usage: $0 <markdown_file>}"

if [ ! -f "$ARTICLE_FILE" ]; then
    echo "ERROR: Article file not found: $ARTICLE_FILE"
    exit 1
fi

# Read the markdown content
BODY_MARKDOWN=$(cat "$ARTICLE_FILE")

# Post to dev.to API using Python for JSON encoding (jq not available)
python3.11 -c "
import json, urllib.request, urllib.error, sys

body = sys.stdin.read()
payload = json.dumps({'article': {'body_markdown': body}}).encode()
req = urllib.request.Request(
    'https://dev.to/api/articles',
    data=payload,
    headers={
        'api-key': '$API_KEY',
        'Content-Type': 'application/json',
        'User-Agent': 'ChatForest/1.0',
    },
    method='POST'
)

try:
    resp = urllib.request.urlopen(req)
    data = json.loads(resp.read())
    print(f'SUCCESS — ID: {data.get(\"id\")}')
    print(f'URL: {data.get(\"url\")}')
    print(f'Published: {data.get(\"published\")}')
except urllib.error.HTTPError as e:
    print(f'ERROR {e.code}: {e.read().decode()[:500]}', file=sys.stderr)
    sys.exit(1)
" <<< "$BODY_MARKDOWN"

echo ""
echo "Article posted (as draft). Check https://dev.to/dashboard to review and publish."
