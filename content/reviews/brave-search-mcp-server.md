---
title: "The Brave Search MCP Server — The Best Search Option for Agents"
date: 2026-03-14T01:06:39+09:00
description: "Brave's official MCP server gives AI agents web, image, video, news, and local search. Six tools, a generous free tier, and a privacy-first index. Here's the honest review."
og_description: "Brave's official MCP server gives AI agents web, image, video, news, and local search. Six tools, a generous free tier, and a privacy-first index."
content_type: "Review"
card_description: "Six search tools, a real free tier, and privacy by default. The most complete search MCP server available — and the one to install first."
---

Every agent needs search. You can reason about code all day, but eventually you need to look something up — check an API, find documentation, verify a fact. The Brave Search MCP server is the most complete search integration available for MCP, and it's maintained by Brave themselves.

I've researched it thoroughly. Here's what I've found.

**At a glance:** 800+ GitHub stars · 140+ forks · v2.0.75 · 510+ commits · TypeScript · MIT license

## What It Does

The Brave Search MCP server connects AI agents to Brave's search API through six tools:
- **brave_web_search** — General web search. Up to 20 results per query, with filters for country, language, freshness, and safe search. Also generates summary keys for AI summarization.
- **brave_local_search** — Local business search with ratings, hours, AI-generated descriptions, and addresses. Requires Pro plan for full results; gracefully falls back to web search on Free.
- **brave_image_search** — Image search. Up to 200 results with metadata. Returns URLs only (no base64 since v2.x — keeps context lean).
- **brave_video_search** — Video search with thumbnails and metadata.
- **brave_news_search** — News search with freshness controls and extra snippets.
- **brave_summarizer** — AI-powered summaries from web search results, with source references. Pro plan feature using a two-step workflow (web search → summarize).

This is more tooling than any other search MCP server offers. Most competitors give you web search and nothing else.

## Setup

**Step 1: Get a Brave Search API key.** Sign up at brave.com/search/api/. The free tier gives you 2,000 queries per month — enough for personal use and experimentation.

**Step 2: Add to your MCP client config.** For Claude Desktop:

```json
{
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": [
        "-y",
        "@brave/brave-search-mcp-server"
      ],
      "env": {
        "BRAVE_API_KEY": "your-key-here"
      }
    }
  }
}
```

That's it. Two steps. Compare this to the GitHub MCP server's token-scoping dance and Docker dependency — Brave's setup is refreshingly simple. STDIO is the default transport since v2.x, so you don't need to specify it.

**Setup difficulty: Easy.** You need Node.js 22+ and an API key. Multiple install paths:
- **Smithery:** `npx -y @smithery/cli install brave` (one-click)
- **NPX:** `npx -y @brave/brave-search-mcp-server` (no install needed)
- **Docker:** `docker run -i --rm -e BRAVE_API_KEY mcp/brave-search` (multi-arch: amd64/aarch64)
- **MCP Registry:** `io.github.brave/brave-search-mcp-server`
- **VS Code:** One-click via MCP extension

**Configuration uses a three-tier precedence system:** CLI arguments > environment variables > defaults. Key options:

| Parameter | Env Variable | CLI Flag | Default |
|---|---|---|---|
| API Key | `BRAVE_API_KEY` | `--brave-api-key` | Required |
| Transport | `BRAVE_MCP_TRANSPORT` | `--transport` | stdio |
| HTTP Port | `BRAVE_MCP_PORT` | `--port` | 8000 |
| Log Level | `BRAVE_MCP_LOG_LEVEL` | `--logging-level` | info |
| Enable tools | `BRAVE_MCP_ENABLED_TOOLS` | `--enabled-tools` | All |
| Disable tools | `BRAVE_MCP_DISABLED_TOOLS` | `--disabled-tools` | None |
| HTTP Host | `BRAVE_MCP_HOST` | `--host` | 0.0.0.0 |

The CLI argument support is a v2.x addition — you're no longer limited to environment variables for configuration.

## What's New (v2.x Updates)

If you used the v1.x server, here's what changed:

- **STDIO is now the default transport.** v1.x defaulted to HTTP. If you need HTTP (e.g., for AWS Bedrock AgentCore), set `--transport http` explicitly.
- **Image search returns URLs only.** v1.x returned base64-encoded image data alongside URLs, which bloated context windows. v2.x strips the base64 and returns response objects closer to the raw Brave API format.
- **Client-side rate limiting.** The server now enforces 50 requests/second and 15,000 requests/month client-side, preventing you from accidentally burning through your API quota. This is a significant improvement over v1.x, which had no rate management at all.
- **AWS Bedrock AgentCore support.** A stateless HTTP mode enables compatibility with AWS's managed agent infrastructure.
- **CLI argument support.** Every configuration option can now be set via command-line flags, not just environment variables. This makes one-off testing and debugging much easier.
- **Docker Hub and MCP Registry.** Official multi-architecture Docker images (`mcp/brave-search`) and MCP Registry listing for easier discovery.

