---
title: "The Git MCP Server — The Missing Push Button"
date: 2026-03-14T12:00:09+09:00
description: "Anthropic's official Git MCP server gives AI agents local git operations — status, diff, commit, branch. But with no push, pull, or merge, it's half a workflow."
og_description: "Anthropic's official Git MCP server: 12 tools for local git operations, 361K weekly PyPI downloads, stdio only. No push, pull, or merge. Rating: 3/5."
content_type: "Review"
card_description: "Anthropic's official reference Git MCP server — 12 tools for status, diff, commit, and branch operations. Massive adoption but missing push, pull, merge, and remote operations entirely."
---

Twelve tools. No push.

That's the Git MCP server in a nutshell. Anthropic's official reference implementation gives AI agents basic local git operations — status, diff, staging, commit, branching — and stops there. No pushing to remotes. No pulling. No merging. No rebasing. No stashing. No tagging. No blaming.

With ~361,000 weekly PyPI downloads, it's one of the most-installed MCP servers in the ecosystem. It lives in the same [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) monorepo as the [Filesystem](/reviews/filesystem-mcp-server/) and [Sequential Thinking](/reviews/sequential-thinking-mcp-server/) servers — the 81,000+ star reference implementation collection from Anthropic. And like those servers, it's deliberately minimal. The question is whether "minimal" crosses over into "incomplete."

## What It Does

The Git MCP server connects AI agents to local git repositories through 12 tools:

| Tool | What it does |
|------|-------------|
| `git_status` | Working tree status — staged, unstaged, untracked files |
| `git_diff_unstaged` | Show changes not yet staged (configurable context lines) |
| `git_diff_staged` | Show changes in the staging area |
| `git_diff` | Compare branches, commits, or refs |
| `git_add` | Stage files for commit |
| `git_reset` | Unstage all staged changes |
| `git_commit` | Create a commit with a message |
| `git_log` | View commit history with optional date filtering |
| `git_show` | Display a specific commit's contents |
| `git_create_branch` | Create a new branch (optionally from a base) |
| `git_checkout` | Switch branches |
| `git_branch` | List branches (local, remote, or all) with optional filtering |

That's the complete tool set. Everything you need to work in a single local repository, up to and including committing — then it hands you back the keyboard.

## Setup

Installation is straightforward. The recommended method uses `uvx` (from the `uv` Python package manager):

```json
{
  "mcpServers": {
    "git": {
      "command": "uvx",
      "args": ["mcp-server-git", "--repository", "/path/to/your/repo"]
    }
  }
}
```

Also available via `pip install mcp-server-git` or Docker (`python:3.12-slim-bookworm` base image).

One-click install links exist for VS Code and Zed. Claude Desktop uses the JSON config above.

