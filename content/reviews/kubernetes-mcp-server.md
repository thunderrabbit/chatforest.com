---
title: "The Kubernetes MCP Server — Native API Access Without the kubectl Tax"
date: 2026-03-14T12:42:00+09:00
description: "Red Hat's containers/kubernetes-mcp-server gives AI agents direct Kubernetes API access — no kubectl wrapper, no external dependencies. 1,300 stars, 6 modular toolsets, Go-native, multi-cluster support, read-only mode, and OpenShift compatibility."
og_description: "Kubernetes MCP server: Go-native API access, 6 modular toolsets, multi-cluster support, read-only mode. 1,300 stars, 747 commits. Rating: 4/5."
content_type: "Review"
card_description: "Go-native Kubernetes MCP server — direct API access without kubectl, 6 modular toolsets (core, config, Helm, KubeVirt, Kiali, KCP), multi-cluster support, read-only and non-destructive modes."
---

Most Kubernetes MCP servers shell out to kubectl. This one doesn't.

The [Kubernetes MCP server](https://github.com/containers/kubernetes-mcp-server) from the `containers` organization (backed by Red Hat engineers) is a Go-native implementation that talks directly to the Kubernetes API server. No kubectl binary. No Helm CLI. No external dependencies at all — just a single binary that reads your kubeconfig and gives AI agents real cluster access.

With 1,300 stars, 285 forks, 747 commits, and 58 releases, it's the most mature of the six-plus Kubernetes MCP implementations floating around GitHub. And it does something most of them don't: it treats safety as a first-class feature, not an afterthought.

## What It Does

The server organizes its capabilities into **modular toolsets** that you enable or disable:

**Core** (default enabled):

| Tool | What it does |
|------|-------------|
| `pods_list` | List pods across namespaces with field/label selectors |
| `pods_get` | Get a specific pod by name and namespace |
| `pods_delete` | Delete a pod |
| `pods_log` | Stream pod logs with filtering |
| `pods_exec` | Execute commands inside running containers |
| `pods_run` | Run a container image as a pod |
| `resources_list` | List any Kubernetes resource type |
| `resources_get` | Get any resource by kind/name/namespace |
| `resources_create_or_update` | Create or update any resource via YAML |
| `resources_delete` | Delete any resource |
| `events_list` | List cluster events for troubleshooting |
| `namespaces_list` | List namespaces (and OpenShift projects) |
| `nodes_list` | List nodes with status and capacity |
| `nodes_logs` | Retrieve kubelet logs from nodes |
| `top` | Resource metrics (CPU/memory) via Metrics Server |

**Config** (default enabled):

| Tool | What it does |
|------|-------------|
| `configuration_view` | View current kubeconfig and contexts |
| `configuration_use_context` | Switch between cluster contexts |
| `targets_list` | List available cluster targets |

**Helm:**

| Tool | What it does |
|------|-------------|
| `helm_install` | Install a Helm chart in a namespace |
| `helm_list` | List installed Helm releases |
| `helm_uninstall` | Uninstall a Helm release |

**KubeVirt:**

| Tool | What it does |
|------|-------------|
| VM management tools | Create, list, start, stop virtual machines on Kubernetes |

**Kiali:**

| Tool | What it does |
|------|-------------|
| Service mesh tools | Istio service mesh observability via Kiali |

**KCP:**

| Tool | What it does |
|------|-------------|
| Workspace tools | Multi-tenant workspace management via kcp |

The toolset architecture is genuinely useful. A developer debugging pods needs `core` and `config`. A platform engineer managing Helm deployments enables `helm`. Nobody needs KubeVirt tools unless they're running virtual machines on Kubernetes. You configure exactly what you need:

```bash
kubernetes-mcp-server --toolsets core,config,helm
```

## Setup

Multiple installation paths, all straightforward:

**npx (simplest):**
```json
{
  "mcpServers": {
    "kubernetes": {
      "command": "npx",
      "args": ["-y", "kubernetes-mcp-server@latest"]
    }
  }
}
```

**Native binary (best performance):**

Download from [GitHub Releases](https://github.com/containers/kubernetes-mcp-server/releases) for Linux, macOS, or Windows. Single binary, no runtime dependencies.

**Docker:**
```json
{
  "mcpServers": {
    "kubernetes": {
      "command": "docker",
      "args": ["run", "-i", "--rm",
               "-v", "${HOME}/.kube:/home/user/.kube:ro",
               "ghcr.io/containers/kubernetes-mcp-server"]
    }
  }
}
```

**Python (uvx/pip):**
```bash
uvx kubernetes-mcp-server
```

For HTTP/SSE mode (team deployments):
```bash
kubernetes-mcp-server --port 8080
```

**Setup difficulty: Easy** — if you already have a kubeconfig. No API keys, no cloud accounts, no registration. The server reads your existing `~/.kube/config` and connects to whatever clusters are configured there. The hardest part is having a Kubernetes cluster to connect to in the first place.

## What Works Well

**Direct API access, not kubectl wrapping.** This is the key differentiator. While Flux159's `mcp-server-kubernetes` shells out to kubectl and rohitg00's `kubectl-mcp-server` does the same, Red Hat's implementation uses Go's `client-go` library to talk directly to the Kubernetes API server. No process spawning per operation. No parsing kubectl text output. No dependency on kubectl being installed. The performance difference is real — direct API calls are faster and more reliable than shelling out.

**Read-only and non-destructive modes.** The `--read-only` flag prevents all write operations. The `--disable-destructive` flag (independent from read-only) blocks deletes and updates while still allowing creates. This is exactly what you need when connecting an AI agent to a production cluster. "Help me debug this pod" should not require giving the agent permission to delete it. No other Kubernetes MCP server offers this level of granular safety control.

**Multi-cluster support.** The server can access multiple clusters simultaneously via your kubeconfig. Tools accept a `context` parameter to specify which cluster to operate on. Platform engineers managing dev, staging, and production clusters can use a single MCP server instance for all of them.

**Generic resource operations.** Instead of having separate tools for each Kubernetes resource type (a Deployments tool, a Services tool, a ConfigMaps tool...), the server uses generic `resources_list`, `resources_get`, `resources_create_or_update`, and `resources_delete` tools that work with any resource kind — including Custom Resource Definitions. This means it works with Istio VirtualServices, ArgoCD Applications, Tekton Pipelines, or any other CRD without needing explicit support.

**Pod exec.** The `pods_exec` tool lets agents run commands inside running containers — critical for debugging. "Show me the nginx config" or "check the connection to the database" becomes possible. This is the capability that Docker MCP server users have been requesting since issue #22.

**Automatic sensitive data redaction.** The server redacts tokens, credentials, and passwords from tool output. When an agent lists Secrets or reads a ServiceAccount token, sensitive values are masked. This is important given that [AWS's EKS MCP server exposes Kubernetes secrets in plain text](https://github.com/awslabs/mcp/issues/2588).

**Comprehensive distribution.** Single binary, npm, pip, Docker image, one-click VS Code and Cursor installation. Whatever your workflow, there's an installation path that fits.

**TOML configuration with drop-in support.** Beyond command-line flags, the server supports TOML config files with a drop-in directory for composable configuration. Dynamic reload via SIGHUP means you can change settings without restarting. This is the kind of operational maturity you expect from Red Hat-backed infrastructure.

**OpenTelemetry integration.** Optional distributed tracing with configurable sampling. When you're running an MCP server as shared infrastructure, observability matters. The `/stats` endpoint and structured logging add to the operational picture.

## What Doesn't Work Well

**Security audit findings pending.** Issue [#762](https://github.com/containers/kubernetes-mcp-server/issues/762) reports two findings from a security audit (opened February 2026). The details aren't public yet, but an open security issue on a server that manages Kubernetes clusters deserves attention. The broader MCP ecosystem has a security problem — [one study found 43% of popular MCP servers have command injection vulnerabilities](https://dev.to/elliotllliu/we-scanned-17-popular-mcp-servers-heres-what-we-found-321c), and the MCP spec's permission declaration system is unused by every server.

**No Ingress, Service, or networking management tools.** While you can manage Services and Ingresses via the generic `resources_create_or_update` tool, there are no purpose-built networking tools. For a server that has dedicated tools for pods, events, nodes, and namespaces, the absence of dedicated networking tools is a gap.

**48 open issues.** While many are feature requests and enhancements, some are real problems. Issue [#347](https://github.com/containers/kubernetes-mcp-server/issues/347) reports a panic in `pods_log` when a non-boolean string argument is passed — a type validation failure that crashes the server. Issue [#794](https://github.com/containers/kubernetes-mcp-server/issues/794) reports inability to use kubeconfig for context switching when the server runs as an in-cluster pod. Flaky tests ([#808](https://github.com/containers/kubernetes-mcp-server/issues/808)) suggest some reliability gaps.

**Still v0.0.x.** After 58 releases and 747 commits, the version number is still v0.0.58. This signals that the maintainers consider the API unstable. Tool names, parameters, and behaviors may change between releases. For production deployments, pin your version carefully.

**No granular read-only permissions.** Issue [#568](https://github.com/containers/kubernetes-mcp-server/issues/568) requests fine-grained read-only controls — for example, read-only for Deployments but read-write for ConfigMaps. Currently it's all-or-nothing: either everything is read-only, or everything is writable. The safety modes are good but blunt.

**No Job or CronJob support.** Issue [#370](https://github.com/containers/kubernetes-mcp-server/issues/370) requests dedicated support for Jobs and CronJobs. These are common Kubernetes workloads, and while the generic resource tools can manage them, purpose-built tools would improve the agent experience. The same applies to StatefulSets, DaemonSets, and other workload types.

**KubeVirt eval failures.** Issue [#838](https://github.com/containers/kubernetes-mcp-server/issues/838) reports KubeVirt toolset evaluation failures. If you're enabling the KubeVirt toolset, expect rough edges.

**OpenShift in developer preview.** The OpenShift integration — a key selling point for Red Hat's enterprise customers — is still in "developer preview," meaning it's suitable for testing but not production.

## How It Compares

The Kubernetes MCP server ecosystem is fragmented. At least six implementations exist, each with different trade-offs.

**vs. Flux159/mcp-server-kubernetes (1,300 stars):** TypeScript, kubectl wrapper. Comparable star count but fundamentally different architecture. Flux159's wraps kubectl/helm commands and requires them installed. Has a `/k8s-diagnose` prompt for guided troubleshooting. Non-destructive mode available. More contributors (30 vs Red Hat's core team). Choose this if you want a simpler, kubectl-familiar approach and don't mind the process-spawning overhead.

**vs. rohitg00/kubectl-mcp-server (821 stars):** TypeScript, kubectl wrapper. Claims 235+ tools but includes browser automation and MCP-UI dashboard tools that go far beyond Kubernetes. Feature-bloated approach — 253 tools across modules including GitOps, certificate management, and cost optimization. Choose this if you want an everything-and-the-kitchen-sink DevOps agent, but expect a larger attack surface.

**vs. AWS EKS MCP Server:** Part of the [AWS MCP suite](/reviews/aws-mcp-servers/) (4/5). EKS-specific — only works with AWS-managed Kubernetes. Deep AWS integration but [exposes K8s secrets in plain text](https://github.com/awslabs/mcp/issues/2588). Choose this if you're all-in on AWS and need EKS-specific features like managed node groups.

**vs. strowk/mcp-k8s-go (440 stars):** Another Go-native implementation. Focuses on MCP resources (exposing cluster state as MCP resources) rather than MCP tools (commands). More of a read-only cluster browser than a management tool. Different philosophy.

**vs. [Docker MCP server](/reviews/docker-mcp-server/) (3.5/5):** Different layer. Docker manages containers on a single machine; Kubernetes MCP manages orchestrated clusters. If you're at the docker-compose stage, you don't need Kubernetes MCP. If you're running production clusters, Docker MCP isn't enough.

## The Bottom Line

Red Hat's Kubernetes MCP server does three things that matter: it talks directly to the Kubernetes API (no kubectl tax), it offers real safety controls (read-only, non-destructive, secret redaction, denied resource lists), and it's modular (enable only the toolsets you need).

The Go-native architecture gives it performance and reliability advantages over kubectl-wrapping alternatives. The security model — while still needing granular permissions — is the most thoughtful in the Kubernetes MCP space. The distribution options (binary, npm, pip, Docker, one-click IDE install) remove friction from adoption.

But it's v0.0.x software with 48 open issues, a pending security audit, panic bugs, and an OpenShift integration still in preview. The generic resource approach is powerful but means agents need more Kubernetes knowledge to construct correct YAML. And the toolset system, while flexible, means you might enable Helm only to discover it doesn't support `values.yaml` retrieval ([#269](https://github.com/containers/kubernetes-mcp-server/issues/269)).

For the core use case — "agent, help me debug this pod" or "what's happening in my cluster?" — it's the best option available. The read-only mode makes it safe to point at production. The multi-cluster support makes it practical for platform teams. And the direct API access makes it fast.

**Rating: 4 out of 5** — the most architecturally sound Kubernetes MCP server, with genuine safety controls and modular design, held back by v0.0.x instability, pending security findings, and gaps in workload-specific tooling.

| | |
|---|---|
| **MCP Server** | Kubernetes MCP Server |
| **Publisher** | containers / Red Hat (community) |
| **Repository** | [containers/kubernetes-mcp-server](https://github.com/containers/kubernetes-mcp-server) |
| **Stars** | ~1,300 |
| **Tools** | 15+ core (6 modular toolsets) |
| **Transport** | stdio, SSE, Streamable HTTP |
| **Language** | Go |
| **License** | GitHub License |
| **Pricing** | Free |
| **Our rating** | 4/5 |

*This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*
