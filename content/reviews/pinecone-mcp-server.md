---
title: "The Pinecone MCP Server — Cloud Vector Search With Built-In Reranking"
date: 2026-03-14T10:07:08+09:00
description: "Pinecone's official Developer MCP server connects AI coding agents to cloud vector search with 9 tools, cascading search across indexes, and built-in reranking. The most search-focused vector DB MCP server available. Here's the honest review."
og_description: "Pinecone's Developer MCP server brings cloud vector search to AI agents with 9 tools, cascading search, reranking, and documentation search. Cloud-only, integrated embedding only. Rating: 3/5."
content_type: "Review"
card_description: "Pinecone's first-party Developer MCP server for AI-assisted vector search. 9 tools covering index management, record operations, cascading search, reranking, and documentation lookup — the most search-quality-focused vector DB MCP experience available."
---

The Pinecone MCP server is the official tool for connecting AI coding agents to Pinecone, the managed vector database that pioneered serverless vector search. Instead of writing API calls to manage indexes and query embeddings, your agent can create indexes, upsert records, search across multiple indexes simultaneously, and rerank results — all through natural language.

It's first-party, maintained by Pinecone at [pinecone-io/pinecone-mcp](https://github.com/pinecone-io/pinecone-mcp). With 56 GitHub stars, it's far less adopted than [Qdrant's MCP server](/reviews/qdrant-mcp-server/) (1,300 stars) or even [Chroma's](/reviews/chroma-mcp-server/) (515 stars). But Pinecone itself is one of the most widely used vector databases in production — 2.6 billion queries served — and the MCP server reflects a search-first philosophy rather than a database-management philosophy.

This is actually one of *three* Pinecone MCP servers. The Developer MCP (this review) handles index operations and documentation search. The Assistant MCP handles retrieval from Pinecone Assistant knowledge bases. Pinecone has said they may eventually merge them, but for now, they serve different use cases.

## What It Does

The server exposes 9 tools in three categories:

**Index Management (3 tools)**
- `list-indexes` — retrieve all Pinecone indexes in your project
- `describe-index` — get detailed configuration: dimensions, metric, pod type, replicas, status
- `describe-index-stats` — record counts, namespace breakdown, fullness percentage

**Record Operations (2 tools)**
- `upsert-records` — insert or update records with integrated inference (text in, embeddings automatic)
- `search-records` — search by text query with metadata filtering and optional reranking

**Search Quality (2 tools)**
- `cascading-search` — search across multiple indexes simultaneously, deduplicate, and rerank combined results
- `rerank-documents` — apply Pinecone's reranking models to any collection of records or text

**Documentation (1 tool)**
- `search-docs` — query official Pinecone documentation directly

**Index Creation (1 tool)**
- `create-index-for-model` — create a new index configured for a specific integrated embedding model

The standout feature is **cascading search**. No other vector database MCP server offers cross-index search with automatic deduplication and reranking. If your agent is querying a knowledge base split across multiple indexes — by topic, source, or time period — `cascading-search` handles the orchestration that would otherwise require manual coordination code.

The **reranking** integration is equally distinctive. `rerank-documents` applies Pinecone's specialized models (pinecone-rerank-v0, bge-reranker-v2-m3) to re-score search results or arbitrary text. This is a search-quality technique that's typically buried in retrieval pipelines — having it as a standalone tool means your agent can iteratively improve result relevance.

## Setup

Configuration is straightforward — a single API key environment variable:

```json
{
  "mcpServers": {
    "pinecone": {
      "command": "npx",
      "args": ["-y", "@pinecone-database/mcp"],
      "env": {
        "PINECONE_API_KEY": "pcsk_..."
      }
    }
  }
}
```

Requires Node.js v18+ with `npx` on your PATH. The server runs via stdio — no remote MCP endpoint, no OAuth, despite Pinecone being an entirely cloud-based service.

Without an API key, the server still works for `search-docs` — your agent can query Pinecone's documentation without any Pinecone account. This is a nice touch for developers evaluating Pinecone or debugging integration issues.

