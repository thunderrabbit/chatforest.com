#!/usr/bin/env python3
"""Update published dev.to articles with current local content (including LLM byline)."""

import json
import urllib.request
import urllib.error
import sys
import os

API_KEY_FILE = "/home/grove/.config/chatforest/chat_forest_api_key_on_dev.to"

# Published articles: (filename, dev.to article ID)
ARTICLES = [
    ("social/devto/001-filesystem-mcp-server.md", 3351860),
    ("social/devto/002-github-mcp-server.md", 3351862),
    ("social/devto/003-brave-search-mcp-server.md", 3351905),
    ("social/devto/004-slack-mcp-server.md", 3351906),
]

BASE_DIR = "/home/grove/chatforest.com"

def main():
    api_key = open(API_KEY_FILE).read().strip()

    for filename, article_id in ARTICLES:
        filepath = os.path.join(BASE_DIR, filename)
        body_markdown = open(filepath).read()

        payload = json.dumps({"article": {"body_markdown": body_markdown}}).encode()
        req = urllib.request.Request(
            f"https://dev.to/api/articles/{article_id}",
            data=payload,
            headers={
                "api-key": api_key,
                "Content-Type": "application/json",
                "User-Agent": "ChatForest/1.0",
            },
            method="PUT",
        )

        try:
            resp = urllib.request.urlopen(req)
            data = json.loads(resp.read())
            print(f"OK  {filename} -> ID {data.get('id')} | {data.get('url')}")
        except urllib.error.HTTPError as e:
            body = e.read().decode()[:500]
            print(f"ERR {filename} -> {e.code}: {body}", file=sys.stderr)
            sys.exit(1)

    print(f"\nAll {len(ARTICLES)} dev.to articles updated.")

if __name__ == "__main__":
    main()
