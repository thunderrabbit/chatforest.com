# MCP in Real Estate: Comprehensive Research
## Research Date: 2026-03-29
## Status: Research only — nothing tested hands-on

---

## TABLE OF CONTENTS
1. [MLS/Property Data MCP Servers](#1-mlsproperty-data-mcp-servers)
2. [Property Management MCP Servers](#2-property-management-mcp-servers)
3. [Real Estate CRM MCP Servers](#3-real-estate-crm-mcp-servers)
4. [Valuation/Appraisal MCP Servers](#4-valuationappraisal-mcp-servers)
5. [Mortgage/Lending MCP Servers](#5-mortgagelending-mcp-servers)
6. [Construction/Development MCP Servers](#6-constructiondevelopment-mcp-servers)
7. [Commercial Real Estate MCP Servers](#7-commercial-real-estate-mcp-servers)
8. [Smart Building/PropTech MCP Servers](#8-smart-buildingproptech-mcp-servers)
9. [Document/Transaction MCP Servers](#9-documenttransaction-mcp-servers)
10. [Geographic/Location MCP Servers](#10-geographiclocation-mcp-servers)
11. [Multi-Platform / Aggregator MCP Servers](#11-multi-platform--aggregator-mcp-servers)
12. [Market Data: AI in Real Estate](#12-market-data-ai-in-real-estate)
13. [PropTech AI Trends and Statistics](#13-proptech-ai-trends-and-statistics)
14. [Notable RE AI Companies and MCP Plans](#14-notable-re-ai-companies-and-mcp-plans)
15. [Official MCP Integrations by Major RE Platforms](#15-official-mcp-integrations-by-major-re-platforms)

---

## 1. MLS/PROPERTY DATA MCP SERVERS

### ATTOM MCP Server
- **Type**: Official/Commercial (first large-scale RE data company to launch MCP)
- **Launched**: January 29, 2026
- **Coverage**: 158 million U.S. properties (99% of population)
- **Data Types**: Property details, AVMs, comparable sales, sales history, tax, deed, mortgage, foreclosure, environmental risk, natural hazard, neighborhood/geospatial boundaries
- **Maturity**: Production — enterprise-grade
- **Key Feature**: Multi-sourced data validated through 20-step process, linked by unique ATTOM ID
- **Industries Served**: Real estate, fintech, government, insurance
- **GitHub Stars**: N/A (commercial product)
- **Source**: https://www.attomdata.com/solutions/mcp-server/

### UNLOCK MLS RESO Reference MCP Server (GumpperGroup)
- **GitHub**: https://github.com/GumpperGroup/unlock-reso-mcp-remote
- **Stars**: 1 | **Forks**: 0
- **Type**: Community/Reference implementation
- **Tools (4)**: search_properties, get_property_details, analyze_market, find_agent
- **Resources (8+)**: Property search examples, property types, market analysis guides, agent search, workflow patterns, API status
- **Tech Stack**: Python 3.11+, uv, httpx, pydantic, MCP SDK
- **Standard**: RESO Data Dictionary 2.0 via Bridge Interactive's RESO Web API
- **Features**: Natural language search ("3 bedroom house under $500k in Austin TX"), advanced filtering, price trend analysis, inventory analysis, investment metrics
- **Background**: Built by David Gumpper (WAV Group technology consulting lead, former CTO of Michael Saunders & Company) as a reference implementation using UNLOCK MLS test server
- **Maturity**: Reference/demo — not production MLS deployment
- **Source**: https://www.wavgroup.com/2025/07/31/mls-mcp-servers-are-here-see-the-one-david-gumpper-built-for-real-estate-ai/

### Constellation1 MCP Server
- **Type**: Commercial/Official platform
- **GitHub**: david-pivonka-constellation1-mcp-server (LobeHub listing)
- **Tools**: reso_query (query RESO entities with full OData support), reso_help (field references, examples, best practices)
- **Data Access**: Properties, Agents, Offices, Media, Market Analytics
- **Standard**: RESO-standardized interfaces with full OData querying, filtering, sorting, field selection
- **Coverage**: 100% US, 90% Canada
- **Auth**: Requires CONSTELLATION1_CLIENT_ID and CONSTELLATION1_CLIENT_SECRET
- **Background**: Constellation1 provides RE tech solutions for brokerages, franchises, and MLSs across North America. Redfin chose Constellation1 for MLS data aggregation (2022).
- **Maturity**: Production platform
- **Source**: https://lobehub.com/mcp/david-pivonka-constellation1-mcp-server

### BatchData MCP Server
- **GitHub**: https://github.com/zellerhaus/batchdata-mcp-real-estate
- **Stars**: 28 | **Forks**: 7
- **Type**: Community (integrates with commercial BatchData.io API)
- **Tools (8)**:
  - Address: verify-address, autocomplete-address, geocode-address, reverse-geocode
  - Property: lookup-property, search-properties, search-properties-by-boundary, count-properties
- **Coverage**: 155+ million US properties
- **Data**: Property characteristics, ownership, transaction history, tax assessments, mortgage details
- **Tech Stack**: TypeScript, Node.js, @modelcontextprotocol/sdk, Zod, Docker
- **License**: MIT
- **Auth**: BATCHDATA_API_KEY required
- **Install**: `npx -y @smithery/cli install @zellerhaus/batchdata-mcp-real-estate --client claude`
- **Maturity**: Production-quality community server
- **Source**: https://batchdata.io/mcp-server

### Zillow MCP Server (sap156)
- **GitHub**: https://github.com/sap156/zillow-mcp-server
- **Stars**: 34 | **Forks**: 8
- **Type**: Community
- **Tools (7)**: search_properties, get_property_details, get_zestimate, get_market_trends, calculate_mortgage, check_health, get_server_tools
- **Tech Stack**: Python (FastMCP), Requests, Backoff, python-dotenv, Docker
- **API**: Connects via "Zillow Bridge API" (requires API key from api@bridgeinteractive.com)
- **Features**: Property search with location/price/bedroom/bathroom/home-type filters, Zestimate valuations, market trends, mortgage calculator
- **Note**: Dynamic queries only — complies with Zillow's terms prohibiting local data storage
- **Maturity**: Active community project
- **Source**: https://github.com/sap156/zillow-mcp-server

### Comprehensive Real Estate MCP Server (agentic-ops)
- **GitHub**: https://github.com/agentic-ops/real-estate-mcp
- **Stars**: 30 | **Forks**: 10
- **Type**: Community/Demo
- **Tools (30+)** across 6 categories:
  - Property Management (7): search, filtering, insights, area-based listings
  - Agent Operations (6): profiles, performance dashboards, portfolio management
  - Market Analysis (7): overview, price analytics, opportunity assessment
  - Client Management (3): preference matching, property recommendations
  - Area Intelligence (9): reports, amenities, schools, parks, healthcare data
  - System Management (2): data refresh, cache management, statistics
- **Resources (10)**: 5 static (all-properties, all-agents, market-overview, all-areas, amenities) + 5 dynamic templates
- **Prompts (11)**: Property (2), Client (3), Market (3), Agent (3) — analysis, comparison, matching, consultation, reports, investment analysis
- **Tech Stack**: Python, FastMCP, JSON data files, pytest, GitHub Actions
- **Transport**: STDIO (default) + SSE (remote access)
- **Maturity**: Demo showcase — modular architecture with production-ready patterns
- **Source**: https://github.com/agentic-ops/real-estate-mcp

### Real Estate Intelligence System (DanielJandric)
- **GitHub**: https://github.com/DanielJandric/realestatemcp
- **Stars**: 0 | **Forks**: 0
- **Type**: Community/specialized
- **Tools (7)**: Semantic search, property analytics, servitude analysis, complex queries, document categorization, tenant retrieval, maintenance contract analysis
- **Data**: 31,605 document chunks with OpenAI embeddings, 8 properties, 463 units, 95 leases, 653+ documents, 68 land registry extracts
- **Tech Stack**: Python 3.11+, Supabase (PostgreSQL + pgvector), OpenAI text-embedding-ada-002, Azure Document Intelligence (OCR)
- **Features**: 100% local operation, automatic servitude extraction from land registry docs, semantic search
- **Maturity**: Production-ready for specific use case (European property management)
- **Source**: https://github.com/DanielJandric/realestatemcp

### RentCast MCP Server
- **GitHub**: https://github.com/robcerda/rentcast-mcp-server (also: tandat8503/mcp_rentcast)
- **Type**: Community (integrates with commercial RentCast API)
- **Tools**: get_property_data, get_property_valuation, get_rent_estimate, get_market_statistics, get_property_listings
- **Coverage**: 140+ million US properties
- **Features**: Instant home value and rent estimates (AVM), rent estimate ranges with comparable listings, market statistics by ZIP code
- **Maturity**: Active
- **Source**: https://www.rentcast.io/

### MLS Systems Building MCP Servers (In Progress)
- **UtahRealEstate.com**: First MLS to announce an MCP server launch (September 2025). CEO Brad Bjelke leads initiative. Philosophy of "technology sovereignty" — MLSs controlling AI infrastructure. Not yet production as of early 2026.
- **NorthstarMLS**: Close to completion. Partner of reDataExport (founded by UtahRealEstate.com in January 2025). NorthstarMLS was first customer.
- **Status**: As of late 2025, no MLS had a production-ready MCP server live in the field. Both were reported "close to completion."
- **Source**: https://www.wavgroup.com/2025/09/16/utahrealestate-com-to-launch-an-mcp-server/

---

## 2. PROPERTY MANAGEMENT MCP SERVERS

### Current Status: No Dedicated MCP Servers Found

No MCP servers specifically targeting AppFolio, Buildium, Yardi, RentManager, or other property management platforms were found in research.

### Closest Alternative:
- **DanielJandric/realestatemcp** (above) — handles property management tasks including tenant management, lease tracking, maintenance contracts, but is a custom implementation, not a connector to major PM platforms.

### Gap Analysis:
The property management software market is large (AppFolio, Buildium, Yardi are market leaders), but none have announced official MCP server support. This represents a significant gap in the MCP real estate ecosystem. These platforms have REST APIs that could serve as foundations for community MCP servers.

---

## 3. REAL ESTATE CRM MCP SERVERS

### HubSpot MCP Server (Official)
- **URL**: https://developers.hubspot.com/mcp
- **Type**: Official (first major CRM to ship production-grade MCP)
- **Tools**: 100+ tools across contacts, companies, deals, and other data types
- **Access**: Read-only (no write operations as of research date)
- **Auth**: OAuth 2.1 with PKCE planned
- **Milestone**: June 2025 — launched "deep research" connector for ChatGPT
- **RE Relevance**: HubSpot is widely used by real estate teams and brokerages as a general CRM
- **Maturity**: Production
- **Source**: https://developers.hubspot.com/mcp

### Salesforce MCP Server (Official)
- **Type**: Official but access restricted to Agentforce (internal AI agent framework)
- **Tools**: 60+ tools
- **Access**: Full CRUD (create, update, delete) — more capable than HubSpot
- **RE Relevance**: Salesforce is used by large brokerages and commercial RE firms
- **Note**: General-purpose MCP server restricted to controlled use within Agentforce
- **Maturity**: Production (limited access)
- **Source**: https://www.salesforceben.com/salesforce-model-context-protocol-explained-how-mcp-bridges-ai-and-your-crm/

### RE-Specific CRMs: No MCP Servers Found
- **Follow Up Boss**: No MCP server announced. Has REST API.
- **kvCORE/Lofty**: No MCP server announced. Has API integrations.
- **LionDesk**: No MCP server announced (LionDesk reportedly struggling/declining in 2026).
- **Real Geeks**: No MCP server announced.
- **Wise Agent**: No MCP server announced.

### Gap Analysis:
Real estate-specific CRMs have not adopted MCP. Agents using these platforms would need to use general CRM MCP servers (HubSpot, Salesforce) or wait for integrations. This is a significant opportunity for RE CRM vendors or community developers.

---

## 4. VALUATION/APPRAISAL MCP SERVERS

### PriceHubble MCP Server
- **Type**: Official/Commercial (enterprise)
- **Status**: Early-access beta starting Q1 2026
- **Features**: Property data, valuations, market comparables
- **Coverage**: 11 countries, 800+ enterprise clients
- **Capabilities**: Automated property valuations (AVM), market forecasts, portfolio optimization, energy performance assessments
- **Compliance**: ISO 27001, GDPR, NIST AI Risk Management Framework
- **Maturity**: Beta (enterprise)
- **Source**: https://www.pricehubble.com/pricehubble-news/pricehubble-launches-model-context-protocol

### ATTOM MCP Server (Valuation Component)
- **AVM Tools**: Included in ATTOM's MCP server (see Section 1)
- **Features**: AVMs, comparable sales data for 158M US properties
- **Maturity**: Production

### Zillow MCP Server (Zestimate Component)
- **Tool**: get_zestimate — access to Zillow's proprietary home valuation estimates
- **Details**: See Section 1 (sap156/zillow-mcp-server)

### RentCast MCP Server (Valuation Component)
- **Tool**: get_property_valuation, get_rent_estimate
- **Details**: See Section 1

### Gap Analysis:
No dedicated MCP server exists solely for appraisal workflows (e.g., URAR form generation, adjustment grids, appraisal management). The existing valuation MCP servers focus on AVMs rather than traditional appraisal processes.

---

## 5. MORTGAGE/LENDING MCP SERVERS

### Confer Solutions MCP Mortgage Server
- **GitHub**: https://github.com/confersolutions/mcp-mortgage-server
- **Stars**: 2 | **Forks**: 1
- **Type**: Community/Commercial
- **Version**: 2.0.0 (major rewrite March 2025)
- **Tools (4)**: hello, parse_loan_estimate, parse_closing_disclosure, compare_le_cd
- **Features**: Parses Loan Estimate (LE) and Closing Disclosure (CD) PDFs into MISMO-compliant JSON with LLM-enriched context. TRID compliance verification.
- **Tech Stack**: Python 3.10+, MCP SDK, Pydantic, JSON-RPC 2.0 via stdio
- **Security**: HTTPS-only URLs, domain whitelisting (SSRF prevention), 10MB size limits, 30-second timeouts
- **License**: MIT
- **Maturity**: Production-ready core, v2.1.0 in progress
- **Source**: https://github.com/confersolutions/mcp-mortgage-server

### RateSpot MCP Server
- **Type**: Commercial API with MCP support
- **Features**: Real-time mortgage rates from leading PPE brokers (Bankrate.com, Icanbuy.com, Zillow)
- **Capabilities**: Fetch current rates, compare loan products, calculate monthly payment breakdowns, access lender information
- **Data Source**: 4,300+ lenders
- **Use Cases**: AI-powered financial advisors, mortgage query chatbots, automated loan pre-qualification
- **Source**: https://dxt.so/dxts/ratespot-mcp / https://www.ratespot.io/

### RateAPI MCP Server
- **URL**: https://rateapi.dev/
- **Type**: Commercial with free tier
- **Features**: Real-time mortgage rates from 4,300+ lenders with native MCP support for Claude
- **Free Tier**: 50 requests/month
- **Coverage**: Mortgages, auto loans, HELOCs, personal loans, credit cards
- **Maturity**: Production

### Homebuyer.com MCP Server
- **URL**: https://homebuyer.com/developers
- **Type**: Free for non-commercial use
- **Tools (8)**: Mortgage data tools, including HMDA queries (121M+ mortgage records via BigQuery)
- **Auth**: No API key needed for 7 of 8 tools. Free API key for HMDA tool (higher rate limit: 100 vs 20 req/min)
- **Clients**: Claude, Cursor, Windsurf, and other MCP clients
- **Maturity**: Production
- **Source**: https://homebuyer.com/developers

### TinyFn Financial Calculations MCP
- **Type**: General financial tools via MCP
- **RE-Relevant**: Mortgage calculation, loan amortization, interest calculation
- **Source**: https://tinyfn.io/blog/mcp-financial-calculations

---

## 6. CONSTRUCTION/DEVELOPMENT MCP SERVERS

### Current Status: No Dedicated MCP Servers Found

No MCP servers were found specifically for:
- Construction project management (Procore, PlanGrid, etc.)
- Building permit/zoning data APIs
- Construction cost estimation
- Material management

### Gap Analysis:
This is a significant gap. The construction tech industry has APIs (Procore has REST APIs, permit data is available through various municipal APIs), but no MCP adapters exist yet. Zoning and permitting data remains fragmented across thousands of local jurisdictions.

---

## 7. COMMERCIAL REAL ESTATE MCP SERVERS

### LoopNet MCP Server (johnstenner)
- **GitHub**: https://github.com/johnstenner/LoopnetMCP
- **Stars**: 1 | **Forks**: 0
- **Type**: Community (scraping-based, no official API)
- **Tools (3)**: Search properties, property details, market overview
- **Property Types**: Office, retail, industrial, multifamily, land, hospitality, special-purpose, healthcare
- **Listing Types**: For-sale, for-lease
- **Locations**: City/state, state abbreviation, or zip code
- **Tech Stack**: Python, FastMCP v2, curl_cffi, nodriver (headless Chrome), BeautifulSoup4, lxml, Pydantic v2
- **Anti-Bot**: Handles Akamai Bot Manager (TLS fingerprint bypass + JS challenge solving)
- **License**: MIT
- **Limitations**: First-page results only, 5-min cache TTL, CAPTCHA may cause failures
- **Maturity**: Early/experimental
- **Source**: https://github.com/johnstenner/LoopnetMCP

### CoStar: No Official MCP Server
- CoStar Group has not announced an MCP server
- CoStar launched AI experience on Homes.com (February 2026) powered by Microsoft Foundry — conversational home search by voice/text
- AI investment across businesses is part of 2026 strategy
- CRE-specific MCP adoption still in early stages

### ARGUS: No MCP Server Found
- No MCP integration announced for ARGUS (financial modeling for CRE)

### Gap Analysis:
Commercial real estate has minimal MCP coverage. The LoopNet scraper is experimental, and major platforms (CoStar, ARGUS, Yardi Matrix, RCA) have no MCP servers. CRE professionals noted MCP as important to watch but adoption is early-stage.

---

## 8. SMART BUILDING/PROPTECH MCP SERVERS

### ProptechOS MCP Integration
- **Type**: Official/Commercial platform
- **Standard**: Uses RealEstateCore + Model Context Protocol (MCP)
- **Features**: AI agents interact with building systems through MCP; data harmonized using RealEstateCore open standard
- **Capabilities**: Energy optimization, indoor climate queries, building availability, ESG compliance, tenant experience
- **Architecture**: Digital twin technology collecting real-time data from BMS, BIM, IoT devices
- **Products**: Energy Toolbox, Operational Efficiency, Tenant Experience, Sustainability & Compliance
- **Integration**: "Agentic Proptech" — AI agents investigate, reason, and act across portfolios
- **Maturity**: Production (commercial platform)
- **Source**: https://proptechos.com/

### Gap Analysis:
ProptechOS is the most notable smart building platform embracing MCP. Other BMS/IoT platforms (Siemens, Honeywell, Johnson Controls) have not announced MCP support. This is an emerging area where MCP could standardize AI-building communication.

---

## 9. DOCUMENT/TRANSACTION MCP SERVERS

### DocuSign MCP Server (Official)
- **URL**: https://developers.docusign.com/platform/mcp-server/
- **Type**: Official (Beta)
- **Status**: Beta — available in Claude Connectors Directory
- **Features**: Natural language interactions with DocuSign's agreement and workflow capabilities
- **Capabilities**: IAM and eSignature, document sending, agreement status tracking, template management, workflow automation
- **Integration**: Powers DocuSign's integration with ChatGPT
- **Auth**: Operates within established authentication and permission boundaries
- **Source**: https://developers.docusign.com/platform/mcp-server/

### DocuSign MCP Server (CData)
- **GitHub**: https://github.com/CDataSoftware/docusign-mcp-server-by-cdata
- **Type**: Community (read-only)
- **Tech**: Connects via CData JDBC Drivers
- **Source**: https://github.com/CDataSoftware/docusign-mcp-server-by-cdata

### DocuSign MCP Server (Luther Systems)
- **GitHub**: https://github.com/luthersystems/mcp-server-docusign
- **Type**: Community
- **Tech**: FastMCP with JWT server-to-server authentication
- **Source**: https://github.com/luthersystems/mcp-server-docusign

### DocuSign via Composio
- **Type**: Third-party integration platform
- **Features**: Send documents for eSignature, track agreement status, manage templates, automate workflows through natural language
- **Clients**: Claude, ChatGPT, Cursor, etc.
- **Source**: https://mcp.composio.dev/docusign

### Dotloop: No MCP Server Found
- Dotloop (owned by Zillow Group) has no announced MCP server
- Has connections to ~200 MLS and realtor association feeds
- Strong in RE transaction management but no AI/MCP integration yet

### Gap Analysis:
DocuSign is well-covered with official + community MCP servers. Dotloop, SkySlope, and other RE-specific transaction management platforms lack MCP support.

---

## 10. GEOGRAPHIC/LOCATION MCP SERVERS

### GIS MCP Server (mahdin75)
- **GitHub**: https://github.com/mahdin75/gis-mcp
- **Stars**: 126 | **Forks**: 41
- **Type**: Community (most-starred GIS MCP server)
- **Tools (95)** across libraries:
  - Shapely: 29 functions (geometry operations)
  - PyProj: 13 functions (coordinate transformations)
  - GeoPandas: 13 functions (spatial data analysis)
  - Rasterio: 20 functions (raster processing)
  - PySAL: 18 functions (spatial statistics, autocorrelation, clustering)
  - Visualization: 2 functions (Folium, PyDeck)
- **Tech Stack**: Python 3.10+, Shapely, PyProj, GeoPandas, Rasterio, PySAL
- **Transport**: STDIO, HTTP, SSE
- **Version**: 0.14.0 Beta
- **RE Applications**: Neighborhood analysis via PySAL clustering, spatial overlays for property analysis, proximity checks, buffer analysis for development
- **Source**: https://github.com/mahdin75/gis-mcp

### CARTO MCP Server
- **Type**: Official/Commercial
- **Features**: Bridges geospatial workflows with AI agents; exposes CARTO Workflows as MCP Tools
- **RE Use Case**: Site selection analysis, neighborhood demographic analysis, retail planning, investment analysis with interactive maps
- **Example Query**: "Which Maryland counties have high income, favorable demographics, and limited competition?"
- **Standard**: MCP-compliant, works with Gemini, ChatGPT, Claude
- **Governance**: Enterprise-grade data governance + conversational AI
- **Maturity**: Production (commercial platform)
- **Source**: https://carto.com/blog/carto-mcp-server-turn-your-ai-agents-into-geospatial-experts

### ArcGIS Location Services MCP Server
- **Type**: Community (integrates with Esri's ArcGIS platform)
- **Tools (6+)**: Geocoding, reverse geocoding, nearby places, directions, elevation data, basemap tiles
- **Backend**: Esri's ArcGIS Location Platform (PaaS)
- **Auth**: ArcGIS Developer API key required
- **Install**: Via Smithery
- **RE Applications**: Property geocoding, commute/directions analysis, elevation data for flood risk, POI proximity
- **Source**: https://mcp.so/server/arcgis-location-services-mcp/puran1218

### Google Maps MCP Servers (Multiple)
- **Comprehensive Version (vicpeacock)**: https://github.com/vicpeacock/google-maps-comprehensive-mcp — 8 tools
- **Extended Version (cablate)**: https://github.com/cablate/mcp-google-map — 18 tools (batch geocoding up to 50 addresses)
- **Official (Anthropic-listed)**: Via modelcontextprotocol org
- **Tools**: geocode, reverse_geocode, search_places, place_details, distance_matrix, elevation, directions
- **Auth**: Google Cloud API key (enable Places API + Routes API)
- **RE Applications**: Property address verification, neighborhood POI analysis, commute time calculations, school/amenity proximity
- **Source**: Various GitHub repos

### Walk Score / Neighborhood Data: No Dedicated MCP Server
- Walk Score, GreatSchools, NeighborhoodScout, and Census data lack dedicated MCP servers
- Some data is accessible through GIS MCP servers or general web scraping MCP servers
- EPA Smart Location Database (90+ neighborhood indicators) has no MCP adapter

---

## 11. MULTI-PLATFORM / AGGREGATOR MCP SERVERS

### Real Estate Aggregator (Apify - sovereigntaylor)
- **Platform**: Apify
- **Sources**: Zillow + Redfin + Realtor.com
- **Features**: Scrapes listings, de-duplicates by address, unifies property data
- **Analytics**: Median price, price per sqft, days on market
- **Pricing**: Pay-per-event ($0.01 per tool call)
- **Source**: https://apify.com/sovereigntaylor/real-estate-aggregator/api/mcp

### Bright Data Real Estate MCP Server
- **Type**: Commercial
- **GitHub**: https://github.com/brightdata/brightdata-mcp (general) + https://github.com/brightdata/real-estate-ai-agent
- **Tools**: 60+ specialized web tools
- **Features**: Proxy rotation, CAPTCHA solving, anti-blocking technology
- **RE Agent**: Python-based system using AI agents + Bright Data MCP for structured property data extraction
- **Source**: https://brightdata.com/ai/mcp-server/real-estate

### Apify Real Estate Scrapers (Multiple)
- **Redfin Scraper**: Property details, pricing, location data, photos, market insights — https://apify.com/automation-lab/redfin-scraper/api/mcp
- **Zillow Scraper**: Property listings, prices, details — https://apify.com/automation-lab/zillow-scraper/api/mcp
- **Real Estate Scraper (whitewalk)**: Zillow + Redfin + Realtor.com — https://apify.com/whitewalk/real-estate-scraper/api/mcp
- **AI Real Estate Agent**: Realtor.com scraping including agent profiles — https://apify.com/harvestlabs/ai-real-estate-agent/api/mcp

### Real Estate Investment MCP Server (ericnsibley)
- **GitHub**: https://github.com/ericnsibley/GenAI_MCP
- **Stars**: 1
- **Type**: Community
- **Data**: Zillow ZHVI, ZHVF, ZORI, ZORF stored in local SQLite
- **Tech Stack**: Python, FastAPI, htmx, Jinja, LangChain, LangGraph, SQLite
- **Features**: Property value analysis, rent index exploration, market forecasting
- **Demo**: rick-ml.com/real-estate-chat
- **Maturity**: Demo/educational

---

## 12. MARKET DATA: AI IN REAL ESTATE

### Market Size Projections

| Metric | Value | Source |
|--------|-------|--------|
| AI in RE market (2025) | $303 billion | Research and Markets |
| AI in RE market (2029 projection) | ~$1 trillion | Research and Markets |
| AI in RE market (2030 projection) | $1,303 billion | Business Research Company (33.9% CAGR) |
| AI in RE market (2024→2033) | $2.9B → $41.5B | Alternate estimate |
| Generative AI in RE (2025) | $488 million | Precedence Research |
| Generative AI in RE (2035 projection) | $1,427 million | Precedence Research (11.33% CAGR) |
| PropTech market (2021) | $25.15 billion | Grand View Research |
| PropTech market (2026-2027 projection) | $40-47 billion | Multiple sources |
| PropTech market (2030 projection) | $80-168 billion | Multiple sources (varies by report) |
| AI efficiency gains by 2030 | $34 billion | Morgan Stanley |

### Investment Statistics
- AI-powered PropTech firms raised ~$3.2 billion in 2024
- 70% of recent PropTech deals include AI components

---

## 13. PROPTECH AI TRENDS AND STATISTICS

### Adoption Rates
- **CRE companies running AI pilots**: Grew from 5% to 92% in three years
- **Leading U.S. brokerages using AI (2024)**: 75%
- **AI could automate**: Up to 37% of real estate operations
- **Canadian business leaders using AI**: 93% (but only 2% reported ROI as of survey)

### Key Trends (2025-2026)
1. **Agentic AI** — AI agents that investigate, reason, and act autonomously across real estate workflows
2. **MCP adoption** — Standardizing how AI connects to RE data systems ("USB-C for AI in property")
3. **MCP reduces AI agent deployment time** by 40-60% with improved security/governance
4. **MLS MCP servers** — Industry-wide push for MLSs to offer governed AI access to listing data
5. **Conversational property search** — Redfin, CoStar/Homes.com, and others launching natural language search
6. **AI-native fulfillment** — Opendoor reducing underwriting from hours to under 10 minutes
7. **Open standards convergence** — RealEstateCore + MCP for smart buildings

---

## 14. NOTABLE RE AI COMPANIES AND MCP PLANS

### Major Platform Companies

| Company | AI Initiative | MCP Status |
|---------|-------------|------------|
| **Zillow Group** | Zestimates, AI search | Community MCP servers exist (sap156); LinkedIn post suggests official APIs/MCP released but unconfirmed |
| **Redfin** | Conversational search (Nov 2025), ChatGPT app (Feb 2026) | No official MCP server; third-party scrapers available |
| **CoStar Group** | Homes.com AI (Feb 2026, Microsoft Foundry), voice/text conversational search | No MCP server announced; AI across all businesses |
| **Compass** | AI "operating system" for agents, real-time data analysis | No MCP server announced |
| **Opendoor** | AI-Native Fulfillment engine, <10 min underwriting | No MCP server announced; pivoting to "software and AI company" |
| **Offerpad** | Predictive analytics, automation | No MCP server announced |
| **ATTOM** | First large-scale RE data MCP server (Jan 2026) | **Production MCP server** — industry first |
| **PriceHubble** | MCP suite for property valuations | **Beta MCP server** (Q1 2026) |
| **Constellation1** | MCP server for MLS/RESO data | **Production MCP server** |
| **ProptechOS** | MCP for smart buildings | **Production MCP integration** |

### RE-Adjacent Companies with MCP
| Company | MCP Status | RE Relevance |
|---------|-----------|-------------|
| **DocuSign** | Official MCP server (Beta) | Transaction documents, e-signatures |
| **HubSpot** | Official MCP server (Production, 100+ tools) | RE CRM workflows |
| **Salesforce** | Official MCP server (60+ tools, restricted to Agentforce) | Enterprise RE CRM |
| **Google Maps** | Multiple MCP servers | Location intelligence for RE |
| **CARTO** | Official MCP server | Geospatial RE analysis |
| **Bright Data** | MCP server (60+ tools) | RE data scraping |

---

## 15. OFFICIAL MCP INTEGRATIONS BY MAJOR RE PLATFORMS

### Confirmed Official MCP Servers/Integrations
1. **ATTOM** — First large-scale RE data company with production MCP server (Jan 2026)
2. **PriceHubble** — Valuation MCP suite (beta Q1 2026)
3. **Constellation1** — MLS/RESO data MCP server
4. **ProptechOS** — Smart building MCP integration using RealEstateCore
5. **DocuSign** — Official eSignature MCP server (beta)

### Announced/In Progress
6. **UtahRealEstate.com** — First MLS to announce MCP server (Sep 2025), close to completion
7. **NorthstarMLS** — Close to completion via reDataExport partnership

### No Official MCP Announced (Major Players)
- Zillow (community servers exist)
- Redfin (AI via ChatGPT app, not MCP)
- CoStar Group (AI focus but no MCP)
- Compass
- Realtor.com (Move/News Corp)
- Opendoor
- AppFolio, Buildium, Yardi (property management)
- Follow Up Boss, kvCORE, LionDesk (RE CRMs)
- Dotloop, SkySlope (transaction management)
- LoopNet (community scraper exists)
- ARGUS (CRE financial modeling)

---

## SUMMARY TABLE: ALL MCP SERVERS FOUND

| Server | Category | Stars | Tools | Type | Maturity |
|--------|----------|-------|-------|------|----------|
| ATTOM MCP Server | Property Data | N/A | Multiple | Official/Commercial | Production |
| BatchData MCP | Property Data | 28 | 8 | Community | Production |
| Zillow MCP (sap156) | Property Data | 34 | 7 | Community | Active |
| Real Estate MCP (agentic-ops) | Comprehensive | 30 | 30+ | Community/Demo | Demo |
| UNLOCK RESO MCP | MLS/RESO | 1 | 4 | Community/Reference | Reference |
| Constellation1 MCP | MLS/RESO | N/A | 2+ | Official | Production |
| RentCast MCP | Rental Data | N/A | 5 | Community | Active |
| Real Estate Intelligence (DanielJandric) | Property Mgmt | 0 | 7 | Community | Production-ready |
| PriceHubble MCP | Valuation | N/A | N/A | Official/Commercial | Beta |
| Confer Mortgage MCP | Mortgage Docs | 2 | 4 | Community | Production-ready |
| RateSpot MCP | Mortgage Rates | N/A | Multiple | Commercial | Production |
| RateAPI MCP | Mortgage Rates | N/A | Multiple | Commercial | Production |
| Homebuyer.com MCP | Mortgage Data | N/A | 8 | Free | Production |
| LoopNet MCP (johnstenner) | Commercial RE | 1 | 3 | Community | Early |
| DocuSign MCP (Official) | Documents | N/A | Multiple | Official | Beta |
| DocuSign MCP (CData) | Documents | N/A | Multiple | Community | Active |
| DocuSign MCP (Luther) | Documents | N/A | Multiple | Community | Active |
| GIS MCP (mahdin75) | Geographic | 126 | 95 | Community | Beta |
| CARTO MCP | Geographic | N/A | Variable | Official | Production |
| ArcGIS MCP | Geographic | N/A | 6+ | Community | Active |
| Google Maps MCP (multiple) | Geographic | N/A | 8-18 | Community | Active |
| ProptechOS | Smart Building | N/A | N/A | Official | Production |
| Real Estate Aggregator (Apify) | Aggregator | N/A | Multiple | Commercial | Production |
| Bright Data RE MCP | Scraping | N/A | 60+ | Commercial | Production |
| RE Investment MCP (ericnsibley) | Investment | 1 | Multiple | Community | Demo |

---

## KEY GAPS IN THE MCP REAL ESTATE ECOSYSTEM

1. **Property Management** — No MCP servers for AppFolio, Buildium, Yardi, or RentManager
2. **RE-Specific CRMs** — No MCP servers for Follow Up Boss, kvCORE, LionDesk
3. **Construction/Development** — No MCP servers for project management, permitting, or zoning data
4. **Commercial RE Platforms** — No official MCP for CoStar, ARGUS; only scraping-based LoopNet
5. **Appraisal Workflow** — No dedicated appraisal process MCP server (only AVMs)
6. **Transaction Management** — No MCP for dotloop, SkySlope, or other RE-specific platforms
7. **Neighborhood Data** — No MCP server for Walk Score, GreatSchools, or school ratings
8. **Census/Demographics** — No RE-focused demographic data MCP server
9. **HOA Management** — No MCP servers for HOA platforms
10. **Insurance/Risk** — No MCP servers for property insurance or hazard data (ATTOM covers some)

---

## SOURCES

### MLS/Property Data
- https://www.attomdata.com/solutions/mcp-server/
- https://github.com/GumpperGroup/unlock-reso-mcp-remote
- https://github.com/sap156/zillow-mcp-server
- https://github.com/agentic-ops/real-estate-mcp
- https://github.com/zellerhaus/batchdata-mcp-real-estate
- https://github.com/DanielJandric/realestatemcp
- https://lobehub.com/mcp/david-pivonka-constellation1-mcp-server
- https://www.wavgroup.com/2025/07/31/mls-mcp-servers-are-here-see-the-one-david-gumpper-built-for-real-estate-ai/
- https://www.wavgroup.com/2025/09/16/utahrealestate-com-to-launch-an-mcp-server/
- https://www.wavgroup.com/2026/02/20/ai-2-0-is-here-why-mlss-need-mcp-servers-now/
- https://batchdata.io/mcp-server
- https://www.rentcast.io/

### Mortgage/Lending
- https://github.com/confersolutions/mcp-mortgage-server
- https://rateapi.dev/
- https://dxt.so/dxts/ratespot-mcp
- https://homebuyer.com/developers

### Valuation
- https://www.pricehubble.com/pricehubble-news/pricehubble-launches-model-context-protocol

### Commercial RE
- https://github.com/johnstenner/LoopnetMCP
- https://www.adventuresincre.com/what-is-mcp-commercial-real-estate/

### Smart Buildings
- https://proptechos.com/
- https://proptechos.com/generative-proptech/

### Documents
- https://developers.docusign.com/platform/mcp-server/
- https://github.com/CDataSoftware/docusign-mcp-server-by-cdata
- https://github.com/luthersystems/mcp-server-docusign

### Geographic/Location
- https://github.com/mahdin75/gis-mcp
- https://carto.com/blog/carto-mcp-server-turn-your-ai-agents-into-geospatial-experts
- https://mcp.so/server/arcgis-location-services-mcp/puran1218

### CRM
- https://developers.hubspot.com/mcp
- https://www.salesforceben.com/salesforce-model-context-protocol-explained-how-mcp-bridges-ai-and-your-crm/

### Market Data
- https://www.thebusinessresearchcompany.com/report/ai-in-real-estate-global-market-report
- https://www.precedenceresearch.com/generative-ai-in-real-estate-market
- https://www.pwc.com/us/en/industries/financial-services/asset-wealth-management/real-estate/emerging-trends-in-real-estate-pwc-uli/trends/proptech-impact.html
- https://mev.com/blog/ai-in-proptech-real-estate-2025-trends-use-cases
- https://commercialobserver.com/2025/12/2026-proptech-predictions-ai/

### Aggregators/Scraping
- https://apify.com/sovereigntaylor/real-estate-aggregator/api/mcp
- https://brightdata.com/ai/mcp-server/real-estate

### Companies
- https://homesage.ai/top-mcps-transforming-real-estate/
- https://neuhausre.com/what-is-mcp-real-estate-agents/
