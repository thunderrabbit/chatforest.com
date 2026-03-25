---
title: "Infrastructure as Code MCP Servers — Terraform, Pulumi, AWS, OpenTofu, Spacelift"
description: "IaC MCP servers: Terraform (1.3K stars, Go, Registry + HCP), Pulumi (remote MCP, Neo delegation), AWS IaC (CloudFormation + CDK validation), OpenTofu (84 stars), Spacelift Intent (121 stars, codeless provisioning). Rating: 4/5."
published: true
tags: mcp, terraform, infrastructure, devops
canonical_url: https://chatforest.com/reviews/infrastructure-as-code-mcp-servers/
---

**At a glance:** IaC vendors are building AI-native infrastructure workflows. Terraform MCP leads (1.3K stars, Registry + HCP workspace management). Pulumi offers AI-to-AI delegation via Neo. AWS bundles CloudFormation + CDK validation. Spacelift Intent provisions cloud resources from natural language without generating IaC code. **Rating: 4/5.**

## Terraform — Ecosystem Leader

[hashicorp/terraform-mcp-server](https://github.com/hashicorp/terraform-mcp-server) (1,300 stars, Go, MPL-2.0). Registry lookups (providers, modules, policies) + HCP Terraform/Enterprise workspace management (listing, runs, variables). Deliberate choice: **no `terraform apply`** — it provides registry intelligence, not execution. Dual transport (stdio + StreamableHTTP). Tool filtering via `--toolsets` and `--tools`.

Platform operations require HCP Terraform/Enterprise. CLI-only users get Registry lookups only.

## Pulumi — AI-to-AI Delegation

[Pulumi MCP](https://www.pulumi.com/docs/ai/mcp-server/) (remote at `mcp.ai.pulumi.com/mcp`, local npm package). 15+ tools. **Neo delegation** is architecturally unique — `neo-bridge` delegates infrastructure tasks to Pulumi's autonomous agent. Resource search across all stacks via Lucene query syntax. OAuth authentication.

Remote-first means cloud dependency. Neo is Pulumi Cloud-only.

## AWS IaC — Validation Leader

Part of [awslabs/mcp](https://github.com/awslabs/mcp) (8,500 stars monorepo). **The only IaC MCP server that validates templates** — cfn-lint for syntax, cfn-guard for compliance, CloudTrail troubleshooting for stack failures. CDK support across 5 languages. AWS-only — no multi-cloud.

## OpenTofu — Open Source Alternative

[opentofu/opentofu-mcp-server](https://github.com/opentofu/opentofu-mcp-server) (84 stars, TypeScript, MPL-2.0). Registry search for providers/modules/resources/data sources. Hosted at `mcp.opentofu.org` or local via npx. Registry-only — no workspace management or platform integration.

## Spacelift Intent — Codeless Provisioning

[spacelift-io/spacelift-intent](https://github.com/spacelift-io/spacelift-intent) (121 stars, Go, Apache 2.0, 18 tools). Translates natural language directly into provider API calls — skips code generation entirely. SQLite state tracking, drift detection, dependency management. Uses same Terraform providers. Open-source lacks governance gates — commercial platform adds OPA policy-as-code.

**Warning:** February 2026 incident where an AI agent ran `terraform destroy` and deleted 2.5 years of production data highlights the risk.

## Ansible — Broadest Tool Count

- **Red Hat AAP MCP** (official, tech preview in AAP 2.6.4) — read-only or read-write modes
- **bsahane/mcp-ansible** (25 stars, 40+ tools) — playbooks, inventory, vault, diagnostics, auto-healing
- **sibilleb/AAP-Enterprise-MCP-Server** (24 stars, 50+ tools) — AAP + Event-Driven Ansible

## Known Issues

1. **AI-driven destruction is proven** — the February 2026 incident is a warning
2. **Most servers are documentation-only** — no plan/apply/state inspection
3. **No standard for IaC data in MCP** — each server returns its own format
4. **State file security** — sensitive data (IPs, connection strings) exposed to LLMs
5. **Missing vendors** — no Chef, Puppet, SaltStack, Bicep, CDKTF, Packer

## The Bottom Line

Strong multi-vendor investment: 5+ official servers from major IaC players. Terraform leads on community adoption, Pulumi on innovation (Neo delegation), AWS on validation. The category loses points for proven destruction risk, most servers being documentation-only, and missing vendors.

**Rating: 4/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
