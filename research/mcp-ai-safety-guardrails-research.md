# Research: MCP and AI Safety — Guardrails, Content Filtering, and Responsible AI Patterns

**Research Date:** 2026-03-28
**Purpose:** Comprehensive research for writing a technical guide on AI safety with MCP

---

## 1. MCP-Specific Safety Mechanisms

### Tool Annotations (Spec 2025-03-26+)

The MCP specification includes a `ToolAnnotations` interface that lets servers describe tool behavior:

- **`readOnlyHint`** (boolean) — Tool does not modify its environment
- **`destructiveHint`** (boolean) — Tool may perform destructive updates (only meaningful when readOnlyHint == false)
- **`idempotentHint`** (boolean) — Calling repeatedly with same args has no additional effect
- **`openWorldHint`** (boolean) — Tool interacts with external/open-world systems
- **`title`** — Human-readable display name

**Critical design point:** All properties are *hints* and are NOT guaranteed to faithfully describe tool behavior. Clients SHOULD NOT make safety decisions based on annotations from untrusted servers.

**Practical usage:** A tool marked `readOnlyHint: true` from a trusted server might be auto-approved, while `destructiveHint: true` triggers a confirmation dialog. This is the most common use of annotations today.

**Official blog post (2026-03-16):** "Tool Annotations as Risk Vocabulary: What Hints Can and Can't Do" — Notes that five independent SEPs have been filed proposing new annotations. A Tool Annotations Interest Group is forming.

- Source: https://blog.modelcontextprotocol.io/posts/2026-03-16-tool-annotations/
- Spec: https://modelcontextprotocol.io/specification/2025-06-18/schema

### Sampling (Human-in-the-Loop for LLM Requests)

MCP sampling allows servers to request LLM completions through the client, with mandatory human oversight:

1. **Request Approval:** Client shows user the exact prompt/context before sending to LLM — user can edit, approve, or reject
2. **Response Approval:** Client shows user the full LLM response — user can edit, approve, or reject before it returns to the server

Key benefit: Servers never need API keys; clients maintain full control over model access, selection, and permissions.

- Source: https://modelcontextprotocol.io/specification/2025-06-18/client/sampling

### Elicitation (Spec 2025-06-18)

Allows servers to request structured input from users mid-session:

- Servers send `elicitation/create` request with a message and JSON schema
- Supports form mode (structured fields) and URL mode (browser-based auth/approval)
- Only primitive types (string, number, boolean) supported
- **Security rule:** Servers MUST NOT request PII, credentials, or sensitive data through elicitation
- Clients SHOULD provide clear reject/cancel options

- Source: https://modelcontextprotocol.io/specification/2025-06-18/client/elicitation

### OAuth 2.1 Authorization (Spec 2025-06-18)

MCP mandates OAuth 2.1 for protected servers:

- Protected MCP servers act as OAuth 2.1 resource servers
- MCP clients act as OAuth 2.1 clients
- **Mandatory PKCE** for all clients (most are public clients)
- Authorization servers MUST provide RFC8414 metadata
- MCP servers MUST implement RFC 9728 Protected Resource Metadata
- Dynamic Client Registration (RFC7591) SHOULD be supported
- Resource indicators scope tokens to specific MCP servers

- Source: https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization

### Capability Negotiation

Clients and servers explicitly declare supported features during initialization:

- Servers declare: resource subscriptions, tool support, prompt templates
- Clients declare: sampling support, notification handling
- Both parties must respect declared capabilities throughout the session
- Roots work for accident prevention, not malicious behavior prevention

---

## 2. AI Safety Guardrail Frameworks That Work with MCP

### Guardrails AI
- **GitHub:** github.com/guardrails-ai/guardrails — **6.6k stars**
- **Version:** v0.9.2 (March 16, 2026)
- **License:** Apache 2.0
- **Features:** Input/Output Guards with pre-built validators from Guardrails Hub; structured data validation; multi-LLM support; deployable as Flask service with REST API
- **MCP relevance:** Integrated with NVIDIA NeMo Guardrails for combined validation; Guardrails Hub validators can be composed into guards for toxicity detection, PII scrubbing, etc.
- **Integration with NeMo Guardrails:** Combined approach — Guardrails AI handles I/O validation while NeMo handles dialog flow control