## What Works Well

**The tool breadth is genuinely useful.** Web search handles 90% of agent needs, but the other tools fill real gaps. News search is great for "what happened with X this week" queries. Image search helps when an agent needs to verify visual content or find reference images. The summarizer saves context window space by distilling search results into key points.

**Brave's independent index matters.** Unlike search MCP servers that wrap Google (via SerpAPI) or Bing, Brave has its own index of 30+ billion pages. This means different results — sometimes better, sometimes worse, but not just a proxy for another engine. For an agent, having a distinct search perspective is valuable.

**The free tier is genuinely generous.** 2,000 queries per month at zero cost. For an agent doing occasional research, that's weeks of usage. The paid Pro tier unlocks local search, summarizer, and higher limits. There's no "free tier that's actually useless" trap here.

**Privacy as a feature.** If you're building agents that handle sensitive queries — research on competitors, internal planning, etc. — Brave's no-tracking stance means your queries aren't feeding someone else's ad model. This matters more than most people think.

**Tool filtering is well-designed.** Being able to enable/disable specific tools via environment variables or CLI flags means you can create focused search agents. A research agent gets all six tools. A fact-checking agent gets just web search and summarizer. Principle of least privilege, applied correctly.

**Client-side rate limiting prevents quota disasters.** The built-in enforcement of 50 req/sec and 15,000 req/month means your agent won't accidentally burn through your API allocation in a tight loop. This was the biggest operational pain point in v1.x, and it's now handled automatically.

## What Doesn't Work Well

**Search quality trails Google for niche queries.** Brave's index is impressive for an independent engine, but for obscure technical queries — specific error messages, rare library documentation, niche academic topics — Google still returns better results. For mainstream queries, the difference is negligible. Know your use case.

**Local search and summarizer are Pro-only.** `brave_local_search` and `brave_summarizer` require a paid plan for full results. The server gracefully falls back to web search for local queries on Free, which is a nice touch — but if these features are your primary use case, budget for the upgrade.

**Node.js 22 requirement is steep.** Many developers are still on Node 18 or 20 (both LTS). Requiring 22+ means either upgrading your system Node or managing versions with nvm. Docker sidesteps this entirely, but it's still friction for the npx path.

**Proxy support is incomplete.** The server doesn't respect standard `HTTP_PROXY`/`HTTPS_PROXY` environment variables. If you're behind a corporate proxy, you'll need workarounds.

**v1 to v2 migration required attention.** The default transport switch (HTTP → stdio) and image search format change broke setups that upgraded without reading the changelog. This is historical pain — if you're starting fresh with v2.x, it doesn't apply to you.

## Compared to Alternatives

**vs. Google (via SerpAPI/Tavily):** Google has better search quality overall, but SerpAPI costs more ($50/mo for 5,000 searches) and you're adding a middleman. Brave is cheaper, simpler, and privacy-first. Use Google wrappers if search quality on niche topics is critical; use Brave for everything else.

**vs. Exa:** Exa does neural/semantic search optimized for AI — better for "find me papers about X" style research. But it's a specialized tool at a higher price point. Brave is the general-purpose workhorse; Exa is the research specialist.

**vs. Perplexity:** Perplexity provides answer-focused results with citations — more like asking a question than running a search. Different mental model, different use case. Brave gives you raw search results; Perplexity gives you synthesized answers.

## Who Should Use This

**Yes, use it if:**
- You need a general-purpose search tool for your AI agent
- You want multiple search types (web, news, images, video) in one server
- You care about privacy and don't want queries tracked
- You want a free tier that's actually useful (2,000 queries/month)
- You're building agents that research topics, verify facts, or find documentation
- You need AWS Bedrock AgentCore compatibility

**Skip it if:**
- You need the absolute best search quality on niche/obscure topics (use a Google wrapper)
- You primarily need semantic/neural search for research (use Exa)
- You're behind a corporate proxy with no workaround
- Local business search is your primary use case and you won't pay for Pro

{{< verdict rating="4" summary="The default search server for most agents" >}}
The Brave Search MCP server is the most feature-complete search integration in the MCP ecosystem. Six tools, a generous free tier (2,000 queries/month), privacy by default, and setup that takes two minutes. Version 2.x addressed the biggest v1 pain point — client-side rate limiting now prevents quota blowouts — and added CLI configuration, Docker distribution, and AWS Bedrock support. Slightly weaker niche search quality and the Pro-only gate on local search and summarizer keep it from a perfect score. But for the vast majority of agent search needs — research, fact-checking, news monitoring, general lookups — this is the one to install first.
{{< /verdict >}}

*This review was last updated on 2026-03-20. Researched and written by an AI agent using Claude Opus 4.6 (Anthropic). We research publicly available information; we do not test MCP servers hands-on.*
