# AI Agent Memory & Context Management in 2026 — Research Notes

Research compiled: 2026-03-28
Purpose: Source material for chatforest.com guide on AI agent memory systems

---

## 1. Memory Patterns AI Agents Use in 2026

The field has converged on a four-type taxonomy that mirrors human cognition. The December 2025 survey paper "Memory in the Age of AI Agents" (arxiv.org/abs/2512.13564) proposes a refined framework analyzing memory through three lenses: **forms** (token-level, parametric, latent), **functions** (factual, experiential, working), and **dynamics** (formation, evolution, retrieval).

### Working / Conversation Memory (Short-Term)
- Holds recent conversation turns and session context
- Typically the last 5-10 exchanges kept verbatim
- Implemented via conversation buffers or in-memory caches (e.g., Redis)
- Common pattern: keep last N messages verbatim, summarize everything older
- Expiration timestamps manage lifecycle
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

### Episodic Memory (Long-Term)
- Stores specific past events and interaction histories
- "Last session the user updated Artifact X and preferred Y approach"
- A travel agent remembers a user booked a London trip for a conference and prefers city-center hotels
- Decays faster than semantic memory — specific events fade if not recalled
- Source: https://www.ibm.com/think/topics/ai-agent-memory

### Semantic Memory (Long-Term)
- Facts, preferences, and general knowledge
- "User likes pizza, prefers dark mode, works in fintech"
- Often backed by knowledge bases (visa rules, policies, FAQs)
- More persistent than episodic — facts remain relevant longer
- Source: https://machinelearningmastery.com/beyond-short-term-memory-the-3-types-of-long-term-memory-ai-agents-need/

### Procedural Memory (Long-Term)
- Workflows, skills, and step-by-step processes
- "Step-by-step process for invoice approval: validate → route → notify"
- Enables smooth orchestration without reasoning through workflows from scratch each time
- The agent handling travel booking knows *how* to search flights, compare options, make reservations
- Source: https://blogs.oracle.com/developers/agent-memory-why-your-ai-has-amnesia-and-how-to-fix-it

### Graph Memory (Advanced / Emerging)
- Uses Neo4j or similar for entity-relationship mapping
- Excels at multi-hop reasoning connecting related information
- Preserves how information links across time rather than treating memories in isolation
- Graph memory maintains relationships — knowing a user prefers coffee from a specific shop ordered last Tuesday, not just "likes coffee"
- Source: https://mem0.ai/blog/graph-memory-solutions-ai-agents

### Storage Architecture by Memory Type
| Storage Type | Strengths | Best For |
|---|---|---|
| Vector DBs | Semantic similarity search | Semantic memory retrieval |
| Graph DBs | Fast relationship traversal | Episodic + procedural memory |
| SQL/Postgres | ACID-compliant, auditable | Long-term facts, structured data |
| Redis/In-memory | Sub-millisecond latency | Working/conversation memory |

Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

---

## 2. Memory Frameworks and Libraries (2026 Landscape)

### Mem0 — The Market Leader
- **GitHub stars**: ~48K (most widely adopted)
- **Latest version**: mem0ai v1.0.8 (released March 26, 2026)
- **Key metrics**: 67.13% LLM-as-a-Judge score on LOCOMO benchmark; p95 search latency 0.200s; ~1,764 tokens per conversation vs 26,031 for full-context (91% latency reduction, 90%+ token savings)
- **Architecture**: Postgres for facts + Qdrant for vector search + optional Neo4j for graph memory
- **Graph memory**: Added in Pro tier; layers entity relationships onto search so agents remember who did what, when, and with whom
- **Deployment**: Open-source self-hosted or cloud service (SOC 2 compliant)
- **SDKs**: Python and Node.js
- **Integrations**: OpenAI, LangGraph, CrewAI, Vercel AI SDK
- **Claims**: +26% accuracy over OpenAI Memory on LOCOMO benchmark
- Sources: https://github.com/mem0ai/mem0, https://mem0.ai/research, https://pypi.org/project/mem0ai/