Supported clients include Claude Desktop, Claude Code, Cursor, and Gemini CLI.

## What's Good

**Cascading search is a real differentiator.** Multi-index search with deduplication and reranking in a single tool call is something no other vector DB MCP server offers. For RAG pipelines that shard data across indexes — common in production — this eliminates significant orchestration complexity. Your agent searches everything at once and gets a single ranked result set.

**Built-in reranking.** The `rerank-documents` tool brings retrieval pipeline sophistication into the MCP layer. Your agent can search, then rerank, then search again with refined queries — all without you writing pipeline code. Reranking typically improves retrieval quality by 10-30% in production systems, and having it as a first-class tool makes it accessible to agents that wouldn't otherwise implement it.

**Integrated embedding means zero embedding configuration.** You pass text, Pinecone embeds it. No choosing embedding models, no managing API keys for OpenAI or Cohere, no dimension mismatch errors. For the common case — upsert text, search by text — this is significantly simpler than Chroma's six-provider embedding setup. The tradeoff is flexibility (see below), but simplicity has real value.

**Documentation search without authentication.** `search-docs` works with no API key. This makes the server useful even for developers who don't have Pinecone accounts yet — your agent can answer Pinecone questions from official docs. Only [Stripe's MCP server](/reviews/stripe-mcp-server/) offers a comparable documentation-search-without-auth feature.

**Clean npm distribution.** `npx -y @pinecone-database/mcp` — one command, no Python virtual environments, no Docker. The TypeScript implementation means it integrates naturally with Node.js development environments.

## What's Not

**Cloud-only. No local mode at all.** This is the biggest limitation. Every query hits Pinecone's cloud service. Unlike [Chroma](/reviews/chroma-mcp-server/) (ephemeral and persistent local modes) or [Qdrant](/reviews/qdrant-mcp-server/) (local embedded mode via `QDRANT_LOCAL_PATH`), there's no way to use Pinecone MCP for offline development, quick prototyping, or CI pipeline testing without a network connection and a Pinecone account. The free tier exists (5 indexes, 2GB storage), but "free cloud" is still fundamentally different from "runs locally."

**Integrated embedding models only.** The server only works with indexes that use Pinecone's integrated inference. If you have existing indexes with custom embeddings — from OpenAI, Cohere, or your own models — the MCP server can't access them. This is documented but surprising: it means your existing Pinecone infrastructure may be invisible to the MCP server. The `upsert-records` tool takes text, not vectors, and there's no option to provide pre-computed embeddings.

**No delete, no update metadata, no namespace management.** 9 tools sounds reasonable until you notice what's missing. You can't delete records, update metadata on existing records, list or manage namespaces, or modify index configuration. Compare Chroma MCP's full CRUD (create, read, update, delete) on both collections and documents. With Pinecone MCP, your agent can add data and search it, but can't clean it up or restructure it.

**Stdio transport for a cloud-only service.** Pinecone has no local component — everything runs in their cloud. Yet the MCP server requires local Node.js installation and stdio transport. This is an odd architectural choice. A remote MCP server at something like `mcp.pinecone.io` with OAuth would be more natural for a cloud service, would eliminate the Node.js dependency, and would match what [Neon](/reviews/neon-mcp-server/) and [Supabase](/reviews/supabase-mcp-server/) have already built.

**56 GitHub stars — lowest adoption among official servers.** Despite Pinecone being one of the most popular vector databases, the MCP server has minimal community traction. For comparison: Qdrant MCP has 1,300 stars, Chroma MCP has 515, even the community-built mcp-pinecone by sirmews has ~150 stars. Low adoption means fewer bug reports, fewer community contributions, and less battle-testing.

**Three separate servers is confusing.** The Developer MCP (this server), the Assistant MCP (for Pinecone Assistant), and the Claude Code Plugin are all separate repositories with different installation methods. Pinecone acknowledges they may merge them eventually, but today you need to choose between them — and the distinction between "Developer" and "Assistant" isn't obvious from the names alone.

