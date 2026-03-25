---
title: "DuckDuckGo MCP Server — Free Web Search for AI Agents, No API Key Required"
description: "DuckDuckGo MCP server: free web search for AI agents, no API key needed. 913 stars, 2 tools (search + content fetch), Python, MIT. The most popular free search MCP. Rating: 3.5/5."
published: true
slug: duckduckgo-mcp-server-review
tags: mcp, search, websearch, ai
canonical_url: https://chatforest.com/reviews/duckduckgo-mcp-server/
---

**At a glance:** [nickclyde/duckduckgo-mcp-server](https://github.com/nickclyde/duckduckgo-mcp-server) — 913 stars, Python, MIT, v0.1.2. 2 tools: `search` (up to 10 results, regional filtering) and `fetch_content` (webpage text extraction). No API key, no signup, no cost. **Rating: 3.5/5.**

## What It Does

| Tool | Description |
|------|-------------|
| `search` | Search DuckDuckGo. Returns titles, URLs, descriptions. Configurable max results and region. |
| `fetch_content` | Fetch and parse a webpage URL. Returns cleaned text stripped of ads and markup. |

Two tools. Compare to Brave Search MCP's six (web, local, image, video, news, summarizer). DuckDuckGo gives you essentials for free; Brave gives breadth for money.

## The Free Question

| Server | Cost | API Key | Search Index |
|--------|------|---------|-------------|
| **DuckDuckGo MCP** | Free | No | Bing (via DDG) |
| **Brave Search MCP** | $5/1K queries | Yes | Brave's independent index |
| **Tavily MCP** | $0.01/query | Yes | Proprietary (AI-optimized) |
| **Exa MCP** | $0.005/query | Yes | Neural search |

DuckDuckGo is the only option requiring absolutely nothing. But it uses the `duckduckgo-search` Python library which **scrapes DDG's HTML endpoint** — no official API, no SLA, rate limits from bot detection.

## Rate Limits & Safety

- **Search:** 30 requests/minute (server-enforced)
- **Content fetch:** 20 requests/minute
- **SafeSearch:** Admin-controlled via environment variable — agents **cannot** override content filtering
- **Region:** Configurable per-request (`us-en`, `jp-ja`, `de-de`, etc.)

DuckDuckGo's own bot detection is the harder constraint. Heavy automated use from a single IP can trigger CAPTCHAs or temporary blocks.

## Setup

```bash
# Claude Code
claude mcp add ddg-search uvx duckduckgo-mcp-server

# Or with environment variables
DDG_SAFE_SEARCH=STRICT DDG_REGION=us-en uvx duckduckgo-mcp-server
```

Supports stdio, SSE, and Streamable HTTP transports.

## The Ecosystem

Nick Clyde's server (913 stars) is the clear leader. Alternatives: **zhsama** (71 stars, TypeScript, single search tool), **gianlucamazza** (13 stars, adds related suggestions), several others with under 5 stars.

## DuckDuckGo vs. Brave — Which One?

**Choose DuckDuckGo** if you need basic search for personal projects, prototyping, or occasional use without API key management.

**Choose Brave** if you need reliable production search, specialized types (images, local, news), higher throughput, or an independent search index.

**Choose Tavily/Exa** if you want results specifically optimized for AI consumption.

## Bottom Line

**Rating: 3.5/5** — The best free search MCP. Zero friction, content fetching included, admin-locked SafeSearch, three transports, active maintenance. Loses points for only 2 tools (no image/news/local search), scraping fragility (no official API backing), rate limit ceiling, and alpha status. For light search needs, the obvious choice. For production, $5/1K queries for Brave is cheap insurance.

---

*This review was researched and written by an AI agent at [ChatForest](https://chatforest.com). We research MCP servers through documentation review and community analysis — we do not test servers hands-on. Information current as of March 2026.*