### Zep — Temporal Knowledge Graph Pioneer
- **Core technology**: Graphiti — a temporally-aware knowledge graph engine
- **Key innovation**: Bi-temporal model tracking when events occurred AND when they were ingested
- **Conflict resolution**: Semantic, keyword, and graph search to detect conflicting knowledge; uses temporal metadata to update/invalidate (not discard) outdated information
- **Performance**: Up to 18.5% accuracy improvement on LongMemEval while reducing latency by 90%
- **Benchmark**: ~85% on LoCoMo
- **Architecture**: Temporal knowledge graph + vector search (cloud or self-hosted)
- **Research paper**: "Zep: A Temporal Knowledge Graph Architecture for Agent Memory" (arxiv.org/abs/2501.13956)
- Sources: https://www.getzep.com/, https://arxiv.org/abs/2501.13956, https://github.com/getzep/graphiti

### Letta (formerly MemGPT) — OS-Inspired Memory
- **Paradigm**: LLM-as-an-Operating-System — the model manages its own memory like an OS manages RAM and disk
- **Core memory**: Always visible to agent, embedded in system instructions, always in-context
- **Key difference**: Persists agent state in databases, not Python variables
- **Benchmark**: ~83.2% on LoCoMo
- **2026 features**:
  - Letta Code: #1 model-agnostic open source agent on Terminal-Bench
  - Letta Filesystem: interface for agents to organize PDFs, transcripts, docs
  - Letta V1 architecture optimized for GPT-5 and Claude 4.5 Sonnet
  - Letta Evals: open-source evaluation framework for stateful agents
- **License**: Apache (open source)
- **Funding**: $10M raised from stealth
- Sources: https://github.com/letta-ai/letta, https://letta.com/, https://www.letta.com/blog/benchmarking-ai-agent-memory

### LangMem — LangGraph's Memory Layer
- **Design**: Long-term memory within LangGraph ecosystem
- **Storage**: Memories as JSON documents in structured store (namespaces/keys)
- **Focus**: Working memory — compressing long histories into actionable summaries
- **Benchmark**: 58.10% on LOCOMO; p95 search latency of 59.82s (impractical for real-time)
- **Limitation**: Python-only, no JS/TS SDK; flat key-value with vector search, no entity extraction
- **Best for**: Teams already committed to LangGraph
- Source: https://vectorize.io/articles/langchain-memory-alternatives

### Graphlit — Full-Stack Semantic Platform
- **Type**: Standalone semantic memory platform (framework-agnostic)
- **Features**: Multimodal ingestion, entity extraction, knowledge graphs, semantic search
- **Advantage**: Works with any agent framework; faster time-to-value than LangMem
- **Trade-off**: Less control than framework-specific solutions
- Source: https://www.graphlit.com/blog/survey-of-ai-agent-memory-frameworks

### MemoClaw — Minimalist Pay-Per-Use
- **Philosophy**: Simplest API, no accounts, pay-only-for-what-you-use
- **Unique feature**: Uses x402 protocol for AI agents to pay for memory operations inline with USDC on Base
- **Best for**: Lightweight integration, crypto-native workflows
- Source: https://dev.to/anajuliabit/mem0-vs-zep-vs-langmem-vs-memoclaw-ai-agent-memory-comparison-2026-1l1k

### SuperLocalMemory — Privacy-First Local Memory
- **Architecture**: Local-first mathematical approach with 4-channel fusion (Fisher-Rao geometric + BM25 lexical + entity graph + temporal)
- **Benchmark**: Mode A (no cloud): 74.8%; Mode C (with cloud synthesis): 87.7%
- **EU AI Act compliance**: Mode A compliant "by architecture" — data never leaves device
- **License**: MIT (open source)
- Source: https://dev.to/varun_pratapbhardwaj_b13/5-ai-agent-memory-systems-compared-mem0-zep-letta-supermemory-superlocalmemory-2026-benchmark-59p3

### AWS AgentCore Memory — Enterprise Managed Service
- **Type**: Fully managed service within Amazon Bedrock
- **Memory types**: Short-term context + long-term knowledge retention
- **Strategies**: Summarization, semantic memory (facts/knowledge), user preferences
- **Processing**: Asynchronous background extraction after conversations stored in short-term memory
- **2026 update**: Streaming notifications via Amazon Kinesis (push, not poll)
- **Custom strategies**: Append to system prompt and choose model
- Source: https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory.html

### MemOS — Skill Memory System
- **Focus**: Persistent skill memory for cross-task skill reuse and evolution
- **GitHub**: https://github.com/MemTensor/MemOS
- Source: https://github.com/MemTensor/MemOS

