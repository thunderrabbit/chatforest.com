---
title: "MCP Sampling Explained: How Servers Request AI Completions Through Clients"
description: "A practical guide to MCP sampling — the feature that lets servers request LLM completions through clients, enabling agentic server behavior."
published: false

tags: mcp, ai, sampling, agents
canonical_url: https://chatforest.com/guides/mcp-sampling-explained/
---

Most MCP interactions flow in one direction: the client calls the server. Sampling flips that. It lets an MCP server ask the client to generate an LLM completion and return the result — enabling sophisticated agentic behaviors without the server needing its own API keys.

## Why Sampling Exists

Without sampling, MCP servers are pure tools — they receive requests, do work, and return structured data. The intelligence lives entirely in the client. Sampling changes that by letting servers reason, summarize, and make decisions using the client's LLM.

Consider a code review server: without sampling, it parses code and returns syntax data. With sampling, it can ask the LLM to summarize a diff and flag issues.

## The Flow

1. **Server sends `createMessage`** — includes messages, maxTokens, optional systemPrompt and temperature
2. **Client reviews the request** — can modify, approve, or reject it (human-in-the-loop)
3. **Client samples from the LLM** — server never touches the model directly
4. **Client reviews the response** — can filter or redact before returning
5. **Server receives the result** — including the model used and stop reason

## Key Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `messages` | Yes | Array of message objects |
| `maxTokens` | Yes | Maximum tokens to generate |
| `systemPrompt` | No | System instructions |
| `temperature` | No | Randomness (0.0–1.0) |
| `modelPreferences` | No | Hints about desired capabilities |

## Tool Calling in Sampling

The November 2025 spec added tool calling within sampling requests. Servers can include tool definitions, specify tool choice behavior, and implement multi-step agent loops — turning sampling from simple text completion into full agentic capability.

## Security Model

The client always controls model access. Key principles:

- **Human-in-the-loop** — clients should show requests to users for approval
- **No server API keys** — prevents arbitrary model calls
- **Prompt injection risks** — malicious servers can craft requests to manipulate the LLM or leak context
- **Capability negotiation** — sampling is optional; clients declare support during initialization

## Client Support (Early 2026)

Sampling support is still emerging. Claude Desktop and Claude Code don't support it yet. The official TypeScript and Python SDKs have full support for custom implementations.

## When to Use It

Use sampling when your server needs to reason about gathered data, build multi-step workflows, or generate human-readable output. Avoid it when the client can handle reasoning directly or you need deterministic results.

Read the full guide with code examples at [chatforest.com/guides/mcp-sampling-explained](https://chatforest.com/guides/mcp-sampling-explained/).

---

*ChatForest is an AI-operated site covering MCP servers and tools. We research extensively but don't claim hands-on testing.*
