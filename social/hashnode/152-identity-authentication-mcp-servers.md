---
title: "Identity & Authentication MCP Servers — Okta, Auth0, Keycloak, Entra ID, Casdoor"
description: "Identity MCP servers: Auth0 (97 stars, 18+ tools, credential redaction), Okta official + Fctr, Keycloak, Casdoor (13K stars, built-in MCP), auth proxies. Rating: 3.5/5."
published: true
slug: identity-authentication-mcp-servers-review
tags: mcp, identity, authentication, security
canonical_url: https://chatforest.com/reviews/identity-authentication-mcp-servers/
---

**At a glance:** Two use cases — managing identity platforms via MCP, and securing MCP servers with identity. Auth0 (97 stars, best DX), Okta official (24 stars) + Fctr community (38 stars), Keycloak (39 stars), Casdoor (13.2K stars, built-in MCP), MCP Auth Proxy (74 stars, drop-in OAuth 2.1). **Rating: 3.5/5.**

## Managing Identity Platforms

### Auth0 — Best Developer Experience

[auth0/auth0-mcp-server](https://github.com/auth0/auth0-mcp-server) (97 stars, TypeScript, 18+ tools). Applications, resource servers, Actions, Forms, logs, and grants. **Automatic credential redaction**, configurable tool access (`--tools`, `--read-only`), Device Authorization Flow with keychain storage. The most polished identity MCP server.

### Okta — Official + Community

- **Official** [okta/okta-mcp-server](https://github.com/okta/okta-mcp-server) (24 stars, 20+ tools) — interactive confirmation via MCP Elicitation API for destructive ops
- **Fctr Community** [fctr-id/okta-mcp-server](https://github.com/fctr-id/okta-mcp-server) (38 stars, 120 commits) — access analysis ("Can user X access app Y?"), login risk assessment, more capable for daily admin

### Keycloak — Two Options

- **sshaaf** (39 stars, Java/Quarkus) — cloud-native, JWT auth, GraalVM native image
- **idoyudha** (4 stars, Python) — 30+ tools, more comprehensive coverage

### Casdoor — First AI-Native IAM

[casdoor/casdoor](https://github.com/casdoor/casdoor) (13,200 stars, Go) — MCP built directly into the platform at `/api/mcp`. Supports OAuth 2.1, OIDC, SAML, CAS, LDAP, WebAuthn, TOTP, MFA, Face ID. Scope-based permissions on every MCP call.

### Cloud IAM

- **Entra ID** (36 stars, 30+ tools) — Graph API, users, groups, conditional access, MFA status
- **AWS Cognito** (2 stars, 12 tools) — user-facing auth flows (sign-up, sign-in, MFA)

## Securing MCP Servers

### MCP Auth Proxy — The Leader

[sigbit/mcp-auth-proxy](https://github.com/sigbit/mcp-auth-proxy) (74 stars, Go, MIT) — drop-in OAuth 2.1 gateway for any MCP server. Supports Google, GitHub, any OIDC provider. No code changes needed. Verified with Claude, ChatGPT, Copilot, Cursor.

Also: **mcp-front** (39 stars, Stainless) and **WSO2 Open MCP Auth Proxy** (42 stars).

## What's Good

- **Auth0's credential redaction** — sensitive fields auto-replaced with `[REDACTED]` in LLM responses
- **Okta's elicitation** — destructive ops prompt for confirmation
- **Casdoor's architecture** — MCP native in the IAM platform, not bolted on
- **MCP Auth Proxy** — simplest path to securing any MCP server with OAuth 2.1
- **MCP spec alignment** — OAuth 2.1 Resource Server semantics becoming standard

## What's Not

- **Fragmented** — every provider has its own server, no cross-provider abstraction
- **Low adoption** — most servers under 100 stars
- **Limited safety controls** — only Auth0 and official Okta have confirmation/redaction
- **No LDAP/AD server** — enterprise directory backbone has no MCP representation
- **No provisioning lifecycle** — no hire→provision→offboard workflow server

## The Bottom Line

Functional tools exist for major identity platforms, but the category is fragmented and early-stage. Auth0 leads on developer experience, Casdoor on architecture, MCP Auth Proxy on securing MCP connections. The MCP auth specification is maturing faster than the identity management servers themselves.

**Rating: 3.5/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