### NVIDIA NeMo Guardrails
- **GitHub:** github.com/NVIDIA-NeMo/Guardrails — **5.9k stars**
- **Version:** 0.21.0 (beta)
- **License:** Apache 2.0
- **Features:** Colang modeling language (1.0 and 2.0); topical rails, dialog rails, output rails; parallel rails execution; OpenTelemetry migration
- **Rail types:**
  - **Output Rails:** Reject or alter LLM output (e.g., removing sensitive data)
  - **Topical Rails:** Control what topics the bot can discuss
  - **Dialog Rails:** Influence how the LLM is prompted
- **MCP relevance:** No direct MCP integration found, but its programmable guardrail patterns are applicable to MCP tool output filtering

### Pangea MCP Proxy
- **GitHub:** github.com/pangeacyber/pangea-mcp-proxy — **6 stars** (archived Jan 2, 2026)
- **Version:** v0.9.22
- **License:** Apache 2.0
- **Features:** Open-source proxy wrapping MCP servers with AI Guard — blocks prompt injections, malicious links/IPs/domains via CrowdStrike/DomainTools threat intel; detects 50+ types of PII; supports 104 languages; immutable audit logging; token rotation via Pangea Vault
- **Status:** ARCHIVED — read-only as of January 2, 2026. Pangea now focuses on their commercial AI Guard platform.

### OpenGuardrails
- **GitHub:** github.com/openguardrails/openguardrails — **322 stars**
- **Version:** v6.8.21 (March 12, 2026)
- **License:** Apache 2.0
- **Features:** 10 built-in security scanners: prompt injection, system override, web attacks, MCP tool poisoning, malicious code execution, NSFW content, PII leakage, credential leakage, confidential data
- **Behavioral pattern detection:** file read → exfiltration, credential access → external write, shell execution after web fetch
- **Model:** Single 14B dense model quantized to 3.3B via GPTQ; outperforms LlamaGuard and Qwen3Guard on multilingual safety benchmarks
- **Zero-config:** "Install it, and the agent won't go rogue"

### Javelin Guardrails MCP Server
- **URL:** glama.ai/mcp/servers/@abhijitjavelin/javelin-guardrails-mcp-server
- **Features:** Prompt injection detection, trust/safety detection (violence, weapons, hate speech, crime, sexual content, profanity), language detection with confidence scoring
- **Enterprise features:** Role-based controls, throttling, rate limiting
- **Javelin Ramparts:** Pre-deployment MCP risk assessment scanning servers and tool manifests, producing audit-ready findings mapped to OWASP/MITRE

### AWS Bedrock Guardrails
- **MCP integration:** Bifrost AI gateway integrates Bedrock Guardrails for MCP tool governance
- **Features:** Content filtering, hallucination detection, privacy controls, automated reasoning
- **No direct MCP server** but usable through gateway layers

### Azure AI Content Safety
- **MCP integration:** Available through Bifrost AI gateway integration
- **No dedicated MCP server** but can be used as a guardrail layer in MCP pipelines

### Anthropic Constitutional AI
- **Approach:** Constitutional Classifiers monitor model inputs/outputs using rules-based "constitution"
- **Claude's Constitution:** Values hierarchy — safety > ethics > Anthropic guidelines > helpfulness
- **Relevance to MCP:** Claude's built-in safety guardrails apply to MCP tool usage in Claude Desktop and Claude Code
- **ASL-3 protections** activated May 2025 for frontier safety

---

## 3. Content Filtering for MCP

### MCP Presidio Server (PII Detection)
- **GitHub:** github.com/cmalpass/mcp-presidio
- **Features:** 25+ PII types (names, emails, phones, credit cards, SSNs, addresses); multiple anonymization strategies (replace, redact, hash, mask, encrypt); structured data support (recursive JSON analysis)
- **Deployment:** Docker or Python; stdio transport for Claude Desktop integration
- **Underlying tech:** Microsoft Presidio (open-source NLP-based PII detection)

