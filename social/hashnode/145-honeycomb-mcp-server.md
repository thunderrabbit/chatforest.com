---
title: "Honeycomb MCP Server — Event-Based Observability With OAuth 2.1 and BubbleUp Analysis"
description: "Honeycomb MCP: hosted at mcp.honeycomb.io, OAuth 2.1, GA Sep 2025, Agent Skills Mar 2026, BubbleUp anomaly analysis. Rating: 4/5."
published: true
slug: honeycomb-mcp-server-review
tags: mcp, observability, honeycomb, ai
canonical_url: https://chatforest.com/reviews/honeycomb-mcp-server/
---

**At a glance:** Hosted MCP at mcp.honeycomb.io, OAuth 2.1 auth, deprecated self-hosted (41 stars), GA since Sep 2025, Agent Skills Mar 2026. **Rating: 4/5.**

## What It Does

The hosted server provides access to:

- Query traces, metrics, and logs via natural language
- **BubbleUp analysis** for investigating anomalies — Honeycomb's signature feature
- Monitor triggers and SLO status
- Create boards to record investigations
- Heatmaps and histograms for MCP queries
- List teams and environments

The deprecated self-hosted server at [honeycombio/honeycomb-mcp](https://github.com/honeycombio/honeycomb-mcp) had 14 tools. All active development is on the hosted server now.

## Setup

```json
{
  "mcpServers": {
    "honeycomb": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://mcp.honeycomb.io/mcp"]
    }
  }
}
```

OAuth 2.1 browser flow — log in, select team, grant permissions. No API keys to manage.

## What's New (March 2026)

- **Agent Skills** — automate OTel migration, onboarding, SLO/trigger creation
- **Automated Investigations** (early access) — autonomous SRE playbooks when alerts fire
- **Slackbot with Canvas** (early access) — observability in Slack
- **Non-Anthropic model support** — GPT-5 and others work via Streamable HTTP
- **Honeycomb Metrics GA** — $2/1,000 time series/month, unified events + metrics

## What's Good

- **OAuth 2.1** — most secure auth in the observability MCP category
- **All tiers including free** — works on Free (20M events/mo), Pro, and Enterprise
- **BubbleUp** — automated anomaly decomposition, no equivalent in competing servers
- **High-cardinality debugging** — query any dimension without cardinality limits
- **Agent Skills** expand from "query data" to "manage your observability stack"
- **Multi-region** — US and EU endpoints for data residency

## What's Not

- Deprecation transition still messy — hosted tool inventory not publicly documented
- 15 open issues on abandoned self-hosted repo
- Rate limits tight (50 calls/min, 10/min for service map)
- 24-hour session timeout
- Can't add queries to existing boards
- Fewer documented tools than Datadog (50+) or Grafana (40+)

## The Bottom Line

For teams doing distributed system debugging on Honeycomb, this is increasingly the obvious choice. GA hosted server with BubbleUp, heatmaps, Agent Skills, and Automated Investigations. Held back by messy deprecation transition, tight rate limits, and fewer documented tools than competitors.

**Rating: 4/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
