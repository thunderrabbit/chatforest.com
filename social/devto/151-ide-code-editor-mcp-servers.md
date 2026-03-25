---
title: "IDE & Code Editor MCP Servers — Your Editor as an AI-Accessible Tool"
description: "IDE MCP servers: JetBrains built-in 24 tools, VS Code community 342 stars, Neovim 301 stars 19 tools. Your editor becomes an AI-accessible tool. Rating: 3.5/5."
published: true
tags: mcp, ide, vscode, jetbrains
canonical_url: https://chatforest.com/reviews/ide-code-editor-mcp-servers/
---

**At a glance:** Most IDEs are MCP *clients*. A growing ecosystem flips this: **IDEs as MCP servers**, exposing editor capabilities to external AI agents. JetBrains built-in (24 tools), VS Code community ([juehang](https://github.com/juehang/vscode-mcp-server) 342 stars, 15 tools), Neovim ([mcp-neovim-server](https://github.com/bigcodegen/mcp-neovim-server) 301 stars, 19 tools). **Rating: 3.5/5.**

## What's Available

### JetBrains — Built-in MCP Server (2025.2+)

24 tools across all IntelliJ-based IDEs (IntelliJ, PyCharm, WebStorm, GoLand, Android Studio):

- **Code Analysis** — `get_file_problems` runs the full IntelliJ inspection engine
- **Semantic Refactoring** — `rename_refactoring` does project-wide semantic renames
- **Project & Files** — dependency info, module listing, glob search, directory trees
- **Execution** — run configurations, terminal commands
- **Auto-config** for Claude Desktop, Cursor, Codex, VS Code, Windsurf

### VS Code — Community Extensions

- **juehang/vscode-mcp-server** (342 stars, 15 tools) — file ops, LSP-powered symbol search, diagnostics, shell
- **acomagu/vscode-as-mcp-server** (113 stars, 13 tools) — **debug session management** (unique), VS Code command palette access

### Neovim — mcp-neovim-server (301 stars, 19 tools)

Vim-native operations: buffers, marks, registers, macros, folds, visual mode, window/tab management. The most editor-specific MCP server — exposes concepts that only exist in Neovim.

## Client vs. Server — The Key Distinction

| IDE/Editor | MCP Client? | MCP Server? |
|------------|-------------|-------------|
| **JetBrains** | Yes | **Yes (built-in, 24 tools)** |
| **VS Code** | Yes | Community (342 + 113 stars) |
| **Neovim** | Yes | Community (301 stars) |
| **Cursor** | Yes | No |
| **Windsurf** | Yes | No |
| **Zed** | Yes (experimental) | No |

## What's Good

- **JetBrains' depth** — full IDE inspections and semantic refactoring via MCP, no extension needed
- **IDE intelligence > file reading** — code analysis from an IDE engine beats what standalone AI agents derive from raw files
- **Growing category** — three major editors covered with active development
- **Multi-agent workflows** — connect Claude Desktop to your IDE for editor context it wouldn't otherwise have

## What's Not

- **Requires running IDE** — no headless/CI usage, only works on developer workstations
- **Shallow refactoring** — only rename available, no Extract Method, Move Class, etc.
- **VS Code gap** — 75.9% market share but only 342 stars for its best MCP server
- **No cross-editor standard** — each server is editor-specific
- **Security risk** — all servers expose some form of command execution
- **Debug underdeveloped** — only one VS Code extension (113 stars) offers debug session management

## The Bottom Line

IDE MCP servers are strategically important but early-stage. JetBrains leads with the only built-in implementation offering genuine IDE intelligence (code analysis, semantic refactoring). VS Code and Neovim have capable community options. The concept is powerful — AI agents using your editor's code intelligence rather than just reading files — but tool coverage remains shallow.

**Rating: 3.5/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
