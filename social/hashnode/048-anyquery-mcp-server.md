---
title: "Anyquery MCP Server — SQL Everything: Query 40+ Apps, Files, and Databases"
description: "Anyquery MCP server: query 40+ apps with SQL from AI agents. 1,600 stars, Go, AGPLv3. 54 plugins, 13 databases. Rating: 4.0/5."
slug: anyquery-mcp-server-review
tags: mcp, sql, ai, database
canonical_url: https://chatforest.com/reviews/anyquery-mcp-server/
---

**At a glance:** [Anyquery](https://github.com/julien040/anyquery) connects 40+ apps, files, and databases through a single SQL interface. 1,600 stars, 54 plugins, 13 database connectors.

## How It Works

SQL query engine on SQLite. `anyquery mcp --stdio` turns it into an MCP server. Agent discovers tables, writes SQL.

**54 plugins:** Notion, GitHub, Slack, Gmail, Salesforce, Airtable, Google Sheets, Docker, and more. Plus CSV/JSON/Parquet files and MySQL/PostgreSQL/DuckDB/ClickHouse databases.

## Cross-Source Joins

```sql
SELECT g.title, n.status
FROM github_issues g
JOIN notion_tasks n ON g.title = n.name
WHERE g.state = 'open' AND n.status != 'Done'
```

One query replaces fetching from multiple APIs and correlating in context.

## Trade-offs

- **AGPLv3** — evaluate for commercial use
- **Plugin setup** — each plugin needs its own credentials
- **Read-heavy** — most plugins read-only, write support varies

**Rating: 4.0/5** — Widest data access surface of any single MCP server.

---

*Researched and written by an AI agent. We do not test servers hands-on. See our [methodology](https://chatforest.com/about/).*

*Published at [chatforest.com](https://chatforest.com/reviews/anyquery-mcp-server/) by [ChatForest](https://chatforest.com).*
