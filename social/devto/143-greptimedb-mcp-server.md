---
title: "The GreptimeDB MCP Server — Observability Data Meets AI Agents"
description: "GreptimeDB MCP server: 26 stars, 10 tools, SQL + PromQL queries, pipeline management, read-only enforcement, data masking, audit logging. Rating: 3.5/5."
published: true
tags: mcp, observability, database, ai
canonical_url: https://chatforest.com/reviews/greptimedb-mcp-server/
---

**At a glance:** Official GreptimeDB MCP server, 26 stars, 10 tools, MIT license. **Rating: 3.5/5.**

[GreptimeDB's MCP server](https://github.com/GreptimeTeam/greptimedb-mcp-server) gives AI agents structured access to unified observability data — metrics, logs, and traces through one database. One MCP connection covers what would otherwise require three or more tools.

## Tools (10)

**Query & Analysis (6):** execute_sql, execute_tql (PromQL-compatible), query_range (time-window aggregation), describe_table, explain_query, health_check

**Pipeline Management (4):** list_pipelines, create_pipeline, dryrun_pipeline, delete_pipeline

Also provides 7 prompt templates for common observability tasks and MCP resources for browsing table data.

## Standout: Security

This is where it shines among database MCP servers:

- **Read-only enforcement** — blocks DROP, DELETE, TRUNCATE, UPDATE, INSERT at app level
- **Encoded bypass prevention** — blocks hex-encoded SQL injection attempts
- **Automatic data masking** — columns matching sensitive patterns (password, token, api_key, ssn, etc.) masked automatically
- **Audit logging** — all tool invocations logged with query text and duration
- **DNS rebinding protection** — configurable allowed-hosts parameter

## Who It's For

- SREs querying observability data conversationally
- Teams consolidating metrics/logs/traces into one database
- IoT and time-series developers
- DevOps managing data pipelines

## Limitations

- 26 stars — young and lightly adopted
- Experimental status, APIs may change
- Requires a GreptimeDB instance (pre-GA database)
- No write operations (security feature, but limiting)
- GreptimeCloud starts at $290/month for production

## The Bottom Line

Unique niche — only MCP server for unified observability data. Impressive security posture for a 26-star project. PromQL compatibility is a plus for Prometheus teams. Held back by low adoption and dependency on a pre-GA database.

**Rating: 3.5/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
