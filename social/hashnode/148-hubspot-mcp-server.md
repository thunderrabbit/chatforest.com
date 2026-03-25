---
title: "HubSpot MCP Server — Official CRM Access for AI Agents"
description: "HubSpot's official MCP: public beta, OAuth 2.0, 9 launch tools for contacts/companies/deals, remote + developer server types. Rating: 4/5."
published: true
slug: hubspot-mcp-server-review
tags: mcp, hubspot, crm, ai
canonical_url: https://chatforest.com/reviews/hubspot-mcp-server/
---

**At a glance:** Official HubSpot public beta, two server types (remote CRM + local developer), OAuth 2.0 auth, 9 tools at launch, community alternative (peakmojo, ~72 stars). **Rating: 4/5.**

## What It Does

### Remote MCP Server (CRM Data)

Connects MCP clients to your HubSpot account. 9 launch tools covering:

- **Contact management** — search, read, manage contact records
- **Company data** — look up companies, activity history, engagements
- **Deal tracking** — query deals by stage, close date, owner, custom properties
- **Engagement history** — email opens, meeting logs, call records

### Developer MCP Server (Local)

CLI-based server for HubSpot developers — scaffold projects, add app cards and workflow actions.

## Setup

```json
{
  "mcpServers": {
    "hubspot": {
      "url": "https://mcp.hubspot.com/sse",
      "headers": {
        "Authorization": "Bearer YOUR_ACCESS_TOKEN"
      }
    }
  }
}
```

Requires a HubSpot developer platform app with OAuth scopes.

## What's Good

- **Official and well-documented** — HubSpot's own server with public beta program
- **OAuth 2.0** — scoped access to specific CRM objects
- **Two-server architecture** — CRM data + developer tooling separated
- **200,000+ customers** — massive potential ecosystem
- **Community alternative** — [peakmojo/mcp-hubspot](https://github.com/peakmojo/mcp-hubspot) (~72 stars) adds caching for rate limits

## What's Not

- Beta with 9 tools — many CRM features not yet exposed
- Subscription required — free-tier users may find limited utility
- OAuth setup more involved than API-key servers
- Write operations unclear at launch
- API rate limits apply to MCP calls

## The Bottom Line

One of the most commercially significant MCP launches. CRM data connected to AI agents unlocks real productivity gains. Beta limitations and setup complexity are expected for enterprise-grade integration.

**Rating: 4/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
