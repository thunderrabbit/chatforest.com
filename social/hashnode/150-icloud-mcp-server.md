---
title: "iCloud MCP Servers — No Official Apple Server, No iCloud Drive Access"
description: "iCloud MCP servers: no official Apple server, community implementations for Calendar, Mail, Contacts, and Reminders. No iCloud Drive access. Rating: 2.5/5."
published: true
slug: icloud-mcp-server-review
tags: mcp, icloud, apple, cloudstorage
canonical_url: https://chatforest.com/reviews/icloud-mcp-server/
---

**At a glance:** No official Apple MCP server. [supermemoryai/apple-mcp](https://github.com/supermemoryai/apple-mcp) (3,000 stars, **archived**) + [MrGo2/icloud-mcp](https://github.com/MrGo2/icloud-mcp) (5 stars, active). Calendar, Mail, Contacts, Reminders — but **no iCloud Drive file access**. **Rating: 2.5/5.**

## What It Does

Between archived and active community projects, iCloud MCP servers cover:

- **Calendar (CalDAV)** — list, create, update, delete, search events
- **Mail (IMAP/SMTP)** — read, send, search, organize messages
- **Contacts (CardDAV)** — full CRUD with phone, email, address fields
- **Reminders & Notes** — macOS only via AppleScript
- **macOS Native Apps** — Messages (send only), Safari, Maps via AppleScript

### The Critical Gap: No iCloud Drive

**No iCloud MCP server provides file storage access.** Google Drive, Dropbox, and OneDrive all have MCP file access. iCloud Drive requires Apple's CloudKit API — no community project has implemented it.

## Community Implementations

| Server | Stars | Status | Scope |
|--------|-------|--------|-------|
| supermemoryai/apple-mcp | 3,000 | **Archived** Jan 2026 | 7 macOS apps via AppleScript |
| MrGo2/icloud-mcp | 5 | Active | 31 local + 17 cloud tools |
| minagishl/icloud-mail-mcp | 4 | Active | Mail specialist, 14 tools |
| mike-tih/icloud-mcp | 2 | Active | CalDAV + CardDAV + IMAP |

## What's Good

- **Simplest auth in cloud storage** — app-specific passwords, no OAuth flows
- **apple-mcp reached 3K stars** — proved demand for Apple MCP integration
- **Cross-platform options** — CalDAV/CardDAV/IMAP work on Linux/Windows
- **Apple exploring MCP** — iOS/macOS 26.1 betas show early MCP support via App Intents

## What's Not

- **No iCloud Drive** — the feature most users associate with iCloud is inaccessible
- **Best server is archived** — apple-mcp gets no updates since Jan 2026
- **No official server** — Google, Dropbox, Microsoft all have official MCP servers; Apple doesn't
- **macOS dependency** — most capable implementations require macOS + AppleScript
- **Fragmented community** — outside archived apple-mcp, no server exceeds 5 stars
- **pyicloud broken** — Apple changed auth to SRP-6a, breaking the popular Python library

## The Bottom Line

The world's most valuable company with 850M+ iCloud users has the weakest MCP ecosystem of any major cloud storage provider. Community implementations cover calendar, mail, and contacts reasonably well, but the absence of iCloud Drive access is a dealbreaker for file-centric workflows. Wait for Apple's platform-level MCP support or use Google Drive/Dropbox/OneDrive instead.

**Rating: 2.5/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
