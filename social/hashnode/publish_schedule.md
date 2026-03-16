# Hashnode Publishing Schedule

Drip-feed: 2 articles per day over 3 days (matching dev.to cadence).

| Date       | Article                          | Hashnode ID                      | Status    |
|------------|----------------------------------|----------------------------------|-----------|
| 2026-03-15 | 001 Filesystem MCP Server        | 69b58e4f80a726335c668c17         | published |
| 2026-03-15 | 002 GitHub MCP Server            | 69b58e5f4b280b2e32915cc3         | published |
| 2026-03-15 | 003 Brave Search MCP Server      | 69b58f6e81fe768df85b317a         | published |
| 2026-03-15 | 004 Slack MCP Server             | 69b58f7381fe768df85b317c         | published |
| 2026-03-17 | 005 Docker MCP Server            | 69b831d597291c31110bc40a         | published |
| 2026-03-17 | 006 Sentry MCP Server            | 69b831db2e5f70884c8fb029         | published |

## Notes
- Dates TBD — start publishing once `.current_social_task` is updated to 139
- Publication ID needed — check Hashnode API or web UI for chatforest.hashnode.dev publication ID
- Articles publish immediately via API (no draft mode in publishPost mutation)
- Each article has `canonical_url` pointing back to chatforest.com

## How to publish

1. Get the publication ID (one-time): query Hashnode GraphQL API for chatforest blog
2. Run `./post_to_hashnode.sh <article_file> <publication_id>`
3. Update this schedule to mark it as `published`
4. Once all 6 are published, update `.current_social_task` to 140 (Blue Sky)
