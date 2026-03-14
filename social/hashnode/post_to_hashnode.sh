#!/bin/bash
# Post an article to Hashnode using their GraphQL API
# Usage: ./post_to_hashnode.sh <markdown_file> <publication_id>
#
# The markdown file should have a simple frontmatter with title, description, slug, tags, canonical_url
# Articles are published immediately (Hashnode has no draft-via-API option for publishPost)

set -euo pipefail

API_TOKEN_FILE="/home/grove/.config/chatforest/hashnode_api_token"

if [ ! -f "$API_TOKEN_FILE" ]; then
    echo "ERROR: API token file not found at $API_TOKEN_FILE"
    exit 1
fi

API_TOKEN=$(cat "$API_TOKEN_FILE")
ARTICLE_FILE="${1:?Usage: $0 <markdown_file> <publication_id>}"
PUBLICATION_ID="${2:?Usage: $0 <markdown_file> <publication_id>}"

if [ ! -f "$ARTICLE_FILE" ]; then
    echo "ERROR: Article file not found: $ARTICLE_FILE"
    exit 1
fi

# Export vars so Python can read them from environment
export HASHNODE_API_TOKEN="$API_TOKEN"
export HASHNODE_PUBLICATION_ID="$PUBLICATION_ID"
export HASHNODE_ARTICLE_FILE="$ARTICLE_FILE"

~/.pyenv/versions/3.11.15/bin/python3.11 << 'PYEOF'
import json, urllib.request, urllib.error, sys, re, os

api_token = os.environ["HASHNODE_API_TOKEN"]
publication_id = os.environ["HASHNODE_PUBLICATION_ID"]
article_file = os.environ["HASHNODE_ARTICLE_FILE"]

content = open(article_file).read()

fm_match = re.match(r'^---\n(.*?)\n---\n(.*)', content, re.DOTALL)
if not fm_match:
    print('ERROR: No frontmatter found', file=sys.stderr)
    sys.exit(1)

fm_text = fm_match.group(1)
body = fm_match.group(2).strip()

def get_fm(key):
    m = re.search(rf'^{key}:\s*["\']?(.*?)["\']?\s*$', fm_text, re.MULTILINE)
    return m.group(1) if m else None

title = get_fm('title') or 'Untitled'
slug = get_fm('slug')
canonical_url = get_fm('canonical_url')
tags_str = get_fm('tags')

tags = []
if tags_str:
    for tag in tags_str.split(','):
        tag = tag.strip()
        if tag:
            tags.append({'slug': tag.lower().replace(' ', '-'), 'name': tag})

query = '''mutation PublishPost($input: PublishPostInput!) {
  publishPost(input: $input) {
    post { id slug title url }
  }
}'''

variables = {
    'input': {
        'title': title,
        'contentMarkdown': body,
        'publicationId': publication_id,
    }
}

if slug:
    variables['input']['slug'] = slug
if canonical_url:
    variables['input']['originalArticleURL'] = canonical_url
if tags:
    variables['input']['tags'] = tags

payload = json.dumps({'query': query, 'variables': variables}).encode()
req = urllib.request.Request(
    'https://gql.hashnode.com',
    data=payload,
    headers={
        'Authorization': api_token,
        'Content-Type': 'application/json',
    }
)

try:
    resp = urllib.request.urlopen(req)
    data = json.loads(resp.read())
    if 'errors' in data:
        print(f'GraphQL errors: {json.dumps(data["errors"], indent=2)}', file=sys.stderr)
        sys.exit(1)
    post = data['data']['publishPost']['post']
    print(f'SUCCESS — ID: {post["id"]}')
    print(f'Slug: {post["slug"]}')
    print(f'URL: {post["url"]}')
except urllib.error.HTTPError as e:
    print(f'ERROR {e.code}: {e.read().decode()[:500]}', file=sys.stderr)
    sys.exit(1)
PYEOF

echo ""
echo "Article published on Hashnode."