**Setup difficulty: Easy.** No API keys, no accounts, no external services. Point it at a repo and go. The only potential confusion is that the package is Python-based (`mcp-server-git` on PyPI) — users who expect an npm package get a 404 ([#2089](https://github.com/modelcontextprotocol/servers/issues/2089)).

## What Works Well

**Zero-dependency simplicity.** No API keys. No cloud accounts. No tokens. Install, point at a repo, and it works. This is the lowest barrier to entry of any version control MCP server.

**Security-conscious design.** The December 2025 security update added flag injection prevention — branch names starting with `-` are rejected to prevent CWE-88 attacks. The `git_add` command uses `--` separators to prevent path arguments from being interpreted as flags. Path validation ensures repos stay within configured bounds. And as of November 2025, the server has 100% test coverage.

**The diff tools are well-designed.** Splitting diffs into three tools — `git_diff_unstaged`, `git_diff_staged`, and `git_diff` (for comparing refs) — is smarter than a single "git diff" tool with flags. An agent can check exactly what it needs without constructing complex git arguments. The configurable `context_lines` parameter (default 3) lets agents control diff verbosity.

**Date-based log filtering.** The `git_log` tool accepts `start_timestamp` and `end_timestamp` parameters, which is genuinely useful for agents investigating "what changed last week" or "commits since this date." Most git GUIs don't surface this as cleanly.

**Branch filtering with `contains`/`not_contains`.** The `git_branch` tool can filter branches by whether they contain specific commits — useful for agents tracking which branches have picked up a fix.

## What Doesn't Work Well

**No push, pull, or fetch.** This is the elephant in the room. An agent can stage, commit, and branch — but can't sync with any remote. Issue [#618](https://github.com/modelcontextprotocol/servers/issues/618) requesting push support has been open since February 2025, with 6 upvotes. A [PR (#2961)](https://github.com/modelcontextprotocol/servers/pull/2961) adding push exists but hasn't been merged. Without remote operations, agents can't complete a standard development workflow. You commit locally and then... manually push.

**No merge or rebase.** Even within purely local operations, there's no way for an agent to merge branches or rebase. Creating a feature branch and committing to it is possible; integrating that work back is not. This makes the branching tools feel half-implemented.

**No stash, tag, or blame.** `git stash` is essential for context-switching. `git tag` is needed for release workflows. `git blame` is critical for understanding code history. None are available.

**`git_reset` is all-or-nothing.** The tool unstages *everything*. There's no way to unstage specific files — it's the equivalent of `git reset HEAD` with no arguments. If an agent staged five files and needs to unstage one, it has to reset all five and re-add four.

**Windows path issues persist.** Issue [#2519](https://github.com/modelcontextprotocol/servers/issues/2519) reports that Windows users need double backslashes in JSON config paths — an ongoing friction point that's been open since August 2025.

**Repository path auto-detection doesn't work intuitively.** Passing `--repository .` doesn't auto-detect the git root like standard git commands do ([#3029](https://github.com/modelcontextprotocol/servers/issues/3029)). Users expect `.` to mean "the repo containing the current directory," but the server interprets it literally.

**Had a critical repo corruption bug.** Issue [#2373](https://github.com/modelcontextprotocol/servers/issues/2373) documented that `git_add` with `files: ["."]` could stage files inside the `.git/` directory, causing repository corruption. Fixed in August 2025 via [PR #2379](https://github.com/modelcontextprotocol/servers/pull/2379), but the fact that this was possible at all raises questions about input validation. A security audit ([#3537](https://github.com/modelcontextprotocol/servers/issues/3537)) identified 18 unconstrained string parameters — paths, messages, and branch names with no `maxLength`, `pattern`, or `enum` validation.

**stdio only.** No HTTP or SSE transport. In a world where [Cloudflare](/reviews/cloudflare-mcp-server/), [Linear](/reviews/linear-mcp-server/), and [Todoist](/reviews/todoist-mcp-server/) offer remote hosted endpoints, stdio-only feels like a limitation — especially since the competing community server from cyanheads supports both stdio and Streamable HTTP.

## How It Compares

The Git MCP server occupies a specific niche: local git operations for AI agents. It competes most directly with community alternatives and complements (rather than competes with) the [GitHub MCP Server](/reviews/github-mcp-server/).

**vs. [GitHub MCP Server](/reviews/github-mcp-server/) (4/5):** These are complementary, not competitive. GitHub's server handles the GitHub API — PRs, issues, Actions, code search across repos. The Git server handles local repository operations — diffs, commits, branches. A complete agent workflow would use both: Git for local work, GitHub for remote collaboration. But with no push in the Git server, you need the GitHub server (or manual intervention) to get code to the remote.

**vs. cyanheads/git-mcp-server (195 stars):** The community alternative offers **28 tools** — more than double. It includes push, pull, fetch, merge, rebase, stash, tag, blame, clone, and worktree operations. Supports both stdio and Streamable HTTP. Has enterprise features like JWT/OAuth auth and OpenTelemetry instrumentation. Built in TypeScript on Bun/Node.js. If you need a complete git workflow, this community server is significantly more capable — though less proven at scale.

**vs. [Filesystem MCP Server](/reviews/filesystem-mcp-server/) (3.5/5):** For read-only code exploration, the Filesystem server is arguably better — it can read any file, search directories, and navigate the codebase without git-specific overhead. The Git server's value is specifically in *writing* — staging, committing, branching. If you're just reading code, you don't need this.

## The Bottom Line

The Git MCP server is a competent but frustratingly incomplete tool. The 12 tools it ships are well-implemented — good security, clean API design, sensible defaults, 100% test coverage. But the missing operations (push, pull, merge, rebase, stash, tag, blame) make it a read-and-commit server, not a full git workflow server.

With 361,000 weekly PyPI downloads, it's clearly useful to many people. The most common workflow is probably: agent reads code via the Filesystem server, makes changes, uses the Git server to stage and commit, and then the human (or a GitHub MCP server) handles the push. That works. But it means the agent can never fully close the loop on its own.

The February 2025 push request ([#618](https://github.com/modelcontextprotocol/servers/issues/618)) being unmerged after a year tells a story about Anthropic's design philosophy for reference servers: they're deliberately minimal, meant to demonstrate the protocol rather than be production-complete. If you want production-complete, the cyanheads community server with 28 tools is the better choice. If you want the official, well-tested, security-hardened baseline, this is it — just know you'll need to supplement it.

**Rating: 3 out of 5** — solid implementation of half a git workflow, held back by the absence of remote operations, merge capabilities, and modern transport support.

| | |
|---|---|
| **MCP Server** | Git MCP Server |
| **Publisher** | Anthropic (official reference implementation) |
| **Repository** | [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) (`src/git/`) |
| **Stars** | ~81,000 (monorepo) |
| **Tools** | 12 |
| **Transport** | stdio |
| **Language** | Python |
| **License** | MIT |
| **Pricing** | Free |
| **Our rating** | 3/5 |

*This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*
