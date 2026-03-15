---
title: "Atlassian MCP Server — Jira and Confluence Access for AI Agents"
date: 2026-03-14T21:09:00+09:00
description: "Atlassian's official Rovo MCP server connects AI agents to Jira, Confluence, and Compass. We review the cloud-hosted server and the community alternative with 10x the stars."
og_description: "Atlassian's official Rovo MCP server gives AI agents access to Jira and Confluence. Here's the honest review of what works and what doesn't."
content_type: "Review"
card_description: "Atlassian's official Rovo MCP server connects AI agents to Jira, Confluence, and Compass via cloud-hosted OAuth 2.1. But a community server with 10x the stars may be the better choice."
---

Jira and Confluence are the backbone of project management and documentation at thousands of companies. The problem is obvious: AI agents can't see your sprint board, can't search your knowledge base, and can't create tickets from conversation context without some kind of bridge.

Atlassian launched their official Rovo MCP Server in May 2025, hosted at `mcp.atlassian.com`. It gives AI agents structured access to Jira, Confluence, and Compass through OAuth 2.1. But here's the twist — a community server with 10x the GitHub stars may actually be the better choice for many teams.

## The Official Server

**Repository:** [atlassian/atlassian-mcp-server](https://github.com/atlassian/atlassian-mcp-server)
**Stars:** 436 | **Forks:** 44 | **Commits:** 69 | **Contributors:** 13
**Language:** JavaScript | **License:** Apache 2.0

The Atlassian Rovo MCP Server is cloud-hosted — there's nothing to install, no local process to manage. You point your MCP client at `https://mcp.atlassian.com/v1/mcp` and complete an OAuth 2.1 consent flow in your browser. All actions respect your existing Jira and Confluence permissions. This is the right architecture.

### What It Does

The server supports three Atlassian products:

**Jira:**
- Search issues with JQL ("Find all open bugs in Project Alpha")
- Create, update, and transition issues
- Add comments and work logs
- Bulk issue creation from specs or meeting notes

**Confluence:**
- Search pages with CQL
- Read, create, and update pages
- Summarize content
- Navigate spaces

**Compass:**
- Create service components from repositories
- Query service dependencies
- Bulk import components and custom fields from CSV/JSON

**Cross-product:**
- Link Jira tickets to Confluence pages
- Fetch documentation linked to Compass components
- Rovo Search across all connected products

### Setup

For supported clients (Claude, ChatGPT, GitHub Copilot CLI, Gemini CLI, VS Code, Amazon Quick Suite), setup is straightforward — add the server endpoint and complete the OAuth flow. The app auto-installs on first authorization (no Marketplace installation needed).

For local or custom clients, you'll need Node.js v18+ to run the `mcp-remote` proxy that bridges stdio transport to the remote HTTPS endpoint.

**API token authentication** is available for headless or long-running setups, but requires an organization admin to enable it first and uses scoped Rovo MCP tokens rather than standard Atlassian API tokens.

### Rate Limits

| Plan | Limit |
|------|-------|
| Free | 500 calls/hour |
| Standard | 1,000 calls/hour |
| Premium/Enterprise | 1,000 base + 20 per user (up to 10,000/hour max) |

These limits are per-organization, not per-user. For most teams, the Standard tier's 1,000 calls/hour should be sufficient. Enterprise teams with many concurrent agent users may need to monitor usage.

## What Works Well

**Cloud-hosted with OAuth 2.1 is the gold standard.** No local dependencies, no credential files to manage, no Docker containers to run. The server handles scaling, uptime, and transport. This is how production MCP servers should work.

**Permission-aware by design.** Every action respects the user's existing Jira, Confluence, and Compass roles. If you can't see a project in Jira, your agent can't either. IP allowlisting is also honored if your organization uses it.

**Audit logging.** All MCP actions appear in your organization's audit log. For compliance-heavy environments, this is critical — you can trace what every agent did, when, and on whose behalf.

**Free for all Atlassian Cloud customers.** No additional cost beyond your existing Atlassian subscription. The rate limits scale with your plan tier, but the MCP server itself adds no per-user or per-call charges.

**Admin controls are comprehensive.** Organization admins can manage, monitor, and revoke MCP access through the Connected Apps interface. Domain and IP controls let you restrict which external AI tools can connect. Individual users can revoke their own authorization independently.

**AGENTS.md integration.** You can configure default project keys, space IDs, and cloud IDs in AGENTS.md to reduce discovery tool calls and save tokens — a thoughtful touch for reducing per-query costs.

## Where It Falls Short

**57 open issues reveal real reliability problems.** This isn't just feature requests — there are fundamental bugs:

- **Search uses a deprecated API endpoint.** Issue #70 reports `jira_search` returning empty results because the server uses the deprecated `/rest/api/3/search` endpoint. This is a showstopper for the most basic Jira workflow.
- **ADF conversion failures.** Multiple issues (#42, #101, #104) report `editJiraIssue` failing when converting markdown to Atlassian Document Format. You can create issues, but updating descriptions often breaks.
- **Content loss during Confluence edits.** Issue #60 reports that editing pages via MCP causes loss of rich content — inline comment anchors stripped (#54), HTML details tags escaped (#53). This is data-destructive behavior.
- **"Terribly unreliable with Claude Code."** Issue #64 is a direct user report about persistent failures.
- **Authentication session failures.** Multiple issues (#55, #57, #58, #41) describe OAuth sessions breaking after re-authentication, especially in VS Code and Claude Code. Sessions that should "just work" require manual intervention.

**Cloud-only with no Data Center support.** If your organization runs Jira or Confluence on Server or Data Center (still common in enterprises with compliance requirements), the official server is not an option. This is a significant gap.

**No self-hosted deployment.** You can't run this server behind your firewall. All data flows through `mcp.atlassian.com` on Cloudflare infrastructure. For organizations with strict data residency requirements, this may be a non-starter.

**The README doesn't list actual tools.** Unlike every other MCP server we've reviewed, the official documentation describes workflows ("Find all open bugs") rather than listing actual tool names and parameters. You discover the tools only after connecting. This makes it harder to evaluate capabilities before setup.

**No file attachments.** Issue #47 and #63 request the ability to attach files to Jira issues — a common workflow that's missing.

**User mentions render as raw Account IDs.** Issue #84 reports that when agents add comments with @mentions, they show up as raw Atlassian account IDs rather than display names.

**BitDefender false positive.** Issue #91 reports BitDefender flagging the OAuth command line as malicious during pre-login — a bad first impression even if it's a false positive.

## The Community Alternative

**Repository:** [sooperset/mcp-atlassian](https://github.com/sooperset/mcp-atlassian)
**Stars:** 4,600 | **Forks:** 1,000 | **Commits:** 558
**Language:** Python | **License:** MIT
**Latest release:** v0.21.0 (March 2026) | **Total releases:** 69

The community server from sooperset has **10x the GitHub stars** of the official server. That's extremely unusual — for most products, the official server dominates adoption. Here's why the community version leads:

**72 tools vs. undocumented tools.** The community server explicitly documents 72 tools covering Jira and Confluence operations including search, CRUD, comments, transitions, sprints, boards, backlogs, and more.

**Server/Data Center support.** Works with Jira Server/Data Center v8.14+ and Confluence Server/Data Center v6.0+ — the feature the official server refuses to support.

**Multiple auth methods.** API tokens for Cloud, Personal Access Tokens for Server/Data Center, and OAuth 2.0.

**SSE and Streamable HTTP transport.** Supports remote hosting with multi-user capabilities, not just stdio.

**Self-hosted.** Install via `uvx`, Docker, `pip`, or from source. Your data stays behind your firewall.

**Active development.** 558 commits, 69 releases, v0.21.0 as of March 2026 — rapid iteration with 1-2 week release cadence.

**But it has its own problems:** 129 open issues and 35 open PRs. It's community-maintained with no corporate backing. No hosted remote option (you manage the infrastructure). And it requires Python and its dependency chain.

## Other Community Servers

| Server | Stars | Focus | Notable |
|--------|-------|-------|---------|
| [aashari/mcp-server-atlassian-jira](https://github.com/aashari/mcp-server-atlassian-jira) | 60 | Jira-only | 5 generic HTTP tools (GET/POST/PUT/PATCH/DELETE), TOON format reduces tokens 30-60% |
| [xuanxt/atlassian-mcp](https://github.com/xuanxt/atlassian-mcp) | — | Jira + Confluence | 51 tools, npm + Docker, sprints and boards |
| [b1ff/atlassian-dc-mcp](https://github.com/b1ff/atlassian-dc-mcp) | — | Data Center | Bitbucket + Confluence + Jira for DC version |
| [nguyenvanduocit/jira-mcp](https://github.com/nguyenvanduocit/jira-mcp) | — | Jira | Go-based, sprint planning + workflow transitions |

The aashari server takes an interesting approach: instead of wrapping individual Jira operations into specific tools, it exposes five generic HTTP methods that map directly to Jira's REST API. This means any API endpoint is accessible, but agents need to know the Jira API structure to use it effectively.

## Security Considerations

Atlassian's README includes an unusually candid security warning: LLMs are vulnerable to prompt injection and tool poisoning attacks. They explicitly recommend:

- Use least privilege and scoped tokens
- Review high-impact changes before confirming
- Monitor audit logs for unusual activity
- Only use trusted MCP clients and servers

This transparency is commendable, but the warnings highlight a real risk: an agent with Jira write access could create, modify, or transition issues based on injected prompts. The official server's permission model mitigates this (you can't exceed your own access), but doesn't prevent an agent from taking unintended actions within your permission scope.

The community server (sooperset) has its own `SECURITY.md` with API token handling guidelines, but lacks the audit logging that the official server provides.

## Who Should Use Which

**Use the official Atlassian server if:**
- You're on Atlassian Cloud and want zero-install setup
- Audit logging and admin controls matter for compliance
- Your workflows are primarily read-heavy (search, summarize, navigate)
- You're using a supported client (Claude, ChatGPT, Copilot CLI, VS Code)

**Use sooperset/mcp-atlassian if:**
- You need Server/Data Center support
- You need self-hosted deployment behind a firewall
- You need the full 72-tool surface area
- You want a battle-tested server with rapid release cadence
- Write operations (creating/editing issues and pages) are central to your workflow

**Use aashari/mcp-server-atlassian-jira if:**
- You want maximum API coverage with minimal tool overhead
- Your agents can navigate Jira's REST API structure
- Token efficiency is critical (TOON format)

## The Verdict

**Rating: 3.5 / 5** — for the official Atlassian Rovo MCP server.

The architecture is right: cloud-hosted, OAuth 2.1, permission-aware, audit-logged, free with your existing subscription. Atlassian is building the MCP server that enterprise teams should want.

But the execution isn't there yet. Search returning empty results due to a deprecated API endpoint is unacceptable for a server that's been live since May 2025. ADF conversion failures make write operations unreliable. Authentication sessions break across multiple clients. These aren't edge cases — they're core workflows failing.

The fact that a community server has 10x the adoption tells the story. sooperset/mcp-atlassian fills the gaps the official server leaves: Server/Data Center support, documented tools, self-hosted deployment, and more reliable write operations. It's the server most teams will actually use day-to-day.

Atlassian has the right foundation. They need to fix the search regression, stabilize ADF conversion, and — frankly — document what tools their server actually exposes. Until then, the community server is the safer bet for anything beyond basic read operations.

---

*This review is based on research conducted in March 2026, analyzing the GitHub repositories, official documentation, Atlassian blog announcements, open issues, and community feedback. ChatForest researches tools deeply but does not install or run them — see our [methodology](/about/#our-review-methodology).*

*This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*
