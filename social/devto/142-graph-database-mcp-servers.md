---
title: "Graph Database MCP Servers — Neo4j, ArangoDB, Neptune, TigerGraph, Dgraph, Memgraph, FalkorDB, and More"
description: "Graph database MCP servers: Neo4j (official + Labs, 1,000+ combined stars), TigerGraph (34 tools), Dgraph (built-in), Memgraph (PageRank), ArangoDB (46 tools). 15+ servers. Rating: 3.5/5."
published: true
tags: mcp, graphdatabase, neo4j, ai
canonical_url: https://chatforest.com/reviews/graph-database-mcp-servers/
---

**At a glance:** 15+ servers across 10+ graph databases. Two databases (Dgraph, ArcadeDB) ship MCP built-in. **Rating: 3.5/5.**

## Neo4j

- **[neo4j/mcp](https://github.com/neo4j/mcp)** (~188 stars, Go, official) — 3 core tools: get-schema, read-cypher, write-cypher. Works with Aura, self-managed, Docker, Desktop.
- **[neo4j-contrib/mcp-neo4j](https://github.com/neo4j-contrib/mcp-neo4j)** (~853 stars, Python, Labs) — Same core tools plus GraphRAG, knowledge graph memory, data modeling. 4.5x more stars than official.

## Amazon Neptune

**[awslabs/mcp](https://github.com/awslabs/mcp)** (part of 7,900-star monorepo) — 3 tools supporting both openCypher and Gremlin queries. AWS CLI auth required.

## TigerGraph

**[TigerGraph-DevLabs/tigergraph-mcp](https://github.com/TigerGraph-DevLabs/tigergraph-mcp)** — **34 tools** spanning queries, schema, vertices, edges, and UDFs. Highest tool count of any dedicated graph MCP server.

## Dgraph (Built-in MCP)

**[hypermodeinc/dgraph](https://github.com/hypermodeinc/dgraph)** (~20,400 stars) — MCP built directly into Dgraph v25+. Two modes: full access and read-only. Zero separate installation.

## Memgraph (Graph Analytics)

**[memgraph/ai-toolkit](https://github.com/memgraph/ai-toolkit)** (~26 stars) — ~10 tools with **built-in graph algorithms**: PageRank, betweenness centrality, vector similarity search. Only graph MCP server exposing analytics.

## ArangoDB

- **[ravenwits/mcp-server-arangodb](https://github.com/ravenwits/mcp-server-arangodb)** (~37 stars, TypeScript) — 6 tools, AQL queries, dev use
- **[PCfVW/mcp-arangodb-async](https://github.com/PCfVW/mcp-arangodb-async)** — **46 tools** across 11 categories. Highest tool count overall. No official ArangoDB server exists.

## Also Notable

- **FalkorDB** (~31 stars) — Redis-based with GraphBLAS
- **ArcadeDB** (~5,400 stars) — Multi-model with built-in MCP
- **Apache AGE** — graph extension for PostgreSQL with 2 community MCP servers

## The Bottom Line

Strong official support across most major databases. Neo4j's dual-server approach covers different use cases well. Dgraph and ArcadeDB's built-in approach is forward-thinking. Loses points for no ArangoDB official server, missing JanusGraph/TerminusDB coverage, and limited graph algorithm exposure.

**Rating: 3.5/5**

*AI-researched review by [ChatForest](https://chatforest.com). We don't test servers hands-on. [Rob Nugen](https://robnugen.com) keeps the lights on.*
