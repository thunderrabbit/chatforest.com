---
title: "Presentation & Slides MCP Servers — PowerPoint, Google Slides, Marp, Reveal.js, SlideSpeak, and More"
date: 2026-03-16T15:30:00+09:00
description: "Presentation and slides MCP servers are turning AI agents into slide-deck creators — generating PowerPoint files, controlling Google Slides, building Markdown presentations, and automating professional layouts via the Model Context Protocol. We reviewed 15+ servers across 4 subcategories. PowerPoint/PPTX Generation: GongRzhe/Office-PowerPoint-MCP-Server (1,600 stars, Python — 34 tools across 11 modules, the most comprehensive presentation MCP server with templates, charts, themes, picture effects, font analysis), supercurses/powerpoint (144 stars, MIT, Python — AI-generated images via TogetherAI, 10 tools, the original PowerPoint MCP), ltc6539/mcp-ppt (65 stars, Python — SVG integration with PNG conversion, unique ID tracking, outline generation), Ichigo3766/powerpoint-mcp (51 stars, MIT, Python — fork of supercurses with Stable Diffusion image generation), socamalo/PPT_MCP_Server (42 stars, MIT, Python — Windows-only via COM/pywin32, controls live PowerPoint application). Google Slides: matteoantoci/google-slides-mcp (157 stars, TypeScript — OAuth 2.0, 5 tools including batch updates and presentation summarization). Markdown-Based Slides: masaki39/marp-mcp (5 stars, MIT, TypeScript — 5 tools, 4 themes, 5 style presets, Claude Code skill integration), bsmnyk/mdslides-mcp-server (6 stars, MIT, Python — Reveal.js HTML slides from Markdown, 12 themes, Docker support). Commercial/SaaS: SlideSpeak/slidespeak-mcp (12 stars, Python — API-powered presentation generation, Docker deployment, professional templates). Gaps: no Keynote automation, no Canva integration, no Figma Slides, no Prezi, no collaborative editing, no real-time co-authoring, no template marketplace access, no presentation analytics, no slide-to-video conversion, no accessibility checking, no brand compliance tools. 15+ servers across 4 subcategories. Rating: 3.5/5."
og_description: "Presentation & Slides MCP servers: Office-PowerPoint-MCP-Server (1,600 stars — 34 tools, templates, charts, themes), google-slides-mcp (157 stars — OAuth 2.0, batch updates), supercurses/powerpoint (144 stars — AI images via TogetherAI), mcp-ppt (65 stars — SVG integration), Marp MCP (Markdown slides), SlideSpeak (API-powered). 15+ servers reviewed. Rating: 3.5/5."
content_type: "Review"
card_description: "Presentation and slides MCP servers for AI-powered slide deck creation, PowerPoint automation, Google Slides control, and Markdown presentation generation. **Office-PowerPoint-MCP-Server dominates the category** — GongRzhe/Office-PowerPoint-MCP-Server (1,600 stars, Python) is the most comprehensive presentation MCP server with 34 tools organized into 11 modules. Version 2.0 covers presentation management, content creation, template operations, structural elements, professional design, and specialized features. It includes 25 built-in slide templates with dynamic sizing, 4 professional color schemes (Modern Blue, Corporate Gray, Elegant Green, Warm Red), gradient backgrounds, 20+ auto shape types, chart support (column, bar, line, pie), table creation with advanced cell formatting, and 9 picture effects. Font analysis and optimization via FontTools rounds out the feature set. For quick PowerPoint generation with AI-generated images, **supercurses/powerpoint** (144 stars, MIT, Python) is the original PowerPoint MCP — 10 tools covering title slides, section headers, content slides, tables, charts, and picture slides with captions. Images are generated via TogetherAI API. Ichigo3766/powerpoint-mcp (51 stars, MIT) forks this with Stable Diffusion support via ForgeUI/Automatic-1111 for local image generation. **ltc6539/mcp-ppt** (65 stars, Python) takes a different approach with SVG integration — generates SVG graphics and auto-converts to PNG for embedding. Includes unique presentation ID tracking, outline generation, base64 export, and 6 slide types (title, content, section, image, table). **socamalo/PPT_MCP_Server** (42 stars, MIT, Python) is the only server that controls a live PowerPoint application via Windows COM/pywin32 — create, open, save, close presentations and manipulate slides in real-time. Windows-only with PowerPoint required. **Google Slides gets proper coverage** — matteoantoci/google-slides-mcp (157 stars, TypeScript) provides full Google Slides API access with OAuth 2.0 authentication. 5 tools: create presentations, retrieve metadata, batch update (text, shapes, images, new slides), get individual slide details, and summarize all text content including speaker notes. Requires Google Cloud Project credentials. **Markdown-based presentation tools offer developer-friendly alternatives** — masaki39/marp-mcp (5 stars, MIT, TypeScript) integrates with the Marp ecosystem (10,600 stars) for creating Markdown-to-slide presentations. 5 tools for listing layouts, generating slide IDs, managing slides (insert/replace/delete), setting frontmatter, and reading content. Supports 4 themes (default, Gaia, Uncover, Academic) and 5 style presets (rich, minimal, dark, corporate, academic). Includes Claude Code skill integration via `/marp` command. bsmnyk/mdslides-mcp-server (6 stars, MIT, Python) generates Reveal.js HTML slides from Markdown with 12 themes (black, white, league, beige, night, serif, simple, solarized, moon, dracula, sky, blood) and configurable syntax highlighting via highlight.js. Docker deployment support. **SlideSpeak provides a commercial SaaS option** — SlideSpeak/slidespeak-mcp (12 stars, Python) connects to the SlideSpeak API for professional presentation generation. Supports Docker, Node.js, and direct Python deployment. API key required. Best for teams wanting polished output without local tooling. **Major gaps remain in the ecosystem** — no Keynote automation (AppleScript potential unexplored), no Canva API integration, no Figma Slides support, no Prezi, no collaborative real-time editing, no template marketplace access (Envato, SlidesCarnival), no presentation analytics or audience engagement tools, no slide-to-video conversion, no accessibility checking (WCAG compliance for presentations), no brand compliance enforcement, and no presenter tools (teleprompter, timer, audience Q&A). The category earns 3.5/5 — PowerPoint generation is genuinely strong with the 1,600-star server offering 34 tools and professional design features. Google Slides has solid coverage. Markdown alternatives give developers a code-first approach. But the ecosystem is heavily skewed toward PPTX creation — there's little support for the broader presentation lifecycle of design, collaboration, delivery, and analytics."
---