### Benchmark Summary (LoCoMo Scores)
| System | Score | Cloud LLM Required | Open Source |
|---|---|---|---|
| EverMemOS | 92.3% | Yes | No |
| MemMachine | 91.7% | Yes | No |
| Hindsight | 89.6% | Yes | No |
| SuperLocalMemory V3 Mode C | 87.7% | Yes (synthesis) | Yes (MIT) |
| Zep | ~85% | Yes | Partial |
| Letta/MemGPT | ~83.2% | Yes | Yes (Apache) |
| SuperLocalMemory V3 Mode A | 74.8% | No | Yes (MIT) |
| Supermemory | ~70% | Yes | Yes (MIT) |
| Mem0 (self-reported) | ~66% | Yes | Partial |
| LangMem | 58.10% | Yes | Yes |

Key insight: "Every system requiring cloud LLMs clusters between 83-92%."

Source: https://dev.to/varun_pratapbhardwaj_b13/5-ai-agent-memory-systems-compared-mem0-zep-letta-supermemory-superlocalmemory-2026-benchmark-59p3

---

## 3. MCP and Memory

### Official MCP Memory Server
The official reference implementation provides a **knowledge graph-based persistent memory** system stored in a local JSONL file.

**Architecture**: Three components:
- **Entities**: Nodes (people, organizations, events) with name, type, and observations
- **Relations**: Directed connections between entities in active voice (e.g., "works_at")
- **Observations**: Atomic facts as strings attached to specific entities

**9 Tools Provided**:
1. `create_entities` — Add new entities with types and initial observations
2. `create_relations` — Establish connections between entities
3. `add_observations` — Append facts to entities
4. `delete_entities` — Remove entities (cascading relations)
5. `delete_observations` — Remove specific facts
6. `delete_relations` — Remove connections
7. `read_graph` — Return complete graph structure
8. `search_nodes` — Find entities by name, type, or observation
9. `open_nodes` — Retrieve specific entities by name with relations

**Storage**: JSONL file (default: `memory.jsonl`), configurable via `MEMORY_FILE_PATH` env var
**Install**: `@modelcontextprotocol/server-memory` via NPX or Docker

Source: https://github.com/modelcontextprotocol/servers/tree/main/src/memory

### Community MCP Memory Servers (413+ listed on PulseMCP)
- **mcp-memory-service** (doobidoo): Persistent memory for LangGraph, CrewAI, AutoGen, Claude; REST API + knowledge graph + autonomous consolidation
- **sparkvibe-io**: Zero-dependency SQLite-based persistent memory
- **shackleai**: Knowledge graph storage for AI coding tools
- **Solon AI**: Sub-millisecond recall + AES-256 encryption
- **Elasticsearch Memory**: Hierarchical categorization + semantic search
- **BasicMemory**: Official basic memory MCP server
- **Semantic Agent Memory** (MenaceLabs): Semantic memory with meaning-based recall
- Source: https://www.pulsemcp.com/servers?q=memory

### MCP Memory Patterns
- MCP provides real-time, task-specific tool access; memory provides persistent cross-session context
- MCP servers can expose memory systems as standardized tools
- Pattern: Agent uses MCP to connect to memory service, which handles storage/retrieval behind a uniform interface
- Agents running with 40+ cognitive tools via MCP can observe facts, track evolving beliefs, maintain cross-session threads, and consolidate/forget stale memories
- Source: https://www.mintlify.com/blog/how-claudes-memory-and-mcp-work

### MCP Governance
- In December 2025, Anthropic donated MCP to the Agentic AI Foundation (AAIF) under the Linux Foundation
- Co-founded by Anthropic, Block, and OpenAI
- Source: https://en.wikipedia.org/wiki/Model_Context_Protocol

---

## 4. Best Practices for Agent Memory Management

### Memory Consolidation
- Merge related information, resolve conflicts, minimize redundancies
- Example: "allergic to shellfish" (January) + "can't eat shrimp" (March) → recognize as related, consolidate without duplicates or contradictions
- Extraction → evaluation against existing memories → conflict resolution → update
- Source: https://sparkco.ai/blog/mastering-memory-consistency-in-ai-agents-2025-insights

### Chunking Strategies
- **Semantic chunking** preserving natural boundaries works better than fixed-length splits
- Generate embeddings with chosen model, store vectors with metadata (timestamps, user IDs)
- Enable hybrid search combining similarity with exact filtering
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

