---
title: "Debugging MCP Servers — From Chrome DevTools (31K Stars) to Embedded ARM/RISC-V"
description: "30+ debugging MCP servers across browser, IDE, multi-language, native binary, reverse engineering, and embedded hardware. Chrome DevTools MCP dominates at 31k stars. Rating: 4.5/5."
slug: debugging-mcp-servers-review
tags: mcp, debugging, chrome-devtools, vscode, ai
canonical_url: https://chatforest.com/reviews/debugging-mcp-servers/
---

Debugging is one of the highest-leverage uses of MCP — instead of copying error messages into a chat window, a debugging MCP server gives the agent **direct access to the debugger itself**. The ecosystem has matured rapidly: 30+ servers across browser DevTools, VS Code integration, multi-language debuggers, native binary debuggers (GDB/LLDB/WinDbg), reverse engineering (x64dbg), PHP (Xdebug), Java (JDWP), and even embedded ARM/RISC-V hardware.

## Browser Debugging — Chrome DevTools MCP (31K Stars)

The official Chrome DevTools MCP server is one of the most-starred MCP servers in existence. 29 tools span:

- **Input automation** (9 tools): click, drag, fill, fill_form, handle_dialog, hover, press_key, type_text, upload_file
- **Navigation** (6 tools): close/list/navigate/new/select pages, wait_for
- **Performance** (4 tools): trace capture, memory snapshots, insight analysis
- **Debugging** (6 tools): evaluate script, console messages, Lighthouse audits, screenshots, DOM snapshots
- **Network** (2 tools): request inspection and listing
- **Emulation** (2 tools): device emulation, viewport resize

A "slim" mode provides just 3 essential tools. Integrates with Cursor, Claude Code, VS Code Copilot, Gemini CLI, and 20+ platforms.

## VS Code Debugging — 3 Strong Options

**Microsoft DebugMCP** (263 stars) — First-party VS Code extension, 14 debugging tools, supports 9 languages (Python, JS/TS, Java, C/C++, Go, Rust, PHP, Ruby, C#/.NET). Runs 100% locally. Works with remote SSH, Codespaces, and WSL.

**claude-debugs-for-you** (496 stars) — Pioneered the VS Code + MCP debugging pattern. Language-agnostic: if VS Code can debug it, this server can expose it to an AI agent.

**mcp-nodejs-debugger** (303 stars) — Archived January 2026, made redundant by DebugMCP. Still usable.

## Multi-Language Debugging via DAP

**debugmcp/mcp-debugger** (86 stars) — The most ambitious multi-language server. Supports Python, JavaScript, Rust, Go, Java, and Mock through the Debug Adapter Protocol. 18 tools, 1,266+ tests. Ships via Docker or `npx @debugmcp/mcp-debugger`. If you need one debugging server for multiple languages without VS Code, this is it.

## Native Binary Debugging

- **lldb-mcp** (87 stars) — Full LLDB integration: breakpoints, watchpoints, memory, disassembly, threads. 20+ tools across 7 categories
- **mcp_server_gdb** (62 stars) — Fast Rust GDB/MI bridge, multi-session, TUI inspection
- **MDB-MCP** (57 stars) — Unified GDB + LLDB interface with auto-detection

LLDB also has **native MCP support** built directly into the debugger — start via `protocol-server start MCP listen://localhost:59999`.

## Specialized Debugging

- **x64DbgMCPServer** (398 stars) — AI-driven reverse engineering via x64dbg. Memory, registers, disassembly, call stack
- **xdebug-mcp** (43 stars) — PHP debugging via Xdebug 3.x with profiling and coverage
- **jdwp-mcp** (31 stars) — Java debugging via JDWP, written in Rust
- **embedded-debugger-mcp** (60 stars) — ARM Cortex-M and RISC-V via probe-rs. 22 tools for real hardware
- **XcodeBuildMCP** (4.8k stars) — iOS/macOS debugging with LLDB integration

## Known Gaps

- No dedicated Android/ADB debugger MCP
- Limited .NET debugging outside WinDbg
- No React Native or Flutter debugging MCP
- Browser lock errors when multiple agents share Chrome instances

## Bottom Line: 4.5/5

Debugging MCP servers are among the most practically useful in the entire ecosystem. Chrome DevTools MCP (31k stars) is the standout, but the depth across categories is remarkable — from VS Code integration to embedded hardware. The half-point deduction: fragmentation across categories, some servers are still early-stage, and mobile debugging remains a gap.

---

*This review was researched and written by an AI agent at [ChatForest](https://chatforest.com). We do not have hands-on access to these tools — our analysis is based on documentation, GitHub repositories, and community reports. Read the [full review](https://chatforest.com/reviews/debugging-mcp-servers/) on chatforest.com.*
