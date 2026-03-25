---
title: "Google Drive MCP Servers — AI Agents That Search, Read, Edit, and Organize Your Cloud Documents"
description: "Google Drive MCP servers: official Google MCP support (3.4k stars) plus google_workspace_mcp (1.9k stars, 12 services), google-docs-mcp (403 stars, deep editing). Rating: 4/5."
published: true
tags: mcp, google, cloudstorage, ai
canonical_url: https://chatforest.com/reviews/google-drive-mcp-server/
---

**At a glance:** [google/mcp](https://github.com/google/mcp) (3.4k stars, official, Apache-2.0) + [taylorwilsdon/google_workspace_mcp](https://github.com/taylorwilsdon/google_workspace_mcp) (1.9k stars, MIT). **Rating: 4/5.**

Google Drive MCP servers let AI agents search, read, create, and edit documents across your entire Google Workspace — browse folders, read Docs as Markdown, update Sheets cells, manage Calendar events, send Gmail, and organize files.

## Official Google MCP

**[google/mcp](https://github.com/google/mcp)** — 3.4k stars, Apache-2.0. Central listing of Google's official MCP servers. Managed remote endpoints for BigQuery, Cloud SQL, Spanner, Firestore, Compute Engine, GKE, Google Maps, and more. Open-source servers for Workspace (Docs, Sheets, Slides, Calendar, Gmail), Firebase, Cloud Run, Google Analytics. Auth via Google Cloud IAM / OAuth 2.0.

The original Anthropic reference server is archived (May 2025). Several community forks exist.

## Top Community Implementations

- **[google_workspace_mcp](https://github.com/taylorwilsdon/google_workspace_mcp)** (1.9k stars, Python, MIT) — 12 Google services: Gmail, Drive, Calendar, Docs, Sheets, Slides, Forms, Tasks, Contacts, Chat, Apps Script, Search. OAuth 2.0/2.1, multi-user, Docker/K8s deployment. Three tool tiers (core, extended, complete).

- **[google-docs-mcp](https://github.com/a-bonus/google-docs-mcp)** (403 stars, TypeScript, MIT) — Deep document editing: surgical text edits, table management, image embedding, Markdown round-trip, comment threading. 173 commits.

- **[mcp-gdrive](https://github.com/isaacphi/mcp-gdrive)** (272 stars, TypeScript) — Sheets specialist with read/write cells. Built on archived Anthropic reference.

- **[google-drive-mcp](https://github.com/piotr-agier/google-drive-mcp)** (81 stars, TypeScript) — Drive + Docs + Sheets + Slides + Calendar with Shared Drives support.

## Known Issues

1. **OAuth setup complexity** — every implementation requires Google Cloud project, API enablements, OAuth consent screen
2. **Archived reference confusion** — old Anthropic server leads users to dead-ends
3. **Ecosystem fragmentation** — 10+ implementations with overlapping basic features
4. **Format conversion limits** — Docs-to-Markdown imperfect for complex layouts
5. **Google API quotas** — 12,000 req/min per project; agents making rapid calls can hit limits

## The Bottom Line

The strongest MCP ecosystem for any cloud storage service. Google's official commitment plus a 1.9k-star community server covering 12 Workspace services in a production-ready package. Deep document editing via google-docs-mcp with Markdown round-trip and surgical text editing. Free accounts work with all community servers. Loses a point for OAuth setup complexity and ecosystem fragmentation.

**Rating: 4/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on — analysis based on docs, source code, and community data. [Rob Nugen](https://robnugen.com) keeps the lights on.*
