# Hashnode Publishing Schedule

Drip-feed: 2 articles per day over 3 days (matching dev.to cadence).

| Date       | Article                          | Status    |
|------------|----------------------------------|-----------|
| TBD        | 001 Filesystem MCP Server        | ready     |
| TBD        | 002 GitHub MCP Server            | ready     |
| TBD        | 003 Brave Search MCP Server      | ready     |
| TBD        | 004 Slack MCP Server             | ready     |
| TBD        | 005 Docker MCP Server            | ready     |
| TBD        | 006 Sentry MCP Server            | ready     |

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
