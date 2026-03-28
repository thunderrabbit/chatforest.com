# MCP Integration with Slack and Microsoft Teams for AI Agents

**Research date**: 2026-03-28
**Status**: Research only -- nothing in this document has been hands-on tested

---

## 1. Slack MCP Servers

### 1A. Slack's Official MCP Server (First-Party)

Slack released its own first-party MCP server, announced at Dreamforce in October 2025 and reaching general availability in February 2026.

- **Endpoint**: `https://mcp.slack.com/mcp`
- **Protocol**: JSON-RPC 2.0 over Streamable HTTP (not SSE-based)
- **Documentation**: https://docs.slack.dev/ai/slack-mcp-server/

**Tools exposed** (organized by category):

| Category | Capabilities |
|----------|-------------|
| Search | Messages, files (filterable by date/user/content type), users (partial name, email, ID), public and private channels |
| Messages | Send to any conversation type, draft/format/preview, retrieve channel history, access thread conversations |
| Canvases | Create, update, read/export as markdown |
| User data | Full profiles, custom fields, statuses |

**OAuth scopes required**:

| Capability | Scopes |
|-----------|--------|
| Search messages/channels | `search:read.public`, `search:read.private`, `search:read.mpim`, `search:read.im` |
| Search files | `search:read.files` |
| Search users | `search:read.users` |
| Send messages | `chat:write` |
| Read channels/threads | `channels:history`, `groups:history`, `mpim:history`, `im:history` |
| Canvases | `canvases:read`, `canvases:write` |
| User profiles | `users:read`, `users:read.email` |

**Auth flow**: Standard Slack OAuth 2.0 -- requires registered Slack app with fixed app ID. Only directory-published or internal apps are permitted (unlisted apps are prohibited). Admin approval flows are built in.

**Rate limits**: Same as Slack Web API methods:
- Search users/channels: Tier 2 (~20+ per minute)
- Read channel/thread: Tier 3 (~50+ per minute)
- Read user profile: Tier 4 (~100+ per minute)
- Search messages/files: Special per-method limits

**Supported MCP clients** (no custom code needed): Claude.ai, Claude Code, Perplexity, Cursor.

**Key limitation**: Provides a curated subset of the Slack Web API -- reportedly ~10% of the 200+ available methods.

Sources:
- https://docs.slack.dev/ai/slack-mcp-server/
- https://slack.com/blog/news/powering-agentic-collaboration
- https://slack.dev/context-aware-agents-slack-mcp-server-real-time-search/

---

### 1B. modelcontextprotocol/server-slack (Archived Reference Server)

The original reference implementation from the MCP project. **Archived on May 29, 2025** after a security vulnerability was reported.

- **Package**: `@modelcontextprotocol/server-slack` on npm (~14,000 weekly downloads at time of archival)
- **Repo**: https://github.com/modelcontextprotocol/servers-archived/tree/main/src/slack
- **Transport**: stdio (local process)

**8 tools exposed**:
1. `slack_list_channels` -- list public channels (limit/cursor pagination)
2. `slack_post_message` -- post message (channel_id + text)
3. `slack_reply_to_thread` -- reply in thread (channel_id + thread_ts + text)
4. `slack_add_reaction` -- add emoji reaction
5. `slack_get_channel_history` -- recent messages (default 10)
6. `slack_get_thread_replies` -- all replies in a thread
7. `slack_get_users` -- list workspace users with pagination
8. `slack_get_user_profile` -- detailed profile for a user_id

**Environment variables**:
- `SLACK_BOT_TOKEN` (xoxb-* bot token)
- `SLACK_TEAM_ID` (T* workspace ID)
- `SLACK_CHANNEL_IDS` (optional, comma-separated whitelist)

**Required OAuth scopes**: `channels:history`, `channels:read`, `chat:write`, `reactions:write`, `users:read`, `users.profile:read`

**CRITICAL: This server has a known data exfiltration vulnerability** (see Security section below). Do not use in production.

Sources:
- https://www.npmjs.com/package/@modelcontextprotocol/server-slack
- https://github.com/modelcontextprotocol/servers-archived/tree/main/src/slack

---

### 1C. korotovsky/slack-mcp-server (Community, Go)

The most popular community alternative. Reports 9,000+ active users and 30,000+ monthly visits.

- **Repo**: https://github.com/korotovsky/slack-mcp-server
- **Language**: Go
- **Transport**: stdio, SSE, and HTTP