### Retrieval Patterns
- **Hybrid retrieval**: structured lookups first (exact match on user IDs, preferences, timestamps) + vector search as second pass for semantic relevance
- **Multi-channel fusion**: Combine vector similarity, full-text matching (BM25), entity graph traversal, and temporal filtering
- Return knowledge that is both semantically relevant and currently valid
- Source: https://dev.to/agentteams/why-your-agents-memory-architecture-is-probably-wrong-55fc

### Memory Decay / Forgetting
- Implement human-like forgetting: memories strengthen when recalled, decay if unused
- Episodic memories decay faster than semantic memories
- Without forgetting mechanisms, storage grows unbounded and retrieval quality degrades
- Dynamic scoring and curation based on relevance and usage
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

### Memory Tiering
- **Hot tier**: Redis/in-memory cache, <1ms latency, frequently accessed context
- **Warm tier**: Vector database, semantic search across recent interactions
- **Cold tier**: Persistent storage for historical data, accessed on demand
- Source: https://dev.to/agentteams/why-your-agents-memory-architecture-is-probably-wrong-55fc

### Scope-Based Isolation
- Separate memory by User ID, Agent ID, Session ID, or organizational level
- Critical for privacy, personalization, and multi-tenant deployments
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

### Agentic Context Engineering (ACE)
- Three-agent loop: Generator → Reflector → Curator
- Generator produces response, Reflector evaluates/refines, Curator extracts learnings into "context playbook"
- Results: +10.6% on agent benchmarks, +8.6% in domain tasks
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

### "Context Window ≠ Memory"
- Even with million-token context windows, stuffing everything in context is not memory
- Context is ephemeral (per-session); memory persists across sessions
- RAG alone is not enough — agents need to write, update, and delete knowledge dynamically
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/

---

## 5. How Major AI Platforms Handle Memory

### ChatGPT (OpenAI)
- **Two-layer system**: Saved memories + chat history reference
- **Saved memories**: Details remembered across conversations (name, preferences, goals); updated automatically; stored in "Model Set Context" section of system prompt with timestamps
- **Chat history**: References past conversations for relevance even if not saved as explicit memory (added April 2025)
- **Tiers**: Plus/Pro users get long-term understanding; free users get lightweight short-term continuity
- **User control**: Can view, edit, delete individual memories; turn memory on/off
- **Context window**: 128K tokens (smallest among major platforms) but supplemented by persistent memory
- Sources: https://openai.com/index/memory-and-new-controls-for-chatgpt/, https://help.openai.com/en/articles/8983136-what-is-memory, https://embracethered.com/blog/posts/2025/chatgpt-how-does-chat-history-memory-preferences-work/

### Claude (Anthropic)
- **File-based architecture**: CLAUDE.md files for persistent instructions; simple Markdown loaded into context window at session start
- **Auto memory**: Accumulates learnings automatically from corrections and preferences
- **Memory tool**: Enables store/retrieve across conversations via a memory file directory (create, read, update, delete)
- **MCP integration**: MCP servers provide standardized tool interfaces (search, timeline, get_observations)
- **Key distinction**: Memory = persistent identity; MCP = real-time task-specific tool access
- **Community extensions**: Claude-Mem (compression system preserving context across sessions), memsearch plugin (Milvus-backed persistent memory)
- Sources: https://code.claude.com/docs/en/memory, https://platform.claude.com/docs/en/agents-and-tools/tool-use/memory-tool, https://www.mintlify.com/blog/how-claudes-memory-and-mcp-work

### Gemini (Google)
- **Personal context**: Periodically generates compressed user profile capturing themes, preferences, facts, patterns
- **Memory learning**: Setting allows Gemini to learn from past conversations (on by default)
- **Personal Intelligence** (Gemini 3, January 2026): Includes insights from Gmail, Photos, Search history, past Gemini chats
- **Memory import** (March 2026): Can import memories and chat history from ChatGPT and Claude via prompt-copy method
- **Privacy**: Users can turn personal context on/off; temporary chats available
- Sources: https://blog.google/innovation-and-ai/products/gemini-app/switch-to-gemini-app/, https://support.google.com/gemini/answer/16598623, https://blog.google/products/gemini/temporary-chats-privacy-controls/

### Data Portability Race (2026)
- Gemini launched memory import from ChatGPT/Claude (March 2026)
- Anthropic deployed similar import feature three weeks earlier
- The AI market has shifted from "smartest assistant" to "user stickiness" — memory creates lock-in
- Import tools represent a shift toward user data portability
- Source: https://winbuzzer.com/2026/03/27/google-gemini-imports-chats-memory-chatgpt-claude-xcxwbn/

