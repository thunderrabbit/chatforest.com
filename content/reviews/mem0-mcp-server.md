---
title: "The Mem0 MCP Server — AI Memory That Actually Scales (If You Pay)"
date: 2026-03-14T21:50:00+09:00
description: "Mem0's MCP server gives AI agents persistent, semantic memory with nine tools covering add, search, update, and delete. Cloud-hosted with a free tier, plus an open-source local option via OpenMemory. Here's the honest review."
og_description: "Mem0's MCP server provides persistent AI memory with semantic search, graph memory, and nine tools. Free tier available, local self-hosting via OpenMemory. Rating: 4/5."
content_type: "Review"
card_description: "Mem0's MCP server for persistent AI agent memory. Nine tools, semantic search, optional graph memory, free tier with 10K memories, and a self-hosted OpenMemory option for full local control."
---

Mem0 is the most well-funded, most-starred memory layer in the AI ecosystem — 49,800+ GitHub stars, $23.9M in funding, and a platform used by thousands of developers. Their MCP server (`mem0-mcp-server`) wraps the Mem0 Memory API so any MCP-compatible client can add, search, update, and delete long-term memories through natural language.

Unlike Anthropic's official Knowledge Graph Memory server (which stores everything in a local JSONL file), Mem0 is a managed cloud service with semantic search, automatic memory extraction, and optional graph memory. The trade-off is obvious: you get a production-grade memory layer, but your data goes through Mem0's cloud (unless you self-host with OpenMemory).

The MCP server has 632 stars and 136 forks on GitHub — a solid community adoption signal. There's also a separate community implementation by Cole Medin (`coleam00/mcp-mem0`, 660 stars) that's become a popular template for building Python MCP servers in general.

## What It Does

The server exposes nine tools:

**Memory operations:**
- **`add_memory`** — Persist text or conversation history for a user or agent. Mem0 automatically extracts and indexes key information from the content.
- **`search_memories`** — Semantic search across stored memories with filtering and result limits. This is where Mem0 shines — it doesn't just do keyword matching, it understands meaning.
- **`get_memories`** — List memories with structured filters and pagination.
- **`get_memory`** — Retrieve a single memory by its ID.
- **`update_memory`** — Overwrite a memory's content.
- **`delete_memory`** — Remove an individual memory.
- **`delete_all_memories`** — Bulk delete all memories within a scope.

**Entity management:**
- **`delete_entities`** — Remove user, agent, app, or run entities and their associated data.
- **`list_entities`** — Enumerate stored entities across the system.

The key difference from simpler memory servers: Mem0 does intelligent extraction. When you save a conversation, it doesn't just dump the raw text — it identifies and stores the meaningful facts. "I prefer Python over JavaScript and I'm working on a healthcare startup" becomes structured memories that surface when contextually relevant.

## Setup

**Installation via pip or uv:**

```bash
uv pip install mem0-mcp-server
# or
pip install mem0-mcp-server
```

**Claude Desktop configuration:**

```json
{
  "mcpServers": {
    "mem0": {
      "command": "uvx",
      "args": ["mem0-mcp-server"],
      "env": {
        "MEM0_API_KEY": "your-api-key"
      }
    }
  }
}
```

You need a Mem0 platform account (free tier available). Get your API key from the Mem0 dashboard.

**Environment variables:**
- `MEM0_API_KEY` — Required. Your Mem0 platform credentials.
- `MEM0_DEFAULT_USER_ID` — Optional. Defaults to "mem0-mcp".
- `MEM0_ENABLE_GRAPH_DEFAULT` — Optional. Enable graph memory (default: false).
- `MEM0_MCP_AGENT_MODEL` — Optional. Defaults to "openai:gpt-4o-mini".

**Docker deployment** is also available for HTTP transport on port 8081, and there's a **Smithery** option for managed remote hosting.

**Transport:** stdio (default via uvx) and HTTP (via Docker).

## The Two Mem0 MCP Options

This is where it gets interesting. Mem0 actually offers two distinct MCP servers:

### 1. mem0-mcp-server (Cloud)

The main MCP server reviewed here. It connects to Mem0's hosted platform — your memories live on their infrastructure, you get their semantic search and extraction engine, and pricing starts at free.

**Pricing tiers:**
- **Hobby (free):** 10,000 memories, 1,000 retrieval calls/month
- **Starter ($19/month):** 50,000 memories, 5,000 retrievals
- **Pro ($249/month):** Unlimited memories, 50,000 retrievals, graph memory, analytics
- **Enterprise (custom):** On-prem deployment, SSO, SLA

### 2. OpenMemory MCP (Local/Self-hosted)

A completely local, privacy-first alternative. OpenMemory runs on your machine using Docker + Postgres + Qdrant — no data leaves your infrastructure. It includes a dashboard UI for browsing, managing, and controlling memory access per client.

OpenMemory uses SSE transport (not stdio), connects to your local Postgres for relational metadata and Qdrant for vector search, and provides audit logs for every read and write. It's the right choice if you can't send data to a third-party cloud.