**Key features**:
- ~13 tools: `conversations_history`, `conversations_replies`, `conversations_add_message`, `reactions_add`, `reactions_remove`, `attachment_get_data`, `conversations_search_messages`, `channels_list`, `usergroups_list`, `usergroups_me`, `usergroups_create`, `usergroups_update`, `usergroups_users_update`
- DMs, Group DMs support
- Smart history fetch (by date or count)
- **GovSlack support** (routes API calls to slack-gov.com for FedRAMP environments)
- Proxy support

**Auth modes**:
- **OAuth mode**: xoxp-* (user token) or xoxb-* (bot token) -- secure, recommended
- **Stealth mode**: xoxc-*/xoxd-* session tokens extracted from browser cookies -- no app installation needed, but lacks audit trails

**Limitation**: Stealth mode bypasses Slack's standard governance. Not suitable for enterprise/compliance environments.

Sources:
- https://github.com/korotovsky/slack-mcp-server
- https://truto.one/blog/best-mcp-server-for-slack-in-2026

---

### 1D. Other Notable Slack MCP Projects

- **AVIMBU/slack-mcp-server** -- TypeScript, ~8 tools (channels, messages, threads, reactions, users). Standard OAuth. https://github.com/AVIMBU/slack-mcp-server
- **Slackdump** -- Local MCP server for analyzing downloaded Slack archive data. Not real-time; usage may trigger Slack security alerts.
- **Truto** (managed SaaS) -- Dynamic tool generation from full Slack API surface, managed OAuth lifecycle, expiring server URLs with TTL, method-level filtering. Hosted JSON-RPC endpoint.

---

## 2. Microsoft Teams MCP Servers

### 2A. Microsoft's Official Support: Agent Connectors + Teams SDK

Microsoft has taken two complementary approaches:

**Agent Connectors (Public Developer Preview)**:
Register any remote MCP server in the Microsoft 365 app manifest (`manifest.json`), enabling Teams Channel Agent to discover and invoke MCP tools.

```json
"agentConnectors": [{
  "id": "my-mcp-server",
  "displayName": "My Automation Server",
  "description": "Provides workflow automation tools.",
  "toolSource": {
    "remoteMcpServer": {
      "mcpServerUrl": "https://mcp.mycompany.com",
      "authorization": {
        "type": "OAuthPluginVault",
        "referenceId": "my-oauth-config"
      }
    }
  }
}]
```

