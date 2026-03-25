---
title: "Image Generation MCP Servers — DALL-E, Stable Diffusion, ComfyUI, Flux, Midjourney & 50+ More"
description: "Image generation MCP servers: ComfyUI (224 stars, 18+ tools), Stability AI (81 stars, 11 tools), fal.ai (600+ models), Gemini (82 stars), Replicate (93 stars), Flux, Midjourney via proxies. 50+ servers across 12 subcategories. Rating: 4.0/5."
published: true
slug: image-generation-mcp-servers-review
tags: mcp, ai, imagegeneration, stablediffusion
canonical_url: https://chatforest.com/reviews/image-generation-mcp-servers/
---

**At a glance:** 50+ MCP servers across 12 subcategories covering every major generation platform except Adobe Firefly. ComfyUI leads with workflow-based generation (224 stars, 18+ tools). Stability AI has the most polished API wrapper (81 stars, 11 chainable tools). fal.ai provides the broadest model access (600+ models). Midjourney works through unofficial API proxies. **Rating: 4.0/5.**

## ComfyUI — Richest Integration

[joenorton/comfyui-mcp-server](https://github.com/joenorton/comfyui-mcp-server) (224 stars, Python, Apache 2.0, 18+ tools). Auto-discovers ComfyUI workflows and exposes them as MCP tools. Iterative refinement lets agents generate, evaluate, and regenerate with adjusted parameters. Streamable HTTP transport.

Also: **shawnrushefsky/comfyui-mcp** (40+ tools, 70+ workflows, images/video/audio/3D), **artokun/comfyui-mcp** (31 tools, 3 autonomous agents, SQLite tracking).

## Stability AI — Most Polished API Wrapper

[tadasant/mcp-server-stability-ai](https://github.com/tadasant/mcp-server-stability-ai) (81 stars, TypeScript, MIT, 11 tools). Generate, edit, upscale, remove background, outpaint, search-and-replace, control (sketch/style/structure), relighting. All tools chainable in a single conversation. Cloud API — no local GPU needed.

## DALL-E / OpenAI

[spartanz51/imagegen-mcp](https://github.com/spartanz51/imagegen-mcp) (33 stars) — DALL-E 2, DALL-E 3, and gpt-image-1 with txt2img and img2img. **jacwu** bridges Azure OpenAI for enterprise compliance. 6 servers total in the subcategory.

## Flux

[jmanhype/mcp-flux-studio](https://github.com/jmanhype/mcp-flux-studio) (24 stars, 4 tools) — Flux 1.1 Pro/Ultra/Dev, txt2img, img2img, inpaint, structural controls (canny/depth/pose). **tehw0lf/flux-mcp** runs locally on 12GB+ GPUs with smart VRAM management — zero API costs.

## Google Gemini / Imagen

[shinpr/mcp-image](https://github.com/shinpr/mcp-image) (82 stars) — auto prompt optimization, 3 quality tiers, up to 4K, character consistency. **lansespirit/image-gen-mcp** (51 stars) — multi-provider with gpt-image-1 + Imagen-4/3, 10+ prompt templates, STDIO/HTTP/SSE.

## fal.ai — Broadest Model Access

[raveenb/fal-mcp-server](https://github.com/raveenb/fal-mcp-server) (38 stars, 18 tools) — 600+ models spanning images, video, and audio. Dynamic model discovery, cost tracking. **am0y/mcp-fal** (76 stars) — model search/discovery, async execution, queue management.

## Midjourney — Fragile Proxies

No official API. All 3 servers use unofficial API proxies (GPTNB, AceDataCloud). **z23cc/midjourney-mcp** (9 stars, 7 tools) — generation, upscale, variations, zoom, pan, inpainting, face-swap. Can break if Midjourney changes their Discord infrastructure.

## Replicate & Multi-Provider

- **deepfates/mcp-replicate** (93 stars) — no longer maintained; Replicate now offers official MCP
- **apinetwork/piapi-mcp-server** (68 stars) — Midjourney, Flux, Kling, Luma, Suno, Trellis (3D) in one server
- **writingmate/imagegen-mcp** — 6 model families (OpenAI, Gemini, Flux, Qwen, SeedDream-4) in one server

## What's Missing

- **Adobe Firefly** — no MCP server exists
- **Canva AI** — no image generation MCP integration
- **Dedicated inpainting/outpainting** — limited outside ComfyUI
- **Image-to-3D pipelines** — PiAPI's Trellis is the only option
- **Cost comparison tools** — no cross-provider pricing optimization

## The Bottom Line

Surprisingly mature ecosystem. **Local generation:** ComfyUI dominates. **API-based:** Stability AI is most polished; fal.ai has broadest catalog. **Cost-conscious:** Together AI or local Flux. **Quality-first:** Midjourney works but is fragile; Ideogram excels at text rendering.

**Rating: 4.0/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