### Skyflow MCP Integration
- **GitHub:** github.com/SkyflowFoundry/mcp_sample_tavily
- **Features:** Polymorphic data protection — masking, tokenizing, rehydrating fields contextually based on policy; automatic PII deidentification (SSNs, credit cards, phones, emails) before sending to external APIs
- **MCP pattern:** Wraps Tavily search MCP server to protect PII in search queries

### LiteLLM Presidio Integration
- **URL:** docs.litellm.ai/docs/proxy/guardrails/pii_masking_v2
- **Features:** Pre-MCP-call mode for PII entity filtering; configurable entity types and actions (MASK, BLOCK)
- **Pattern:** Guardrail proxy that intercepts MCP calls before they reach tools

### MCP Manager PII Redaction
- **URL:** mcpmanager.ai/blog/pii-redaction-for-mcp-servers/
- **Features:** Two methods for blocking sensitive data in MCP servers
- **Integrates:** Microsoft Presidio for NLP-based contextual PII recognition

### Prompt Injection Defense

**MCP-Guard Framework:**
- **GitHub:** github.com/General-Analysis/mcp-guard — **53 stars**, MIT license
- **Architecture:** Multi-stage proxy between MCP hosts and servers
- **Stage 1:** Lightweight static scanning with pattern-based detectors (SQL injection, sensitive files)
- **Learnable Detector:** 96.01% accuracy, 95.06% F1-score (post fine-tuning on MCP-AttackBench)
- **Paper:** arxiv.org/html/2508.10991v1

**MCP-Scan (Invariant Labs / now Snyk):**
- **GitHub:** github.com/invariantlabs-ai/mcp-scan — **2k stars**
- **Version:** v0.4.10 (March 25, 2026)
- **Modes:** Static scan + live proxy monitor
- **Detects:** Prompt injections, tool poisoning, shadowing, rug-pull replacements, toxic data flows, cross-origin escalation
- **Usage:** `uvx mcp-scan@latest` or `npx mcp-scan@latest`

**Pipelock (Agent Firewall):**
- **GitHub:** github.com/luckyPipewrench/pipelock — **309 stars**
- **License:** Apache 2.0 (core) / ELv2 (enterprise)
- **Features:** 11-layer URL scanner, 46+ DLP secret patterns, process sandbox (Landlock/seccomp/namespaces), response scanning with 19+ patterns and 6-pass normalization, bidirectional MCP scanning, tool poisoning detection, chain-attack analysis
- **Kill switch:** Emergency deny-all via config, SIGUSR1, file sentinel, or remote API
- **Monitoring:** Prometheus metrics + Grafana dashboards
- **Works with:** Claude Code, OpenAI Agents SDK, Google ADK, AutoGen, CrewAI, LangGraph

**Microsoft Guidance:**
- Microsoft published "Protecting against indirect prompt injection attacks in MCP" with recommended mitigation patterns
- Source: developer.microsoft.com/blog/protecting-against-indirect-injection-attacks-mcp

---

## 4. Human-in-the-Loop Patterns

### Claude Code Permission Model
- **Five permission modes:** Normal (prompts for every dangerous operation), auto-accept (eliminates file edit prompts), and three additional configurable modes
- **MCP tool permissions:** Allow/restrict specific tools within each MCP server
- **Shift+Tab cycling** between modes in CLI
- **`--permission-prompt-tool`:** Delegates allow/deny decisions to a custom MCP tool — supports conditional approval, audit trails, Slack approvals, risk scoring, time-of-day policies
- **Elicitation support:** Automatic interactive dialogs when servers request input

- Source: docs.anthropic.com/en/docs/claude-code/mcp

### Claude Desktop Auto-Approve
- Can be configured to auto-approve MCP tools from trusted servers
- Tool annotations (`readOnlyHint: true`) inform approval decisions

### WhatsApp Approval Pattern
- **Project:** mcp-container.com — claude-code-whatsapp-approval MCP tool
- **Pattern:** External approval routing for tool calls via messaging

### General Patterns
1. **Annotation-driven:** Auto-approve `readOnlyHint: true` tools; require confirmation for `destructiveHint: true`
2. **Sampling-based:** User reviews LLM prompts and responses before they return to the server
3. **Elicitation-based:** Servers request structured user input for critical decisions
4. **Gateway-based:** MCP gateways intercept and require approval for flagged operations
5. **Policy-driven:** External policy engines (OPA, Cedar) make allow/deny decisions