- Auth options: `OAuthPluginVault` (OAuth 2.0 via Microsoft's secure vault) or `None`
- Tool discovery: Inline definitions in manifest or dynamic via `tools/list`
- Currently only supported in Channel Agent for Teams
- Requires HTTPS/WSS endpoint, TLS 1.2+
- Documentation: https://learn.microsoft.com/en-us/microsoftteams/platform/m365-apps/agent-connectors

**Teams SDK (formerly Teams AI Library)**:
Native MCP support built into the SDK (GA in C# and JavaScript, preview in Python). Enables agents built with the Teams SDK to connect to any MCP server as a tool provider.

- Documentation: https://devblogs.microsoft.com/microsoft365dev/announcing-the-updated-teams-ai-library-and-mcp-support/

**Copilot Studio**:
MCP is generally available in Microsoft Copilot Studio, allowing no-code/low-code agent builders to connect MCP servers.

Sources:
- https://learn.microsoft.com/en-us/microsoftteams/platform/m365-apps/agent-connectors
- https://devblogs.microsoft.com/microsoft365dev/announcing-the-updated-teams-ai-library-and-mcp-support/
- https://www.microsoft.com/en-us/microsoft-copilot/blog/copilot-studio/model-context-protocol-mcp-is-now-generally-available-in-microsoft-copilot-studio/

---

### 2B. floriscornel/teams-mcp (Community, TypeScript)

The most comprehensive community Teams MCP server with 25 tools.

- **Repo**: https://github.com/floriscornel/teams-mcp
- **Package**: `@floriscornel/teams-mcp` on npm
- **Auth**: OAuth 2.0 with Microsoft Graph, automatic token refresh
- **Setup**: `npx @floriscornel/teams-mcp@latest authenticate`
- **Read-only mode** available via `--read-only` flag

**25 tools organized by category**:

| Category | Tools |
|----------|-------|
| Auth (2) | `auth_status`, `get_current_user` |
| Users (2) | `search_users`, `get_user` |
| Teams (11) | `list_teams`, `list_channels`, `get_channel_messages`, `get_channel_message_replies`, `send_channel_message`, `reply_to_channel_message`, `update_channel_message`, `delete_channel_message`, `list_team_members`, `search_users_for_mentions`, `send_file_to_channel` |
| Chats (7) | `list_chats`, `get_chat_messages`, `send_chat_message`, `create_chat`, `update_chat_message`, `delete_chat_message`, `send_file_to_chat` |
| Media (2) | `download_message_hosted_content`, `download_chat_hosted_content` |
| Search (2) | `search_messages` (KQL syntax), `get_my_mentions` |

**Graph API permissions (full mode)**: `User.Read`, `User.ReadBasic.All`, `Team.ReadBasic.All`, `Channel.ReadBasic.All`, `ChannelMessage.Read.All`, `ChannelMessage.Send`, `ChannelMessage.ReadWrite`, `Chat.ReadWrite`, `TeamMember.Read.All`, `Files.ReadWrite.All`

**Read-only permissions**: `User.Read`, `User.ReadBasic.All`, `Team.ReadBasic.All`, `Channel.ReadBasic.All`, `ChannelMessage.Read.All`, `TeamMember.Read.All`, `Chat.Read`

**Notable features**:
- HTML-to-Markdown conversion for LLM consumption
- Large file upload via resumable upload sessions (>4 MB)
- Message importance levels (normal, high, urgent)
- KQL-based cross-Teams search
- @mention support

Sources:
- https://github.com/floriscornel/teams-mcp

---

### 2C. InditexTech/mcp-teams-server (Community, Python)

Simpler Teams MCP server focused on channel messaging.

- **Repo**: https://github.com/InditexTech/mcp-teams-server
- **Language**: Python 3.10+
- **Auth**: Azure AD app credentials (app ID, client secret, tenant ID)
- **Docker**: `ghcr.io/inditextech/mcp-teams-server:latest`

**5 core tools**: Create threads, update threads (reply), read thread replies, read channel messages, list channel members.

**Limitation**: Single-channel focus (requires `TEAMS_CHANNEL_ID`), so multi-channel requires multiple server instances.

Sources:
- https://github.com/InditexTech/mcp-teams-server

---

## 3. Real-World Use Cases

### Incident Response
- PagerDuty alert fires -> AI agent uses Slack MCP + Prometheus MCP to gather error messages from Slack channels and metrics, synthesizes a report for the on-call engineer
- Automated log analysis: agents query Datadog MCP, identify error patterns, post summaries to Slack incident channels before humans are even engaged

### Security Alert Triage
- AI agents analyze security alerts, locate relevant SOPs from Confluence, execute remediation steps, and keep teams informed via Slack throughout

### Meeting and Channel Summarization
- Summarize channel history and surface institutional knowledge
- Generate weekly updates grounded in active project conversations
- Post concise wrap-up summaries after incident reviews

### Knowledge Retrieval
- Engineers ask questions in natural language; AI searches across Slack history, threads, and files to find answers
- Combined with Slack's Real-time Search (RTS) API for permission-aware access to conversations as they exist in the workspace

### Personal Productivity Agents
- Aggregate meeting notes and tasks across Slack, GitHub, and Jira
- Handle incident triage, status reports, and on-call handoffs automatically

### Cross-Platform Bridging
- Platform-agnostic agent core with channel-specific adapters for Slack, Teams, and other platforms
- API gateway sits between platform integrations and agent logic for unified auth, rate limiting, and routing

Sources:
- https://slack.dev/context-aware-agents-slack-mcp-server-real-time-search/
- https://clickup.com/blog/hub/ai/mcp/slack/
- https://www.mindstudio.ai/blog/multi-channel-ai-agent-deployment-slack-teams

---

## 4. Architecture Patterns

### Pattern A: AI Desktop Client + MCP Server (Tool Use)

The simplest pattern. An AI client (Claude Desktop, Cursor, etc.) connects to the Slack or Teams MCP server as a tool provider. The user asks the AI to search Slack, post messages, etc.

```
User -> AI Client (MCP Host) -> MCP Client -> Slack/Teams MCP Server -> Slack/Teams API
```

- Good for: personal productivity, ad-hoc queries
- Limitation: requires human in the loop; no real-time event handling

### Pattern B: Slack/Teams Bot as MCP Client (Bridge)

A Slack or Teams bot acts as the MCP client, bridging chat messages to MCP servers. Projects like `tuannvm/slack-mcp-client` and `sooperset/mcp-client-slackbot` implement this.

```
Slack User -> Slack (Socket Mode / Events API) -> Bot Process (MCP Client)
  -> LLM Provider (OpenAI/Anthropic/Ollama)
  -> MCP Server(s) (filesystem, database, Kubernetes, etc.)
  -> Response back to Slack thread
```

- The bot listens via Socket Mode (WebSocket, no public endpoint needed) or Events API (HTTP webhook)
- LLM decides which MCP tools to call based on user message
- Good for: team-wide AI assistants in channels

### Pattern C: MCP Gateway Architecture

For production multi-agent systems, a centralized MCP Gateway handles all tool connections:

```
Multiple Agents -> MCP Gateway -> [Slack MCP, Teams MCP, Jira MCP, GitHub MCP, ...]
```

- Gateway handles auth, rate limiting, observability, security policies
- Solves the N x M integration problem
- Single point for audit logging and access control

### Pattern D: Slack Official MCP + RTS API (Context-Aware Agents)

Slack's recommended production pattern combines their MCP server with the Real-time Search (RTS) API:

- MCP Server: tool execution (send messages, manage canvases, etc.)
- RTS API: secure, permission-aware search across conversations, files, and threads
- All actions respect individual user permissions at query time
- Slack handles OAuth lifecycle

### Real-Time Events vs. Polling

| Approach | Slack | Teams |
|----------|-------|-------|
| WebSocket | Socket Mode (bidirectional, no public URL needed) | Not natively supported for MCP |
| HTTP Webhooks | Events API (requires public HTTPS endpoint) | Webhook subscriptions via Graph API |
| Polling | Web API calls on interval | Graph API polling |
| MCP approach | MCP server is request/response, not event-driven | Agent Connectors are request/response |

**Key insight**: MCP itself is request/response (tool invocation), not event-driven. For real-time reactive behavior, you need a separate event listener (Socket Mode, Events API, webhooks) that triggers MCP tool calls when events arrive.

### Thread Context Management
- Slack: `thread_ts` identifies threads; MCP tools accept thread_ts for reading/replying
- Teams: Message IDs and reply chains via Graph API; the floriscornel/teams-mcp server handles `get_channel_message_replies`
- For multi-turn conversations, the bot must maintain context between messages (typically via conversation history in the LLM prompt)

### Multi-Workspace Deployments
- Slack: Each workspace requires separate OAuth tokens; the official MCP server scopes access per-user
- Teams: Multi-tenant Azure AD apps can serve multiple organizations; floriscornel/teams-mcp supports this

Sources:
- https://docs.slack.dev/ai/slack-mcp-server/
- https://github.com/tuannvm/slack-mcp-client
- https://composio.dev/content/mcp-gateways-guide
- https://docs.slack.dev/apis/events-api/using-socket-mode/

---

## 5. Security Considerations

### The Slack MCP Server Data Exfiltration Vulnerability (May 2025)

A critical vulnerability was found in the archived `@modelcontextprotocol/server-slack`:

1. Attacker embeds malicious instructions in content the AI processes (prompt injection)
2. Compromised agent retrieves sensitive data (API keys, channel messages)
3. Agent posts crafted hyperlinks with stolen data as URL parameters
4. Slack's link unfurling automatically sends requests to attacker-controlled servers
5. Data exfiltrated without visible indication in the Slack channel

**Timeline**: Reported May 27, 2025 -> Anthropic archived the server May 29, 2025 -> Public disclosure June 24, 2025. Anthropic declined to issue a CVE.

This has been called "the lethal trifecta" (Simon Willison): AI agent + tool access + private data + untrusted input.

Source: https://embracethered.com/blog/posts/2025/security-advisory-anthropic-slack-mcp-server-data-leakage/

### Broader MCP Security Risks

Per OWASP MCP Top 10 and Microsoft's security analysis:

- **Token mismanagement**: Tokens stored in env vars or config files; no expiry, no rotation. 43% of publicly available MCP servers reportedly contain command injection vulnerabilities.
- **Excessive permissions**: Many MCP tools granted unrestricted network, filesystem, or API access
- **Prompt injection**: Malicious content in Slack messages or Teams chats can manipulate agent behavior
- **Data exfiltration via tool chaining**: Agent reads private data via one tool, sends it externally via another
- **No method-level filtering**: Most open-source servers expose all tools; no ability to restrict which tools are available per user or context

### Mitigation Strategies

- Use Slack's official MCP server (user-level permission enforcement, admin approval flows, audit logs)
- Scope bot tokens to minimum required permissions
- For Teams, use read-only mode (`--read-only` flag) when write access is not needed
- Implement MCP Gateway with centralized auth, logging, and policy enforcement
- Never process untrusted content in the same agent context that has access to private data
- Monitor and log all MCP tool invocations
- Rotate tokens regularly; use OAuth with expiring tokens rather than static bot tokens

### Compliance Considerations

- **Slack**: Enterprise Grid supports DLP, eDiscovery, retention policies; MCP actions respect these when using official server
- **Teams**: Graph API permissions are governed by Azure AD; Conditional Access policies apply
- **Both**: Audit logging is essential for SOC 2, HIPAA, etc. The official Slack MCP server includes audit log integration; community servers generally do not

Sources:
- https://embracethered.com/blog/posts/2025/security-advisory-anthropic-slack-mcp-server-data-leakage/
- https://owasp.org/www-project-mcp-top-10/2025/MCP01-2025-Token-Mismanagement-and-Secret-Exposure
- https://techcommunity.microsoft.com/blog/microsoft-security-blog/understanding-and-mitigating-security-risks-in-mcp-implementations/4404667
- https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/plug-play-and-prey-the-security-risks-of-the-model-context-protocol/4410829

---

## 6. MCP vs. Native Bot APIs

### When to Use MCP

| Advantage | Detail |
|-----------|--------|
| Standardized tool discovery | Agents discover available tools at runtime via `tools/list` |
| LLM-native | Designed for AI agents; tools have machine-readable descriptions |
| Multi-tool orchestration | Agent can combine Slack + GitHub + Jira + database tools in one workflow |
| Reduced integration code | Single protocol for all tool connections |
| Framework ecosystem | Works with LangChain, CrewAI, Claude SDK, etc. |

### When to Use Native Bot API (Slack Bolt / Teams Bot Framework)

| Advantage | Detail |
|-----------|--------|
| Full API coverage | Access to 100% of platform APIs (200+ Slack methods vs. ~10% via MCP) |
| Real-time events | Native event subscriptions (Socket Mode, Events API, Graph webhooks) |
| Rich UI | Full Block Kit / Adaptive Cards support with interactive elements |
| Deterministic behavior | Traditional code paths vs. LLM-decided tool selection |
| No LLM costs | No per-request inference costs |
| Mature ecosystem | Battle-tested SDKs, extensive documentation, large community |

### Hybrid Approach (Recommended for Production)

Most production systems combine both:
- Native bot for event listening, rich UI rendering, interactive components
- MCP for AI-driven tool use, reasoning, and cross-platform orchestration
- The bot receives events natively, then invokes an LLM with MCP tools for complex reasoning tasks

Sources:
- https://truto.one/blog/best-mcp-server-for-slack-in-2026
- https://www.workato.com/the-connector/slack-mcp/

---

## 7. Framework Support

### CrewAI
- Native MCP support; agents declare MCP servers inline
- Framework handles connection lifecycle, transport negotiation, tool discovery automatically
- Can connect to Slack/Teams MCP servers as tool providers
- 45,900+ GitHub stars as of March 2026

### LangChain / LangGraph
- MCP support through LangChain's tool ecosystem
- Requires more manual wiring than CrewAI
- Can wrap MCP tools as LangChain tools

### Claude SDK (Claude Code, Claude Desktop)
- First-class MCP client support
- Slack MCP server auto-configures when plugin loads
- OAuth authentication flow built in

### Composio
- Managed MCP integration platform
- Pre-built Slack and Teams MCP connectors
- Handles OAuth lifecycle across multiple providers
- Used with CrewAI, LangChain, and Claude Code

### BeeAI Framework
- Provides MCP Slackbot guide and integration patterns
- https://framework.beeai.dev/guides/mcp-slackbot

### Microsoft 365 Agents Toolkit
- Official Microsoft MCP server for the Teams/M365 ecosystem
- https://devblogs.microsoft.com/microsoft365dev/build-smarter-with-the-microsoft-365-agents-toolkit-mcp-server/

### General Pattern
Most frameworks treat MCP as a transport layer. The typical integration is:
1. Framework connects to MCP server(s)
2. Tools are discovered via `tools/list`
3. Tools are exposed to the LLM as callable functions
4. LLM selects and invokes tools during reasoning
5. Framework handles the MCP protocol mechanics

Sources:
- https://www.digitalapplied.com/blog/mcp-vs-langchain-vs-crewai-agent-framework-comparison
- https://composio.dev/toolkits/slack/framework/claude-code
- https://framework.beeai.dev/guides/mcp-slackbot

---

## 8. Limitations and Gotchas

### Rate Limits

| Platform | Constraint |
|----------|-----------|
| Slack | Tiered rate limits (Tier 1-4 + Special); same limits whether via MCP or direct API |
| Teams/Graph | Per-app and per-tenant throttling; 10,000 API requests per 10 seconds per app per tenant (varies by endpoint) |

AI agents making multiple tool calls per user request can exhaust rate limits quickly. Implement backoff and batching.

### Message Size Limits
- **Slack**: 40,000 characters per message; 4,000 characters for text in attachments
- **Teams**: 28 KB per message (including Adaptive Card JSON)

### Rich Formatting

**Slack Block Kit challenges for AI agents**:
- LLMs default to standard markdown, which does not render correctly in Slack (Slack uses `mrkdwn`, a non-standard variant)
- Block Kit JSON is complex and error-prone for LLMs to generate
- Slack APIs accept invalid Block Kit and silently degrade (returning 200 OK) -- agents think they succeeded when formatting was dropped
- Work Objects require manual Slack app configuration and lack a preview builder

**Teams Adaptive Cards challenges**:
- Markdown only supported in `TextBlock` fields, not universally
- HTML is not supported in Adaptive Cards
- Rendering differs between desktop and mobile Teams clients
- Dedicated MCP server exists for generating valid Adaptive Cards: `VikrantSingh01/adaptive-cards-mcp`

### Threading Model Differences
- **Slack**: Thread identified by `thread_ts`; replies are flat within a thread; threads can be "also sent to channel"
- **Teams**: Replies are nested under channel messages; 1:1 and group chats have different threading from channel conversations; reply chains have different API shapes

### File Handling
- **Slack**: File uploads via `files.upload` (deprecated) or `files.uploadV2`; most community MCP servers have limited or no file support
- **Teams** (floriscornel/teams-mcp): Supports file upload to channels/chats including large files (>4 MB via resumable upload sessions)

### Cross-Platform Agent Gotchas
- **Silent API failures**: Both Slack and Teams APIs may return success while silently dropping invalid content. Agents must verify outcomes beyond HTTP status codes.
- **Permission model mismatch**: Slack uses bot/user tokens with OAuth scopes; Teams uses Azure AD with Graph API permissions. A cross-platform agent needs separate auth flows.
- **Message format translation**: Messages authored for one platform need format conversion for the other (mrkdwn vs. Adaptive Cards vs. HTML)
- **Ephemeral state**: MCP is stateless request/response; maintaining conversational context across multiple tool calls requires external state management

Sources:
- https://rida.me/blog/mcp-embedded-resources-slack-work-objects-block-kit/
- https://docs.slack.dev/block-kit/formatting-with-rich-text/
- https://learn.microsoft.com/en-us/microsoftteams/platform/task-modules-and-cards/cards/cards-format
- https://glama.ai/mcp/servers/VikrantSingh01/adaptive-cards-mcp

---

## Summary Comparison Table

| Aspect | Slack (Official MCP) | Slack (Community) | Teams (Microsoft Official) | Teams (floriscornel) | Teams (InditexTech) |
|--------|---------------------|-------------------|---------------------------|---------------------|-------------------|
| Status | GA (Feb 2026) | Active | Public Preview | Active | Active |
| Transport | Streamable HTTP | stdio/SSE/HTTP | HTTPS/WSS (Agent Connectors) | stdio (npx) | stdio (uv) |
| Tools | Curated subset (~10% of API) | 8-13 tools | SDK-level MCP support | 25 tools | 5 tools |
| Auth | OAuth 2.0 (user-level) | Bot token / session cookies | Azure AD / OAuth vault | Graph OAuth (auto-refresh) | Azure AD app credentials |
| Read-only mode | N/A | N/A | N/A | Yes | No |
| File support | Via canvases | Limited | N/A | Yes (incl. large files) | No |
| Search | Full (messages, files, users) | Message search | N/A | KQL-based cross-Teams | No |
| Audit logging | Yes (built-in) | No | Via Azure AD | No | No |
| Multi-tenant | Per-user scoping | Single workspace | Yes | Yes | Single tenant option |
| GovSlack/GCC | Unknown | Yes (korotovsky) | Via GCC tenant | Unknown | Unknown |