## How It Compares

| Feature | Pinecone MCP | Chroma MCP | Qdrant MCP | Milvus MCP |
|---------|-------------|-----------|------------|------------|
| **Stars** | 56 | 515 | 1,300 | 220 |
| **Tools** | 9 | 13 | 2 | 12 |
| **Transport** | stdio | stdio | stdio, SSE, Streamable HTTP | stdio, SSE |
| **Local mode** | No (cloud only) | Yes (4 modes) | Yes (embedded) | Yes (Milvus Lite) |
| **Delete records** | No | Yes | No | Yes |
| **Embedding config** | Integrated only | 6 providers | FastEmbed (auto) | Multiple models |
| **Multi-index search** | Yes (cascading) | No | No | No |
| **Reranking** | Yes (built-in) | No | No | No |
| **Doc search** | Yes (no auth needed) | No | No | No |
| **Free local use** | No | Yes | Yes | Yes |

Pinecone MCP is the search-quality specialist. It's the only server with cascading search, built-in reranking, and documentation access. But it's also the only one with no local mode, no delete capability, and no support for custom embeddings.

Chroma (13 tools) wins on operational control and deployment flexibility. Qdrant (2 tools, 1,300 stars) wins on adoption and transport support. Milvus (12 tools) wins on breadth with delete and update operations. Pinecone (9 tools) wins specifically on search quality — if your use case is "find the best results," not "manage vector infrastructure."

The community-built [mcp-pinecone by sirmews](https://github.com/sirmews/mcp-pinecone) (~150 stars) is worth noting. It takes a different approach: direct vector operations rather than integrated inference, with `semantic-search`, `read-document`, `list-documents`, and `process-document` tools. It works with any Pinecone index, not just integrated embedding indexes. If the official server's integrated-embedding-only limitation is a blocker, the community server may be a better fit — though it has no reranking or cascading search.

## The Bigger Picture

Pinecone made a deliberate product choice with this MCP server: optimize for search quality over operational control. Cascading search and reranking are features from production retrieval pipelines — the kind of things that typically live in custom Python code between the user's query and the database response. Putting them in the MCP layer means agents can build more sophisticated RAG systems without writing that glue code.

But the limitations are real. Cloud-only with no local mode means you can't prototype without a network connection. Integrated embedding only means your existing Pinecone indexes might not work. No delete means your agent can accumulate data but can't clean it up. These aren't edge cases — they're fundamental constraints on what the server can do.

The fragmentation across three separate servers (Developer, Assistant, Claude Code Plugin) suggests Pinecone is still figuring out its MCP strategy. The blog post acknowledging they may merge is honest but doesn't help developers choosing today. The Assistant MCP (42 stars, Rust + Docker, 1 tool) serves a completely different use case — knowledge base retrieval — and the Claude Code Plugin adds another integration point.

At 56 stars and v0.2.1, the Developer MCP server is early. The search-quality features are genuinely innovative — cascading search across multiple indexes is something no competitor offers. But the cloud-only requirement, the integrated-embedding-only limitation, and the lack of basic operations like delete keep it from being a general-purpose vector database MCP server. It's a cloud search client, not a database management tool.

## Rating: 3/5

The Pinecone Developer MCP server earns a 3/5 for offering genuinely innovative search features — cascading search, built-in reranking, and documentation search without auth — while being constrained by cloud-only operation, integrated-embedding-only support, and missing basic operations like delete and update. The search quality tools are best-in-class among vector DB MCP servers, but the operational limitations mean your agent can search effectively while being unable to maintain its own data. At 56 stars and v0.2.1, it's also the least adopted official vector database MCP server despite Pinecone being one of the most popular vector databases.

**Use this if:** You're already using Pinecone with integrated embedding indexes and want AI-assisted search with reranking and cross-index queries.

**Skip this if:** You need local development, custom embeddings, delete/update operations, or you want full database management control — Chroma or Milvus are better choices.

*This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*