Presentation and slides MCP servers let AI assistants create slide decks, generate PowerPoint files, control Google Slides, and build Markdown-based presentations. Instead of manually designing layouts, formatting text, and placing images, you can have AI agents produce complete presentations through the Model Context Protocol.

This review covers the **presentation and slides** vertical — PowerPoint generation, Google Slides integration, Markdown slide frameworks, and commercial presentation APIs. For document creation more broadly, see our [PDF & Document review](/reviews/pdf-document-mcp-servers/). For design tools, see our [Design & Creative review](/reviews/design-creative-mcp-servers/).

The headline findings: **Office-PowerPoint-MCP-Server has 1,600 stars** and 34 tools — the most comprehensive presentation MCP server. **google-slides-mcp provides full Google Slides API access** with OAuth 2.0. **Marp MCP brings Markdown-to-slides** with developer-friendly tooling. **The ecosystem is heavily PPTX-focused** — Keynote, Canva, and Figma Slides have no MCP representation.

## PowerPoint / PPTX Generation

### GongRzhe/Office-PowerPoint-MCP-Server (Most Comprehensive)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [Office-PowerPoint-MCP-Server](https://github.com/GongRzhe/Office-PowerPoint-MCP-Server) | 1,600 | Python | — | 34 |

The **most starred and feature-rich presentation MCP server** — version 2.0 organizes 34 tools into 11 specialized modules:

- **Presentation Management** (7 tools) — create, open, save, list slides, get slide info, set slide size, add notes
- **Content Management** (8 tools) — add text, images, shapes, tables, charts with full formatting control
- **Template Operations** (7 tools) — 25 built-in slide templates with dynamic sizing, template search across configurable directories
- **Professional Design** (3 tools) — 4 color schemes (Modern Blue, Corporate Gray, Elegant Green, Warm Red), gradient backgrounds with customizable directions, theme application across presentations
- **Specialized Features** (5 tools) — 9 picture effects, font analysis via FontTools, comprehensive validation with automatic error fixing

Supports 20+ auto shape types, chart types (column, bar, line, pie) with data series management, and advanced table formatting. Built on python-pptx.

### supercurses/powerpoint (The Original)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [powerpoint](https://github.com/supercurses/powerpoint) | 144 | Python | MIT | 10 |

The **original PowerPoint MCP server** that launched the category — 10 tools for complete presentation creation:

- **create-presentation** — initialize a new presentation
- **add-slide-title-only** / **add-slide-section-header** / **add-slide-title-content** — different slide layouts
- **add-slide-title-with-table** — dynamically generated tables
- **add-slide-title-with-chart** — auto-formatted charts
- **add-slide-picture-with-caption** — images with AI-generated visuals via TogetherAI API
- **open-presentation** / **save-presentation** — edit existing PPTX files

Requires a TogetherAI API key for image generation. Clean, focused design — does one thing well.

### Ichigo3766/powerpoint-mcp (Stable Diffusion Fork)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [powerpoint-mcp](https://github.com/Ichigo3766/powerpoint-mcp) | 51 | Python | MIT | 10 |

Fork of supercurses/powerpoint with **local image generation** — replaces TogetherAI with Stable Diffusion via ForgeUI/Automatic-1111 API. Same 10 tools plus a `generate-and-save-image` tool. Useful if you want image generation without cloud API costs.

### ltc6539/mcp-ppt (SVG Integration)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [mcp-ppt](https://github.com/ltc6539/mcp-ppt) | 65 | Python | — | 14 |

Takes a different approach with **SVG graphics integration** — generates SVG elements and auto-converts to PNG for embedding in slides:

- 6 slide types — title, content, section, image, table
- Unique presentation ID tracking for multi-deck workflows
- Outline generation and metadata retrieval
- Base64 export for programmatic consumption
- Slide removal and reordering

Good for workflows where you need vector graphics or diagram-heavy presentations.

### socamalo/PPT_MCP_Server (Live PowerPoint Control)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [PPT_MCP_Server](https://github.com/socamalo/PPT_MCP_Server) | 42 | Python | MIT | ~8 |

The **only server that controls a live PowerPoint application** — uses Windows COM API via pywin32 to interact with Microsoft PowerPoint directly:

- Create, open, save, close presentations
- Add slides with different layouts
- Insert text boxes and update content
- Set slide titles

**Windows-only** with PowerPoint installed. Best for scenarios where you need to manipulate an existing PowerPoint instance rather than generate PPTX files programmatically.

## Google Slides

### matteoantoci/google-slides-mcp (Full API Access)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [google-slides-mcp](https://github.com/matteoantoci/google-slides-mcp) | 157 | TypeScript | — | 5 |

The **primary Google Slides MCP server** — full API access with OAuth 2.0 authentication:

- **create_presentation** — new slide decks with custom titles
- **get_presentation** — retrieve metadata and content
- **batch_update_presentation** — apply multiple modifications (text, shapes, images, new slides)
- **get_page** — individual slide details
- **summarize_presentation** — extract all text content, optionally including speaker notes

Requires Google Cloud Project credentials with OAuth 2.0 Client ID/Secret. Node.js v18+. Works with Claude Desktop, Cursor, and VSCode via Cline.

## Markdown-Based Slides

### masaki39/marp-mcp (Marp Ecosystem)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [marp-mcp](https://github.com/masaki39/marp-mcp) | 5 | TypeScript | MIT | 5 |

Integrates with the **Marp Markdown presentation ecosystem** (10,600 stars on the main Marp repo) — create professional slides from Markdown:

- **list_layouts** — display available slide layouts with parameters
- **generate_slide_ids** — create identifiers for all slides
- **manage_slide** — insert, replace, delete operations
- **set_frontmatter** — YAML frontmatter configuration
- **read_slide** — retrieve content by ID or list all

4 themes (default, Gaia, Uncover, Academic) and 5 style presets (rich, minimal, dark, corporate, academic). Includes Claude Code skill integration via `/marp` command. Best for developers who prefer code-first presentation workflows.

### bsmnyk/mdslides-mcp-server (Reveal.js)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [mdslides-mcp-server](https://github.com/bsmnyk/mdslides-mcp-server) | 6 | Python | MIT | ~3 |

Generates **Reveal.js HTML presentations** from Markdown content:

- 12 visual themes — black, white, league, beige, night, serif, simple, solarized, moon, dracula, sky, blood
- Configurable code syntax highlighting via highlight.js
- Reveal.js customization options
- Docker containerization support
- Clean temporary file handling

Uses the mkslides library under the hood. Good for web-based presentations and developer talks with code samples.

## Commercial / SaaS

### SlideSpeak/slidespeak-mcp (API-Powered)

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [slidespeak-mcp](https://github.com/SlideSpeak/slidespeak-mcp) | 12 | Python | — | ~3 |

Connects to the **SlideSpeak API** for professional presentation generation:

- API-based PowerPoint creation from text, documents, or structured data
- Customizable parameters (length, tone, style)
- Multiple deployment options — Docker, Node.js, direct Python
- Professional templates and polished output

Requires a SlideSpeak API key. Best for teams wanting high-quality output without managing local tooling or python-pptx complexity.

## What's missing

The ecosystem has significant gaps beyond PPTX generation:

- **No Keynote automation** — Apple's presentation tool has AppleScript support but no MCP server
- **No Canva integration** — Canva has an API, but no MCP server connects to it
- **No Figma Slides** — Figma's presentation features have no MCP representation
- **No Prezi** — dynamic, zooming presentations have no MCP coverage
- **No collaborative editing** — real-time co-authoring and commenting workflows
- **No template marketplaces** — Envato, SlidesCarnival, and other template sources
- **No presentation analytics** — view tracking, engagement metrics, audience feedback
- **No slide-to-video conversion** — turning presentations into video content
- **No accessibility checking** — WCAG compliance validation for presentations
- **No brand compliance** — enforcing corporate style guides and brand assets
- **No presenter tools** — teleprompter, timer, audience Q&A, live polling

## The bottom line

Presentation MCP servers earn **3.5 out of 5**. PowerPoint generation is genuinely strong — the 1,600-star Office-PowerPoint-MCP-Server offers 34 tools with professional design features, templates, charts, and picture effects. Google Slides has solid coverage with full API access. Markdown alternatives (Marp, Reveal.js) give developers a code-first approach to slide creation.

But the ecosystem is heavily skewed toward creating PPTX files from scratch. The broader presentation lifecycle — design iteration, collaboration, delivery, audience engagement, and analytics — has no MCP representation. If you need to generate slide decks programmatically, the tooling is ready. If you need to manage the full lifecycle of professional presentations, you're still doing most of the work manually.

*This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*