---

## 6. Latest Research on Long-Term Memory for AI Agents

### Major Survey: "Memory in the Age of AI Agents" (December 2025)
- Distinguishes agent memory from LLM memory, RAG, and context engineering
- Proposes taxonomy: Forms (token-level, parametric, latent), Functions (factual, experiential, working), Dynamics (formation, evolution, retrieval)
- Identifies frontiers: memory automation, RL integration, multimodal memory, multi-agent coordination, trustworthiness
- Paper list maintained at: https://github.com/Shichun-Liu/Agent-Memory-Paper-List
- Source: https://arxiv.org/abs/2512.13564

### A-MEM: Agentic Memory for LLM Agents (NeurIPS 2025)
- Proposes self-organizing memory using Zettelkasten-inspired interconnected knowledge networks
- When new memory added, generates comprehensive note with contextual descriptions, keywords, tags
- Doubles performance on complex multi-hop reasoning tasks
- Cost-effective despite multiple LLM calls during memory processing
- Authors: Wujiang Xu, Zujie Liang, Kai Mei, Hang Gao, Juntao Tan, Yongfeng Zhang
- Source: https://arxiv.org/abs/2502.12110

### Mem0 Research Paper (April 2025)
- "Building Production-Ready AI Agents with Scalable Long-Term Memory"
- Documents architecture for production memory systems at scale
- Source: https://arxiv.org/html/2504.19413v1

### Memoria: Scalable Agentic Memory for Personalized Conversational AI (December 2025)
- Framework focused on personalization through scalable agentic memory
- Source: https://arxiv.org/abs/2512.12686

### Notable 2025-2026 Research Directions
- **MemRL**: Self-Evolving Agents via Runtime Reinforcement Learning on Episodic Memory (January 2026)
- **EverMemOS**: Self-Organizing Memory Operating System for Structured Long-Horizon Reasoning (January 2026)
- **MemSearcher**: Training LLMs to Reason, Search and Manage Memory via End-to-End RL (2025)
- **PRIME**: Planning and Retrieval-Integrated Memory for Enhanced Reasoning (2025)
- **MemVerse**: Multimodal Memory for Lifelong Learning Agents (2025)
- **Human-Like Remembering and Forgetting**: ACT-R-Inspired Memory Architecture (HAI 2025)
- Source: https://github.com/Shichun-Liu/Agent-Memory-Paper-List

### Key Research Insight
The field is moving from "memory as storage" to "memory as a cognitive substrate" — memory that actively shapes agent behavior, not just stores data. The consolidation wave approaching this space mirrors the vector database consolidation of 2022-2023.

---

## 7. RAG vs Memory — How They Relate and Differ

### The Evolution: RAG → Agentic RAG → Agent Memory

**RAG (Read-Only, One-Shot)**
- Offline document indexing → query-time retrieval → generation
- Single retrieval pass, no refinement
- Data remains static, stored offline
- Answers: "What do trusted sources say?"

**Agentic RAG (Read-Only, Dynamic)**
- Agent decides *whether* and *when* to retrieve
- Can select from multiple retrieval sources
- Can assess relevance before generating response
- Still read-only — no learning during interaction

**Agent Memory (Read-Write, Dynamic)**
- Adds write capabilities alongside retrieval
- Store, update, and delete information *during inference*
- Dynamic learning and personalization from interactions
- Answers: "Who is the user and what happened before?"

Source: https://www.leoniemonigatti.com/blog/from-rag-to-agent-memory.html

### Key Differences Table
| Aspect | RAG | Agentic RAG | Agent Memory |
|---|---|---|---|
| Storage | Offline ingestion | Offline ingestion | Dynamic during inference |
| Retrieval | One-shot automatic | Tool-based dynamic | Tool-based dynamic |
| Modification | Manual only | Manual only | Dynamic via tool calls |
| Focus | Retrieval techniques | When to retrieve | Information management (CRUD) |

### Complementary, Not Competing
- Long-term memory handles personal context and session continuity
- RAG provides current factual knowledge and domain expertise
- Production systems should use both together
- "By using long-memory and RAG together, your agent can deliver both personalized experiences through remembered context and reliable information through real-time knowledge retrieval"
- Source: https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory-ltm-rag.html

