---
title: "Infrastructure Automation MCP Servers — Ansible, Terraform, Pulumi, OpenTofu & Beyond"
description: "Infrastructure automation MCP servers: Terraform (1,300 stars, 35+ tools), Ansible (official AAP tech preview + community 40+ tools), Pulumi (Neo delegation), OpenTofu (77 stars), tfmcp (357 stars, Rust, full execution). 20+ servers. Rating: 4.0/5."
published: true
tags: mcp, ansible, terraform, devops
canonical_url: https://chatforest.com/reviews/infrastructure-automation-mcp-servers/
---

**At a glance:** Every major IaC platform except Chef, Puppet, and SaltStack has at least one MCP server. Terraform leads (1,300 stars, registry intelligence). Red Hat ships Ansible MCP as tech preview in AAP 2.6.4. Pulumi pushes the boundary with autonomous infrastructure via Neo delegation. **Rating: 4.0/5.**

## Terraform / HCP Terraform

[hashicorp/terraform-mcp-server](https://github.com/hashicorp/terraform-mcp-server) (1,300 stars, Go, 35+ tools). **Registry intelligence, not execution** — provider docs, module specs, Sentinel policies. HCP workspace management for platform users. Dual transport: stdio + StreamableHTTP.

**severity1/terraform-cloud-mcp** (23 stars, Python, 60+ tools) — full Terraform Cloud API coverage. Workspaces, runs, plans, applies, cost estimation. `safe_delete_workspace()` with explicit guard for destructive ops.

**nwiizo/tfmcp** (357 stars, Rust, 30+ tools) — full execution: init, plan, apply, destroy, state management, security scanning. The "give my AI agent full Terraform CLI access" option.

## Ansible — Broadest Ecosystem

**5 distinct options** spanning official, semi-official, and community:

- **Red Hat AAP MCP** (official, tech preview in AAP 2.6.4) — read-only or read-write modes, container image
- **Ansible Development Tools MCP** (tech preview) — Zen of Ansible, best practices, Lint auto-fixing, Navigator
- **bsahane/mcp-ansible** (25 stars, 35+ tools) — playbooks, inventory, vault, diagnostics, auto-heal
- **sibilleb/AAP-Enterprise-MCP-Server** (24 stars, 50+ tools) — AAP + Event-Driven Ansible
- **tarnover/mcp-sysoperator** (26 stars) — Ansible + Terraform + AWS in one server

## Pulumi — Autonomous Infrastructure

[pulumi/mcp-server](https://github.com/pulumi/mcp-server) (58 stars, TypeScript, 15+ tools). Local mode: registry + CLI preview/up. Remote mode: Pulumi Cloud features. **Neo delegation** — `neo-bridge` launches an autonomous AI agent for multi-step infrastructure tasks. Resource search via Lucene. OAuth auth.

## OpenTofu

[opentofu/opentofu-mcp-server](https://github.com/opentofu/opentofu-mcp-server) (77 stars, TypeScript, 5 tools). Registry access only. Hosted at `mcp.opentofu.org`. Compatible with most Terraform providers.

## Crossplane — Minimal

Two community servers, both very early stage. **vfarcic/crossplane-mcp** (1 tool, MVP). **cychiang/crossplane-mcp-server** (archived Sep 2025). No official server from Upbound.

## What's Missing

- **No Chef, Puppet, or SaltStack** — traditional config management has zero MCP presence
- **No CDK MCP server** — AWS CDK handled through broader AWS tooling only
- **No cross-IaC registry** — can't query Terraform + Pulumi + OpenTofu registries simultaneously
- **No drift detection MCP** — tfmcp's `analyze_state` comes closest
- **No Infracost MCP** — no real-time cost projection for IaC plans

## The Bottom Line

Strong official support from HashiCorp, Red Hat, and Pulumi. Terraform's registry-first design is the most mature. Red Hat's Ansible MCP tech preview brings enterprise automation to agents. Pulumi pushes the boundary with Neo delegation. Missing: Chef/Puppet/SaltStack, cross-platform tooling.

**Rating: 4.0/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