---

## 5. Rate Limiting and Abuse Prevention

### Bifrost AI Gateway
- **GitHub:** github.com/maximhq/bifrost — **3.3k stars**
- **License:** Apache 2.0
- **Features:**
  - Hierarchical budget structure: organization > team > project > virtual key
  - Per-tool, per-user, per-team rate limits
  - Virtual key scoping for MCP tools (control which tools available per key)
  - Flexible budget reset durations
  - Requests must pass both request limit and token limit checks at all levels
  - Provider-level rate limiting with automatic failover
  - MCP gateway features prevent runaway agent loops
- **Performance:** ~11 microseconds overhead at 5,000 RPS

### Denial-of-Wallet Attacks
- **Research finding:** Malicious MCP tool servers can induce cyclic "overthinking loops" amplifying token consumption up to **142.4x** and increasing latency
- **Stolen token risk:** Attackers can bombard servers with requests, causing DoS or excessive API bills
- **Mitigation:** Enforce privilege restrictions, timeouts, and cost controls for all MCP servers

### Kong AI Gateway
- Extended trusted API Gateway infrastructure with MCP capabilities in AI Gateway 3.12 (October 2025)
- Rate limiting prevents agent runaway scenarios

### Gateway-Level Rate Limiting
- Per-tool, per-user, per-team limits with in-memory enforcement
- Sub-millisecond overhead
- Advanced gateways support burst allowances and sliding window algorithms

### Token Usage Optimization
- MCP Code Mode saves 50-90% of AI token costs with 3+ MCP servers
- Speakeasy reduced token usage by 100x using dynamic toolsets
- Strategies: reduce tool descriptions, use dynamic tool selection, implement response truncation

---

## 6. Audit Logging and Compliance

### OpenTelemetry MCP Semantic Conventions
- **Status:** Merged January 2026
- **Standard attributes** compatible with Grafana, Datadog, Honeycomb, Splunk, New Relic
- Each tool call becomes a sub-span with tool name, latency, and success flag
- Propagate trace context inside MCP request `params._meta` property bag
- Source: opentelemetry.io/docs/specs/semconv/gen-ai/mcp/

### MintMCP
- SOC 2 Type II certified
- Complete audit logs tracking every MCP interaction, access request, and configuration change
- Real-time monitoring: server health, usage patterns, tool call tracking, security alerts
- GDPR compliance support

### Gateway-Based Audit Logging
- **Pattern:** Funnel all agent-tool interactions through a gateway for unified audit log
- **Records:** User identification, session context, tool name, connector info, parameters, configuration, results, data access patterns
- **Compliance:** SOC 2 requires logging data access sufficient to detect and investigate security events

### Pangea Audit Logging (before archive)
- Immutable audit trail via Pangea Secure Audit Log
- Every AI Guard request and detection result logged

### MXCP Observability (RAW Labs)
- Production MCP monitoring and tracing platform
- Source: raw-labs.com/platform/mxcp-observability/

---

## 7. Permission and Access Control

### Permit.io MCP Gateway
- **URL:** permit.io/mcp-gateway
- **Features:**
  - Fine-grained, action-time authorization for agentic workflows
  - Supports RBAC, ABAC, and ReBAC
  - Zero Standing Permissions — requires identity handshake before tool exposure
  - Agentic identity fingerprinting — if prompt injection alters intent, fingerprint breaks and access denied
  - Generates contextual authorization policy for each tool automatically
  - SIEM-ready logging: user, agent, tool, policy, outcome
  - FastMCP integration available
- **Documentation:** docs.permit.io/ai-security/mcp-permissions/

### Open Policy Agent (OPA)
- Supports RBAC, ABAC, and ReBAC
- Can be used as MCP policy decision point
- Rego language for policy definitions
- Source: natoma.ai/blog/mcp-access-control-opa-vs-cedar-the-definitive-guide

### Cedar (AWS)
- Fine-grained authorization for RBAC and ABAC
- Human-readable, analyzable policies
- Kubernetes integration (Q4 2024)
- Combinable with OPAL for policy synchronization across microservices and AI agents
- Source: natoma.ai/blog/mcp-access-control-opa-vs-cedar-the-definitive-guide

