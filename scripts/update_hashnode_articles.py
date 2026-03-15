#!/usr/bin/env python3
"""Update published Hashnode articles with current local content (including LLM byline)."""

import json
import urllib.request
import urllib.error
import sys
import re
import os

API_TOKEN_FILE = "/home/grove/.config/chatforest/hashnode_api_token"

# Published articles: (filename, hashnode post ID)
ARTICLES = [
    ("social/hashnode/001-filesystem-mcp-server.md", "69b58e4f80a726335c668c17"),
    ("social/hashnode/002-github-mcp-server.md", "69b58e5f4b280b2e32915cc3"),
    ("social/hashnode/003-brave-search-mcp-server.md", "69b58f6e81fe768df85b317a"),
    ("social/hashnode/004-slack-mcp-server.md", "69b58f7381fe768df85b317c"),
]

BASE_DIR = "/home/grove/chatforest.com"


def parse_frontmatter(content):
    """Extract frontmatter and body from markdown."""
    m = re.match(r'^---\n(.*?)\n---\n(.*)', content, re.DOTALL)
    if not m:
        return {}, content
    fm_text = m.group(1)
    body = m.group(2).strip()
    fm = {}
    for line in fm_text.split('\n'):
        kv = re.match(r'^(\w+):\s*["\']?(.*?)["\']?\s*$', line)
        if kv:
            fm[kv.group(1)] = kv.group(2)
    return fm, body


def main():
    api_token = open(API_TOKEN_FILE).read().strip()

    query = """mutation UpdatePost($input: UpdatePostInput!) {
      updatePost(input: $input) {
        post { id slug title url }
      }
    }"""

    for filename, post_id in ARTICLES:
        filepath = os.path.join(BASE_DIR, filename)
        content = open(filepath).read()
        fm, body = parse_frontmatter(content)

        variables = {
            "input": {
                "id": post_id,
                "contentMarkdown": body,
                "title": fm.get("title", ""),
            }
        }

        payload = json.dumps({"query": query, "variables": variables}).encode()
        req = urllib.request.Request(
            "https://gql.hashnode.com",
            data=payload,
            headers={
                "Authorization": api_token,
                "Content-Type": "application/json",
            },
        )

        try:
            resp = urllib.request.urlopen(req)
            data = json.loads(resp.read())
            if "errors" in data:
                print(f"ERR {filename} -> {json.dumps(data['errors'])}", file=sys.stderr)
                sys.exit(1)
            post = data["data"]["updatePost"]["post"]
            print(f"OK  {filename} -> {post['id']} | {post.get('url', 'no url')}")
        except urllib.error.HTTPError as e:
            body_err = e.read().decode()[:500]
            print(f"ERR {filename} -> {e.code}: {body_err}", file=sys.stderr)
            sys.exit(1)

    print(f"\nAll {len(ARTICLES)} Hashnode articles updated.")


if __name__ == "__main__":
    main()
