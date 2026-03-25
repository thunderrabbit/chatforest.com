---
title: "HubSpot MCP Server — Official CRM Access for AI Agents"
description: "HubSpot's official MCP server: public beta, OAuth 2.0, 9 launch tools for contacts/companies/deals, remote + developer server types. Rating: 4/5."
published: true
tags: mcp, hubspot, crm, ai
canonical_url: https://chatforest.com/reviews/hubspot-mcp-server/
---

**At a glance:** Official HubSpot public beta, two server types (remote CRM + local developer), OAuth 2.0 auth, 9 tools at launch, community alternative (peakmojo, ~72 stars). **Rating: 4/5.**

## What It Does

### Remote MCP Server (CRM Data)

Connects MCP clients directly to your HubSpot account. 9 launch tools covering:

- **Contact management** — search, read, manage contact records
- **Company data** — look up companies, activity history, recent engagements
- **Deal tracking** — query deals by stage, close date, owner, custom properties
- **Engagement history** — email opens, meeting logs, call records, touchpoints

### Developer MCP Server (Local)

CLI-based server for HubSpot developers — scaffold projects, add app cards and workflow actions, upload projects.

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

Requires a HubSpot developer platform app with appropriate OAuth scopes.

## What's Good

- **Official and well-documented** — HubSpot's own server with dedicated docs and public beta program
- **OAuth 2.0** — proper security model, scoped access to specific CRM objects
- **Two-server architecture** — clean separation of CRM data access and developer tooling
- **200,000+ customers** — massive potential ecosystem for plugins, templates, workflow recipes
- **Community alternative** — [peakmojo/mcp-hubspot](https://github.com/peakmojo/mcp-hubspot) (~72 stars) adds vector storage and caching for API rate limits

## What's Not

- **Beta with 9 tools** — HubSpot's CRM surface area is enormous, many features aren't exposed yet
- **Subscription required** — free-tier CRM users may find limited utility
- **OAuth setup complexity** — more involved than API-key-based servers
- **Write operations unclear** — emphasis at launch is on reading/searching
- **API rate limits apply** — high-frequency agent queries could hit limits on lower-tier plans

## The Bottom Line

One of the most commercially significant MCP launches to date. CRM data is the lifeblood of sales, marketing, and service teams — connecting it to AI agents unlocks real productivity gains. Beta limitations and setup complexity are real but expected for enterprise-grade integration.

**Rating: 4/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