### QueryPie MCP PAM
- **URL:** querypie.com/products/mcp-access-controller
- **Features:** MCP Privileged Access Management — real-time policy-based control over every AI-tool interaction
- **Architecture:** MCP Proxy intercepts all external requests; Policy Decision Points (PDPs) evaluate each request; behavioral auditing; unified logging; risk-based evaluation
- **Addresses:** Credential management gap in MCP (MCP doesn't manage secrets)

### Natoma MCP Gateway
- OAuth 2.1 security
- 100+ MCP servers with one-click deployment
- 1Password integration for credential management (demonstrated at RSA 2026)
- Source: natoma.ai/product

---

## 8. Responsible AI Frameworks

### CoSAI MCP Security Whitepaper (January 2026)
- **Publisher:** Coalition for Secure AI (OASIS Open Project)
- **Title:** "Securing the AI Agent Revolution: A Practical Guide to Model Context Protocol Security"
- **Content:** Taxonomy of ~40 threats across 12 categories
- **Categories span:** Identity/access control, input validation, data protection
- **Key threats:** Tool poisoning, Full Schema Poisoning (FSP), resource content poisoning
- **GitHub:** github.com/cosai-oasis/ws4-secure-design-agentic-systems
- Source: coalitionforsecureai.org/securing-the-ai-agent-revolution-a-practical-guide-to-mcp-security/

### OWASP Top 10 for Agentic Applications (2026)
- Developed by 100+ industry experts
- **ASI01:** Agent Goal Hijack
- **ASI02:** Tool Misuse & Exploitation
- **ASI03:** Identity & Privilege Abuse
- **ASI04:** Agentic Supply Chain Vulnerabilities
- **ASI05:** Unexpected Code Execution
- **ASI06:** Memory & Context Poisoning
- **ASI07:** Insecure Inter-Agent Communication
- **ASI08:** Cascading Failures
- **ASI09:** Human-Agent Trust Exploitation
- **ASI10:** Rogue Agents
- Source: genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/

### OWASP MCP Top 10
- **URL:** owasp.org/www-project-mcp-top-10/
- MCP-specific security risks in AI agent tool integration
- Covers: model misbinding, context spoofing, prompt-state manipulation, insecure memory references, covert channel abuse, tool poisoning (rug pulls, schema poisoning, tool shadowing)
- Source: mcpblog.dev/blog/2026-03-15-owasp-mcp-top-10

### Adversa AI MCP Security TOP 25
- **Published:** September 2025
- **Content:** First comprehensive catalog of all MCP vulnerabilities, threats, and defenses
- **Format per entry:** Definition, uniqueness to AI, MCP/application security threats, impact, complexity, technical details, defensive measures
- **Defense layers:** Protocol level, application level, AI-specific, infrastructure
- **Source:** adversa.ai/mcp-security-top-25-mcp-vulnerabilities/

### CSA Agentic Trust Framework (February 2026)
- **Publisher:** Cloud Security Alliance
- **Core principle:** Agentic Zero Trust — no AI agent trusted by default
- **Authors:** Josh Woodruff (MassiveScale), Michelle Savage; foreword by John Kindervag (creator of Zero Trust)
- **Survey finding:** 84% of organizations cannot pass compliance audit for agent behavior; only 23% have formal agent identity strategy
- **GitHub:** github.com/massivescale-ai/agentic-trust-framework
- Source: cloudsecurityalliance.org/blog/2026/02/02/the-agentic-trust-framework-zero-trust-governance-for-ai-agents

### CSAI Foundation (March 2026)
- CSA launched CSAI Foundation with mission of "Securing the Agentic Control Plane"
- Source: cloudsecurityalliance.org/press-releases/2026/03/23/csa-securing-the-agentic-control-plane

---

## 9. Real-World Incidents and Concerns

### Supabase/Cursor Data Exfiltration (2025)
- **What:** Cursor assistant with service_role access bypassed RLS; attacker embedded hidden SQL instructions in support ticket; agent read integration_tokens table and posted to public ticket
- **Root cause:** Privileged access + untrusted input treated as instructions
- Source: simonwillison.net/2025/Jul/6/supabase-mcp-lethal-trifecta/

### GitHub MCP Private Repo Leak (May 2025)
- **What:** Malicious public GitHub issue hijacked AI assistant into leaking private repository contents (including salary data) into a public PR
- **Discoverer:** Invariant Labs
- Source: invariantlabs.ai/blog/mcp-github-vulnerability

### WhatsApp MCP Data Exfiltration (April 2025)
- **What:** Malicious MCP server silently exfiltrated entire WhatsApp message history via tool poisoning combined with legitimate whatsapp-mcp server
- **Discoverer:** Invariant Labs
- Source: docker.com/blog/mcp-horror-stories-whatsapp-data-exfiltration-issue/

### Asana Cross-Tenant Data Leak (June 2025)
- **What:** Bug in MCP-enabled feature caused customer data to bleed into other customers' MCP instances
- **Impact:** ~1,000 customers potentially exposed (June 5-17, 2025)
- **Root cause:** Logic flaw in access control — cross-tenant isolation failure
- Source: nudgesecurity.com/post/asana-mcp-server-data-exposure-incident

### CVE-2025-6514: mcp-remote RCE
- **Severity:** CVSS 9.6 (Critical)
- **What:** OS command injection in mcp-remote OAuth proxy; malicious servers could send booby-trapped authorization_endpoint passed directly to system shell
- **Impact:** 437,000+ downloads; used in Cloudflare, Hugging Face, Auth0 integration guides
- **Discoverer:** JFrog
- Source: wiz.io/vulnerability-database/cve/cve-2025-6514

### MCP Tool Poisoning (Systematic)
- **Research:** MCP-ITP automated framework for generating implicit tool poisoning attacks
- **MCPTox benchmark** demonstrates tool poisoning attacks are "alarmingly common"
- **Paper:** arxiv.org/html/2603.22489v1
- Hidden malicious instructions in tool descriptions — visible to LLM, not normally displayed to users

### 30 CVEs in 60 Days (Early 2026)
- Source: heyuan110.com/posts/ai/2026-03-10-mcp-security-2026/
- Rapid increase in MCP-related CVEs as adoption grew

### MCP-Breach-to-Fix Labs
- **GitHub:** github.com/PawelKozy/mcp-breach-to-fix-labs
- 10 real incidents reproduced with vulnerable/secure MCP servers for hands-on learning

---

## 10. Sandbox and Isolation Patterns

### Docker MCP Toolkit & Catalog
- **URL:** docs.docker.com/ai/mcp-catalog-and-toolkit/
- **Catalog:** 300+ verified MCP servers as container images with versioning and provenance
- **Container isolation:** Each MCP server runs in own sandboxed container with memory, network, disk isolation
- **Signed image verification** from catalog
- **Gateway:** Sits between clients and servers for verification, policy, observability
- **Security transparency:** Docker-built (signed + verified) vs community-built (containerized by publisher)
- **CLI:** `docker mcp` for build, run, manage

### ToolHive (Stacklok)
- **GitHub:** github.com/stacklok/toolhive — **1.7k stars**
- **Version:** v0.13.1 (March 27, 2026)
- **License:** Apache 2.0
- **Features:** Enterprise MCP server management; container isolation with restricted permissions; encrypted secret management; Kubernetes operator for K8s-native deployment
- **Components:** Gateway, Registry Server, Runtime, Portal UI
- **Integrations:** GitHub Copilot, Cursor, VS Code Server, Claude Code

### Wassette (Microsoft)
- **GitHub:** github.com/microsoft/wassette — **867 stars**
- **Version:** v0.4.0 (February 4, 2026)
- **License:** MIT
- **Features:** WebAssembly-based tool sandboxing via Wasmtime runtime; deny-by-default permission system; no file system, network, or environment access unless explicitly allowed; browser-grade isolation
- **Design:** Loads Wasm Components from OCI registries; translates interfaces to MCP functionality

### Wasmcp
- **GitHub:** github.com/wasmcp/wasmcp — **74 stars**
- **Version:** CLI v0.4.13 (March 20, 2026)
- **License:** Apache 2.0
- **Features:** Polyglot framework (Rust, Python, TypeScript); stateful sessions; JWT/OAuth auth; auto-composition; distributable via OCI registries

### MCP.run
- **URL:** docs.mcp.run
- **Features:** Servlets run in shared WebAssembly runtime with isolated environments; no data sharing between servlets; explicit resource/capability access per servlet config
- **Security:** Mitigates tool poisoning via sandboxing; each servlet given limited, defined capabilities
- **Deployment:** Local, remote, browser-based, on-premises, or cloud-hosted

### Hyper-MCP
- **GitHub:** github.com/hyper-mcp-rs/hyper-mcp
- **Features:** Fast secure MCP server with WebAssembly plugins; sandboxed plugin execution; resource limits; signed OCI images

### Code Sandbox MCP
- **GitHub:** github.com/Automata-Labs-team/code-sandbox-mcp — **316 stars**
- **License:** MIT
- **Features:** Docker-based isolated code execution; any Docker image as environment; file transfer between host and container; real-time log streaming; cross-platform

### Pipelock Process Sandbox
- OS-native containment using Landlock, seccomp, and network namespaces on Linux
- Part of the broader Pipelock agent firewall

---

## Summary of Key Tools and GitHub Stars

| Tool | Stars | License | Category |
|------|-------|---------|----------|
| Guardrails AI | 6.6k | Apache 2.0 | Guardrail framework |
| NeMo Guardrails | 5.9k | Apache 2.0 | Guardrail framework |
| Bifrost | 3.3k | Apache 2.0 | AI gateway / rate limiting |
| MCP-Scan | 2k | MIT | Security scanner |
| ToolHive | 1.7k | Apache 2.0 | Container management |
| Wassette | 867 | MIT | WASM sandbox |
| OpenGuardrails | 322 | Apache 2.0 | Agent guardrails |
| Code Sandbox MCP | 316 | MIT | Docker sandbox |
| Pipelock | 309 | Apache 2.0/ELv2 | Agent firewall |
| Wasmcp | 74 | Apache 2.0 | WASM framework |
| MCP-Guard | 53 | MIT | Prompt injection defense |
| Pangea MCP Proxy | 6 | Apache 2.0 | Guardrail proxy (ARCHIVED) |

---

## Key Security Frameworks and Standards

| Framework | Publisher | Date | Focus |
|-----------|----------|------|-------|
| CoSAI MCP Security | OASIS/CoSAI | Jan 2026 | ~40 threats, 12 categories |
| OWASP Agentic Top 10 | OWASP | Dec 2025 | 10 agentic AI risks |
| OWASP MCP Top 10 | OWASP | Mar 2026 | MCP-specific risks |
| Adversa AI MCP TOP 25 | Adversa AI | Sep 2025 | 25 MCP vulnerabilities |
| CSA Agentic Trust Framework | CSA | Feb 2026 | Zero Trust for AI agents |
| Anthropic ASL-3 | Anthropic | May 2025 | Frontier model safety |

---

## Architecture Patterns for MCP Safety

### 1. Gateway Pattern
Place an MCP gateway between clients and servers to enforce policies, rate limits, audit logging, and content filtering centrally. (Kong, Bifrost, Docker, Permit.io, Natoma)

### 2. Proxy Pattern
Wrap individual MCP servers with security proxies that scan inputs/outputs. (Pangea, MCP-Guard, Pipelock, MCP-Scan proxy mode)

### 3. Sandbox Pattern
Run each MCP server in isolated execution environments. (Docker containers, WebAssembly via Wassette/MCP.run/wasmcp, OS-level via Pipelock)

### 4. Policy Engine Pattern
External policy engines make authorization decisions for each tool call. (OPA, Cedar, Permit.io, QueryPie PAM)

### 5. Scanner Pattern
Static and dynamic scanning of MCP configurations and runtime traffic. (MCP-Scan, Pipelock, Javelin Ramparts, OpenGuardrails)

### 6. Human-in-the-Loop Pattern
Require user approval for sensitive operations via sampling, elicitation, or permission tools. (Claude Code permission model, --permission-prompt-tool, MCP sampling/elicitation)
