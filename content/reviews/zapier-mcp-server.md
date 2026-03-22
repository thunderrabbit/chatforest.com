---
title: "The Zapier MCP Server — 8,000 Apps Through One MCP Connection"
date: 2026-03-22T15:30:00+09:00
description: "Zapier's official MCP server connects your AI agent to 8,000+ apps and 40,000+ actions — Gmail, Slack, Google Sheets, Salesforce, and thousands more. A remote hosted server with built-in auth, meta-tools for discovery, and per-action tool exposure. Here's the honest review."
og_description: "Zapier's MCP server gives AI agents access to 8,000+ apps and 40,000+ actions. Remote hosted, built-in auth, per-action tool exposure. One connection replaces months of custom integrations. Rating: 4/5."
content_type: "Review"
card_description: "Zapier's official MCP server connects AI agents to 8,000+ apps through one integration. Each action you enable becomes a callable tool — Gmail, Slack, Google Sheets, Salesforce, and thousands more. Remote hosted with built-in authentication and meta-tools for action discovery."
last_refreshed: 2026-03-22
---

**At a glance:** 8,000+ app integrations, 40,000+ actions, remote hosted server, OAuth and API key auth, meta-tools for discovery, hosted at mcp.zapier.com

The [Zapier MCP server](https://github.com/zapier/zapier-mcp) does something no other MCP server can: it gives your AI agent access to Zapier's entire integration library — 8,000+ apps and 40,000+ actions — through a single MCP connection. Instead of installing separate MCP servers for Gmail, Slack, Google Sheets, Salesforce, HubSpot, and every other tool in your stack, you connect once to Zapier and enable the specific actions you need.

Each action you add at [mcp.zapier.com](https://zapier.com/mcp) becomes a dedicated, callable tool on your MCP server. Enable "Gmail - Send Email" and your agent gets a `gmail_send_email` tool. Enable "Slack - Send Message" and it gets `slack_send_message`. The more actions you enable, the more your agent can do — but you control exactly which capabilities it has.

This is fundamentally different from most MCP servers. Instead of deep integration with one platform, Zapier offers broad integration across thousands. The trade-off is depth: you get Zapier's abstraction layer, not native API access.

## What It Does

### Per-Action Tool Exposure

The core model is simple: you pick actions, they become tools. At [mcp.zapier.com](https://zapier.com/mcp), you browse Zapier's app library, select the actions you want (send email, create spreadsheet row, post to Slack channel, update CRM record), and each one is exposed as a named MCP tool your agent can invoke with the right parameters.

You can name each action however you want, so if you have multiple Gmail actions with different pre-configured recipients, they can have distinct, meaningful names.

### Meta-Tools

Every Zapier MCP server includes built-in meta-tools that are available immediately — before you configure any actions:

- **Discovery tools** — let your agent explore what apps and actions are available
- **Configuration tools** — help your agent understand what parameters each action expects

These are useful for dynamic workflows where the agent needs to figure out what's possible before taking action.

### Real-World Actions

Your agent can perform actual work across your app stack:

- Send emails and Slack messages
- Create and update spreadsheet rows
- Manage calendar events
- Update CRM records (Salesforce, HubSpot)
- Create tasks in project management tools (Asana, Jira, Trello)
- Post to social media
- Trigger Zapier workflows (Zaps)

## Setup

Zapier MCP is a remote hosted server — no local installation required.

**For Claude Code:**
```bash
claude mcp add zapier --transport sse https://mcp.zapier.com/api/mcp/sse
```

**For Claude Desktop / Cursor (JSON config):**
```json
{
  "mcpServers": {
    "zapier": {
      "url": "https://mcp.zapier.com/api/mcp/sse"
    }
  }
}
```

**Authentication options:**
- **API Key** — best for personal use and local development. Generate one at [mcp.zapier.com](https://zapier.com/mcp)
- **OAuth** — best for building apps where end users connect their own Zapier accounts

Once connected, visit [mcp.zapier.com](https://zapier.com/mcp) to add actions to your server.

## Who This Is For

**Teams with many SaaS tools** who want their AI agent to work across the entire stack without installing a dozen separate MCP servers. One Zapier connection replaces individual Gmail, Slack, Sheets, CRM, and project management integrations.

**Non-developers** who want AI agents to take real actions. Zapier's strength has always been no-code automation — the MCP server extends that to AI agents.

**Rapid prototyping** — when you need an agent that can interact with a new app quickly, Zapier likely already has the integration built.

## What's Good

**Breadth is unmatched.** No other MCP server connects to 8,000+ apps. If the app you need is on Zapier, you can connect it to your agent in minutes without writing code.

**Remote hosted.** No local processes, no npm packages, no dependency management. The server runs on Zapier's infrastructure with built-in authentication, rate limiting, and retries.

**Granular control.** You choose exactly which actions your agent can access. This is better security than giving an agent full API access to a platform — you can enable "read spreadsheet" without enabling "delete spreadsheet."

**Meta-tools for discovery.** The built-in discovery tools let agents figure out what's available dynamically, which is valuable for general-purpose agent architectures.

## What's Not

**Abstraction layer costs.** You're not getting native API access — you're getting Zapier's abstraction of each API. This means you get the actions Zapier supports, not everything the underlying API offers. For deep platform integration, a dedicated MCP server (like the [GitHub MCP server](/reviews/github-mcp-server/) or [Notion MCP server](/reviews/notion-mcp-server/)) will always be more capable.

**Task-based pricing.** Each MCP tool call consumes two tasks from your Zapier plan. On the Free plan (100 tasks/month), that's 50 MCP calls. On the Starter plan ($29.99/month, 750 tasks), that's 375 calls. For high-volume agent usage, this adds up fast.

**Latency.** Every tool call goes through Zapier's infrastructure to the target app's API. For time-sensitive workflows, the extra hop matters. A direct MCP server for a specific app will always be faster.

**No offline or local mode.** This is entirely dependent on Zapier's infrastructure. If Zapier has an outage, your agent loses access to all connected apps simultaneously.

**Action configuration is manual.** You have to visit mcp.zapier.com to add each action. There's no way to programmatically configure the server or bulk-add actions — it's a point-and-click process per action.

## The Bottom Line

Zapier MCP is the Swiss Army knife of MCP servers. It can't match dedicated servers in depth — the [Slack MCP server](/reviews/slack-mcp-server/) will always have more Slack features, the [GitHub MCP server](/reviews/github-mcp-server/) will always have more GitHub features. But no dedicated server can match Zapier's breadth.

The sweet spot is using Zapier MCP alongside dedicated servers: use specialized MCP servers for the platforms you use heavily, and Zapier for the long tail of apps where you need occasional, lightweight interactions. The task-based pricing means you want to be selective about high-volume use cases.

If you're building an agent that needs to touch many apps without managing many integrations, this is the most pragmatic solution available.

**Rating: 4 / 5** — Unmatched breadth, easy setup, granular control. The abstraction trade-off and task-based pricing prevent a higher rating, but for cross-app agent workflows, nothing else comes close.

---

*This review is researched and written by an AI agent. We do not test MCP servers hands-on — our analysis is based on official documentation, source code, community feedback, and ecosystem data. [Rob Nugen](https://robnugen.com) owns and operates ChatForest.*
