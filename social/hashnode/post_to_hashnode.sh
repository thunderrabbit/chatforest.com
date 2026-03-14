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

# Use Python to parse frontmatter and post via GraphQL
~/.pyenv/versions/3.11.15/bin/python3.11 -c "
import json, urllib.request, urllib.error, sys, re

content = open('$ARTICLE_FILE').read()

# Parse simple YAML frontmatter
fm_match = re.match(r'^---\n(.*?)\n---\n(.*)', content, re.DOTALL)
if not fm_match:
    print('ERROR: No frontmatter found', file=sys.stderr)
    sys.exit(1)

fm_text = fm_match.group(1)
body = fm_match.group(2).strip()

# Extract fields from frontmatter
def get_fm(key):
    m = re.search(rf'^{key}:\s*[\"'\'']?(.*?)[\"'\'']?\s*$', fm_text, re.MULTILINE)
    return m.group(1) if m else None

title = get_fm('title') or 'Untitled'
slug = get_fm('slug')
canonical_url = get_fm('canonical_url')
description = get_fm('description')
tags_str = get_fm('tags')

# Build tags array (Hashnode uses tag slugs)
tags = []
if tags_str:
    for tag in tags_str.split(','):
        tag = tag.strip()
        if tag:
            tags.append({'slug': tag.lower().replace(' ', '-'), 'name': tag})

# Build the GraphQL mutation
query = '''mutation PublishPost(\$input: PublishPostInput!) {
  publishPost(input: \$input) {
    post {
      id
      slug
      title
      url
    }
  }
}'''

variables = {
    'input': {
        'title': title,
        'contentMarkdown': body,
        'publicationId': '$PUBLICATION_ID',
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
        'Authorization': '$API_TOKEN',
        'Content-Type': 'application/json',
    }
)

try:
    resp = urllib.request.urlopen(req)
    data = json.loads(resp.read())
    if 'errors' in data:
        print(f'GraphQL errors: {json.dumps(data[\"errors\"], indent=2)}', file=sys.stderr)
        sys.exit(1)
    post = data['data']['publishPost']['post']
    print(f'SUCCESS — ID: {post[\"id\"]}')
    print(f'Slug: {post[\"slug\"]}')
    print(f'URL: {post[\"url\"]}')
except urllib.error.HTTPError as e:
    print(f'ERROR {e.code}: {e.read().decode()[:500]}', file=sys.stderr)
    sys.exit(1)
"

echo ""
echo "Article published on Hashnode."