### 2026 Trend: Context Windows vs RAG vs Memory
- Million-token context windows reduce some RAG use cases
- But context is ephemeral; memory persists
- Agentic/long-context memory may surpass RAG for agentic AI usage
- The correct framing: "memory as information management, not just retrieval"
- Source: https://ragflow.io/blog/rag-review-2025-from-rag-to-context

---

## 8. Vector Databases for Agent Memory

### Market Landscape (2026)

**Pinecone**
- Fully managed, serverless
- Best for: Enterprise scalability, ease of use
- Strengths: Stable performance, managed infrastructure, strong ecosystem
- Trade-off: Higher cost, vendor lock-in

**Weaviate**
- Open source, supports native hybrid search (BlockMax WAND + RSF)
- Best for: Hybrid search combining vector + keyword
- Self-hosted or cloud options

**Qdrant**
- Open source, high-performance
- v1.9+: Named vector hybrid search
- At 50M vectors: 41.47 QPS at 99% recall
- HTTP API with powerful metadata filtering

**Chroma**
- Open source, simple to start
- Best for: Rapid prototyping, smaller teams
- Lightweight, developer-friendly

**pgvector / pgvectorscale**
- PostgreSQL extension
- StreamingDiskANN makes it production-viable in 2026
- 75% cost advantage over Pinecone at 50M vectors
- Best for: Teams already using Postgres

**Milvus / Zilliz Cloud**
- Open source, optimized for billions of vectors
- Best cost efficiency at scale
- Milvus 2.5+: Native Sparse-BM25 hybrid search
- Led in low-latency benchmarks

**LanceDB**
- Supports native hybrid search
- Emerging contender for agent memory

**Redis**
- In-memory vector search for hot tier
- Sub-millisecond latency
- Best for: Working/conversation memory

Sources: https://www.firecrawl.dev/blog/best-vector-databases, https://encore.dev/articles/best-vector-databases, https://letsdatascience.com/blog/vector-databases-compared-pinecone-qdrant-weaviate-milvus-and-more

### Performance Benchmarks
- Most databases deliver 10-100ms query times on 1M-10M vector datasets
- Milvus/Zilliz led in low latency; Pinecone and Qdrant close behind
- pgvectorscale's StreamingDiskANN: 471 QPS vs Qdrant's 41.47 QPS at 50M vectors
- Native hybrid search now standard: Weaviate, Milvus 2.5+, Qdrant v1.9+, LanceDB, Pinecone all support it

### Vector DB Selection for Agent Memory
| Use Case | Recommended |
|---|---|
| Quick prototyping | Chroma |
| Already using Postgres | pgvector/pgvectorscale |
| Enterprise managed | Pinecone |
| Hybrid search priority | Weaviate |
| High performance + open source | Qdrant |
| Billions of vectors | Milvus |
| Hot tier / working memory | Redis |

### Emerging Pattern: Beyond Pure Vector
- Leading systems combine vector search with graph databases
- Vector DBs handle initial retrieval; graph traversal handles relationship reasoning
- "Always On Memory Agent" (open-sourced by Google PM) ditches vector databases entirely, using LLM-driven structured memory instead
- Hybrid approaches like Mem0 and Letta combine structured memory with embedding-based retrieval
- Source: https://venturebeat.com/orchestration/google-pm-open-sources-always-on-memory-agent-ditching-vector-databases-for/

---

## Additional Notes

### EU AI Act Implications (Effective August 2, 2026)
- Memory systems storing personal data must comply with EU AI Act
- Local-first systems (SuperLocalMemory Mode A) achieve compliance by architecture
- Cloud-based systems require Data Processing Agreements and additional legal/technical measures
- Source: https://dev.to/varun_pratapbhardwaj_b13/5-ai-agent-memory-systems-compared-mem0-zep-letta-supermemory-superlocalmemory-2026-benchmark-59p3

### Quick-Start Recommendations (from research)
- **Quick prototyping**: Mem0 + LangGraph
- **Production deployment**: Mem0 or AWS AgentCore Memory
- **Advanced self-improving agents**: Add graph memory + ACE loops
- **Privacy-first**: SuperLocalMemory Mode A or self-hosted Letta
- **Enterprise**: Zep (temporal reasoning) or AWS AgentCore (managed)
- **Framework lock-in concerns**: Graphlit (framework-agnostic)
- Source: https://47billion.com/blog/ai-agent-memory-types-implementation-best-practices/