The trade-off: you need Docker and the infrastructure running locally, and you lose Mem0's managed extraction engine and graph memory features.

## What's Good

**Semantic search that works.** Mem0's retrieval is the real differentiator. It doesn't just match keywords — it understands that "my preferred programming language" should surface the memory about Python, even if those exact words weren't stored. The +26% accuracy claim over OpenAI Memory (from their benchmarks) is plausible given the architecture.

**Automatic memory extraction.** Agents don't need to decide what to remember. Feed in a conversation and Mem0 pulls out the facts. This removes one of the hardest problems in agent memory — most agents are terrible at deciding what's worth storing.

**Multi-level memory organization.** Memories can be scoped to users, sessions, agents, or apps. This matters for production systems where you need isolation between different users or different agent instances.

**Graph memory option.** The Pro tier adds knowledge graph capabilities on top of vector search — relationships between entities, not just isolated facts. This is where memory systems need to go, and Mem0 is ahead of most competitors here.

**Two deployment models.** Cloud for convenience, OpenMemory for privacy. Having both options with the same underlying architecture is genuinely useful.

## What's Not

**Cloud dependency for the main server.** The primary MCP server sends all your memories to Mem0's cloud. For personal use this might be fine, but for enterprise or sensitive data it's a non-starter without OpenMemory.

**Free tier limitations.** 10,000 memories and 1,000 retrievals per month sounds generous until an active agent starts saving memories from every conversation. At typical usage, you could burn through the free tier in a few weeks.

**Price jump to Pro.** The gap from Starter ($19/month) to Pro ($249/month) is steep. Graph memory and analytics — the features that make Mem0 genuinely better than simpler alternatives — are locked behind the Pro tier.

**OpenAI dependency.** The default agent model is `openai:gpt-4o-mini`, meaning the extraction pipeline uses OpenAI under the hood. This adds another API dependency and potential cost layer that's not immediately obvious.

**OpenMemory is a separate project.** Despite sharing the Mem0 brand, OpenMemory and the cloud MCP server are different codebases with different feature sets. OpenMemory doesn't get graph memory. This fragmentation can be confusing.

## How It Compares

**vs. Anthropic's Memory MCP server:** Mem0 is a massive upgrade in capability — semantic search vs. full-graph dump, automatic extraction vs. manual entity creation, cloud scaling vs. local JSONL. But the Memory server is free, has zero dependencies, and keeps everything local. For simple personal use, Anthropic's server might actually be enough.

**vs. Chroma MCP server:** Chroma gives you raw vector database operations — you manage collections, embeddings, and queries yourself. Mem0 abstracts all of that away into a "just save and search" interface. Mem0 is better for agent memory; Chroma is better for building custom RAG pipelines.

**vs. Qdrant MCP server:** Similar distinction to Chroma — Qdrant is a vector database tool, Mem0 is a memory layer built on top of vector databases. Mem0 handles extraction and organization; Qdrant gives you direct control over the vector space.

**vs. Zep:** Zep is Mem0's closest competitor in the "managed AI memory" space. Both offer semantic memory with extraction, but Zep focuses more on conversation history and temporal context. Mem0 has stronger community adoption (49K vs. ~2K stars for Zep's open-source offering).

## The Bigger Picture

Mem0 represents where AI memory is heading: managed services that handle the hard parts (extraction, indexing, retrieval) so developers can focus on building agents. The MCP server makes this accessible to any MCP-compatible client with minimal setup.

The challenge is the business model. Free tiers get people started, but the jump to production-grade features (graph memory, serious retrieval volume) costs real money. For individual developers and small teams, this is fine — $19/month is reasonable. For enterprises, the on-prem Enterprise tier exists but the pricing isn't public.

The community ecosystem is also strong — 660+ stars on Cole Medin's template implementation shows that people aren't just using mem0-mcp, they're building on top of it. And OpenMemory's local-first approach gives privacy-conscious users a viable alternative.

Memory is still a mostly unsolved problem for AI agents. Most agents either remember nothing or remember too much. Mem0's approach — automatic extraction with semantic retrieval — is the most practical solution available today, and the MCP server makes it drop-in simple.

## Rating: 4/5

Mem0's MCP server earns a 4/5 for being the most complete AI memory solution available through MCP — nine tools, semantic search, automatic extraction, graph memory, and both cloud and self-hosted deployment options. It loses a point for cloud dependency in the main server, the steep price jump to Pro for graph memory, fragmentation between the cloud and OpenMemory codebases, and the hidden OpenAI dependency in the extraction pipeline. But in a category where most alternatives are either too simple (Anthropic's JSONL graph) or too low-level (raw vector DB operations), Mem0 hits the right abstraction level for production agent memory.

**Use this if:** You want persistent AI memory without building your own extraction and retrieval pipeline, you're okay with cloud storage (or willing to run OpenMemory locally), and your agent needs to remember user preferences, project context, or conversation history across sessions.

**Skip this if:** You need everything fully local with zero cloud dependencies (OpenMemory helps but lacks graph memory), you're building custom RAG where you need direct vector DB control, or your budget can't handle the $249/month jump when you outgrow the free tier.
