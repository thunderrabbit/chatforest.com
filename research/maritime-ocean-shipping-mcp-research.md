# Maritime, Ocean & Shipping MCP Server Research
## Research Date: 2026-03-29

---

## EXECUTIVE SUMMARY

This is a **nascent but rapidly emerging** category. Unlike mature MCP categories (databases, cloud, DevOps), maritime/ocean MCP servers are extremely early-stage. The research found approximately **25-30 directly maritime-focused MCP servers** and **60-80+ adjacent/repurposable servers** (weather, GIS, IoT, shipping carriers, CAD, compliance, satellite). Most maritime-specific servers have 0-9 stars and were created in 2025-2026. This represents a massive gap and opportunity.

### Key Finding
The maritime industry is a $4-6B+ AI market growing 15-40% CAGR, yet has fewer than 30 dedicated MCP servers. By contrast, the database category alone has 100+ MCP servers. This gap makes the guide both timely and valuable.

---

## SECTION 1: DIRECTLY MARITIME MCP SERVERS

### 1A. Vessel Tracking & AIS Data

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 1 | **MarineTraffic MCP Server** | [Cyreslab-AI/marinetraffic-mcp-server](https://github.com/Cyreslab-AI/marinetraffic-mcp-server) | 9 | TypeScript | 2025-03 | Real-time vessel position by MMSI/IMO, vessel details, vessel search, area search. Uses MarineTraffic API. Smithery-listed. | Community |
| 2 | **ShipXY MCP Server** | [garrettXu/mcp-shipxy-api](https://github.com/garrettXu/mcp-shipxy-api) | 9 | Python | 2025-07 | Ship tracking, fleet queries, port search, berth/anchor/ETA, route planning, marine weather, typhoon/tide data. Uses ShipXY API. | Community |
| 3 | **Datalastic Marine AIS MCP** | [robderstadt/datalastic-mcp](https://github.com/robderstadt/datalastic-mcp) | 0 | Python | 2025-10 | Vessel tracking, vessel history (since Aug 2021), area search, port search, fleet tracking (100 vessels), smart caching, rate limit tracking. | Community |
| 4 | **Marine Traffic MCP (Go)** | [salmangada/marine-traffic-mcp](https://github.com/salmangada/marine-traffic-mcp) | 0 | Go | 2025-12 | MarineTraffic vessel tracking data access via MCP. MMSI-based tracking. | Community |
| 5 | **MarineTraffic MCP (Python)** | [arifemregursoy/marinetraffic-mcp-server](https://github.com/arifemregursoy/marinetraffic-mcp-server) | 0 | Python | 2025-07 | MarineTraffic API integration. | Community |
| 6 | **Saillogger AIS MCP** | [Saillogger/mcp-server-saillogger](https://github.com/Saillogger/mcp-server-saillogger) | 1 | Python | 2025-04 | Real-time AIS positions from the Saillogger network for AI applications. | Community (Saillogger) |
| 7 | **AIS MCP Servers** | [Wipfi/ais_mcp_servers](https://github.com/Wipfi/ais_mcp_servers) | 0 | Python | 2026-03 | AIS data MCP servers (minimal docs). | Community |

### 1B. Shipping Line & Carrier MCP Servers

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 8 | **Maersk MCP** | [idipankan/maersk-mcp](https://github.com/idipankan/maersk-mcp) | 1 | Python | 2025-07 | Vessel IMO lookup by name, vessel schedule & deadlines, port calls for next week. Uses Maersk public APIs. | Community |
| 9 | **Shipping Rates MCP** | [vinaybhosle/shippingrates-mcp-server](https://github.com/vinaybhosle/shippingrates-mcp-server) | 0 | N/A | 2026-02 | Container shipping D&D charges, local charges, inland haulage. x402-native payment (USDC). Remote MCP at mcp.shippingrates.org. | Community |
| 10 | **SF Express MCP** | [100kgforest/sf-express-mcp-server](https://github.com/100kgforest/sf-express-mcp-server) | 0 | TypeScript | 2025-08 | SF Express shipping/logistics API integration. | Community |
| 11 | **Investment/VLCC MCP** | [liqiqiii/investment-mcp](https://github.com/liqiqiii/investment-mcp) | 0 | Python | 2026-03 | Personal investment analysis including VLCC/shipping market data. | Community |

### 1C. Maritime Intelligence & Compliance

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 12 | **Maritime Shipping Intelligence** | [Ryan-Clinton/maritime-shipping-intelligence-mcp](https://github.com/Ryan-Clinton/maritime-shipping-intelligence-mcp) | 0 | N/A | 2026-03 | Maritime shipping intelligence with sanctions, supply chain, port data. | Community |
| 13 | **Maritime Resource Compliance (Ryan-Clinton)** | [Ryan-Clinton/maritime-resource-compliance-mcp](https://github.com/Ryan-Clinton/maritime-resource-compliance-mcp) | 0 | N/A | 2026-03 | Maritime compliance, sanctions, shipping supply chain. | Community |
| 14 | **Maritime Resource Compliance (Apify)** | [apifyforge/maritime-resource-compliance-mcp](https://github.com/apifyforge/maritime-resource-compliance-mcp) | 0 | N/A | 2026-03 | Fishing quotas, oil/gas licenses, waste carriers, coastal hazards. Apify-based. | Community |
| 15 | **AML Watcher MCP** | [Tech-AML/AML-watcher-MCP-Server](https://github.com/Tech-AML/AML-watcher-MCP-Server) | 0 | N/A | 2025-05 | AML screening for vessels, aircraft, companies, individuals. Sanctions, PEP screening. | Community |

### 1D. Naval Architecture & Shipbuilding

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 16 | **Shipbuilding Specs MCP** | [contextkits/shipbuilding-specs](https://github.com/contextkits/shipbuilding-specs) | 0 | Python | 2026-02 | Maritime vessel specifications and shipbuilding requirements. | Community |
| 17 | **Naval Shipbuilding Standards** | [contextkits/naval-shipbuilding-standards](https://github.com/contextkits/naval-shipbuilding-standards) | 0 | Python | 2026-02 | Naval vessel specifications, NAVSEA shipbuilding standards. | Community |
| 18 | **Navy MCP** | [johnwildes/NavyMCP](https://github.com/johnwildes/NavyMCP) | 0 | TypeScript | 2025-05 | Navy-related MCP server (minimal docs). | Community |
| 19 | **Indian Navy INS Valsura** | [ag2-mcp-servers/indian-navy-ins-valsura](https://github.com/ag2-mcp-servers/indian-navy-ins-valsura) | 0 | Python | 2025-06 | Auto-generated MCP server for Indian Navy INS Valsura. | Community |

### 1E. Ocean Science & Oceanography

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 20 | **OceanMCP (Monorepo - 8 servers!)** | [mansurjisan/ocean-mcp](https://github.com/mansurjisan/ocean-mcp) | 2 | Python | 2026-02 | **MAJOR FIND**: 8 independently installable servers: (1) coops-mcp (NOAA CO-OPS tides/water levels/currents), (2) erddap-mcp (80+ ERDDAP servers), (3) nhc-mcp (hurricane tracks/advisories), (4) recon-mcp (hurricane recon data), (5) stofs-mcp (NOAA storm surge forecasts), (6) ofs-mcp (NOAA regional ocean models), (7) rtofs-mcp (global ocean forecasts via HYCOM), (8) ww3-mcp (WAVEWATCH III wave forecasts + NDBC buoy data). All on PyPI. | Community |
| 21 | **Oceanum Datamesh MCP** | [oceanum-io/oceanum-mcp](https://github.com/oceanum-io/oceanum-mcp) | 1 | Python | 2026-02 | Datamesh MCP server for ocean data. From Oceanum.io. | Vendor |
| 22 | **Ocean Wave & Tide Prediction** | [godshinee/MCP-test](https://github.com/godshinee/MCP-test) | 0 | Python | 2026-02 | Ocean wave & tide prediction system with MCP Server, Next.js dashboard, LangChain chatbot. | Community |
| 23 | **TideWatch MCP** | [Polly2014/TideWatch-MCP-Server](https://github.com/Polly2014/TideWatch-MCP-Server) | 0 | Python | 2026-03 | Tide monitoring/prediction. | Community |
| 24 | **NOAA Tides MCP** | [seanofahey/mcp-noaa-tides](https://github.com/seanofahey/mcp-noaa-tides) | 1 | Python | 2025-04 | NOAA tide data access. | Community |

### 1F. Maritime Heritage & Archives

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 25 | **IBM Maritime Archives** | [IBM/chuk-mcp-maritime-archives](https://github.com/IBM/chuk-mcp-maritime-archives) | 3 | Python | 2026-02 | Dutch, English, Portuguese, Spanish, Swedish maritime archives. Wreck searches, voyages, crew data. | Vendor (IBM) |

### 1G. Marine Navigation & Hydrography

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 26 | **SHOM Wrecks MCP** | [dorian-erkens/mcp-shom-wrecks](https://github.com/dorian-erkens/mcp-shom-wrecks) | 1 | TypeScript | 2026-02 | Query SHOM (French Hydrographic Service) wreck database via WFS API. | Community |
| 27 | **VesselAPI MCP** | [vessel-api/vesselapi-mcp](https://github.com/vessel-api/vesselapi-mcp) | 0 | TypeScript | 2026-02 | Tools to access VesselAPI endpoints. | Community |

### 1H. Sailing & Yachting

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 28 | **Yachtsy MCP** | [manee1112/yachtsy-mcp-server](https://github.com/manee1112/yachtsy-mcp-server) | 0 | TypeScript | 2022-06 | AI-driven yacht marketplace insights. 25,000+ listings, sailing advice. | Vendor |
| 29 | **Garmin Sailing MCP** | [vinicius-saraiva/garmin-sailing-mcp](https://github.com/vinicius-saraiva/garmin-sailing-mcp) | 1 | Python | 2026-03 | Sailing analytics with Garmin GPS + Open-Meteo weather. | Community |

---

## SECTION 2: MARINE WEATHER & SURF FORECAST MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 30 | **Surf Forecast MCP** | [lucasinocencio1/mcp-surf-forecast](https://github.com/lucasinocencio1/mcp-surf-forecast) | 18 | Python | 2025-08 | Open-Meteo Marine API for surf/marine forecasts. Swell height, period, direction, wind. Global coverage. | Community |
| 31 | **Weather MCP (12 tools)** | [weather-mcp/weather-mcp](https://github.com/weather-mcp/weather-mcp) | 4 | TypeScript | 2025-11 | **Includes marine conditions**, lightning, weather radar, river monitoring, wildfire. No API key required. | Community |
| 32 | **Surf Forecast MCP (enricollen)** | [enricollen/surf-forecast-mcp](https://github.com/enricollen/surf-forecast-mcp) | 3 | Python | 2025-11 | Marine forecast data from OpenMeteo. | Community |
| 33 | **Open-Meteo MCP (comprehensive)** | [cmer81/open-meteo-mcp](https://github.com/cmer81/open-meteo-mcp) | 37 | N/A | N/A | Comprehensive Open-Meteo access including marine weather APIs. | Community |
| 34 | **Open-Meteo MCP Server** | [QuentinCody/open-meteo-mcp-server](https://github.com/QuentinCody/open-meteo-mcp-server) | 0 | TypeScript | 2026-03 | Weather forecasts, historical data, air quality, **marine**, climate projections. | Community |
| 35 | **Weather MCP Server (bhayanak)** | [bhayanak/weather-mcp-server](https://github.com/bhayanak/weather-mcp-server) | 0 | TypeScript | 2026-03 | Forecasts, historical data, air quality, **marine conditions**, geocoding, elevation. 1km resolution, 80+ year archive. | Community |
| 36 | **WeatherOracle** | [ToolOracle/weatheroracle](https://github.com/ToolOracle/weatheroracle) | 0 | N/A | 2026-03 | 10 tools: current, forecast, air quality, **marine**, astronomy. | Community |
| 37 | **L402 APIs (Lightning-gated)** | [Blue-Trianon-Ventures/l402-apis](https://github.com/Blue-Trianon-Ventures/l402-apis) | 0 | N/A | 2026-03 | Sanctions screening, aviation weather, **marine forecasts**, crypto data. Pay-per-request via Bitcoin Lightning. | Community |
| 38 | **OpenWeatherMap MCP** | [jezweb/weather-mcp-server](https://github.com/jezweb/weather-mcp-server) | 10 | N/A | N/A | Weather data, forecasts, air quality (can supplement marine weather). | Community |
| 39 | **Weather MCP Server (239 stars)** | [ezh0v/weather-mcp-server](https://github.com/ezh0v/weather-mcp-server) | 239 | N/A | N/A | Top weather MCP server. Real-time weather data for AI assistants. | Community |

---

## SECTION 3: SHIPPING CARRIER & LOGISTICS MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 40 | **Carrier API (Multi-carrier)** | [shopanaio/carrier-api](https://github.com/shopanaio/carrier-api) | 5 | HTML | 2025-09 | Enterprise-grade shipping carrier API clients & MCP servers. Multi-carrier. | Community |
| 41 | **Envia MCP (170+ carriers)** | [amak07/envia-mcp](https://github.com/amak07/envia-mcp) | 1 | TypeScript | 2026-03 | Envia.com shipping API. 170+ carriers, 18 countries. Rates, labels, tracking. | Community |
| 42 | **Envia MCP (Official)** | [envia-ep/envia-mcp-server](https://github.com/envia-ep/envia-mcp-server) | 0 | TypeScript | 2026-03 | Official Envia MCP. 10 tools: rates, labels, tracking. | Vendor (Envia) |
| 43 | **UPS MCP** | [markswendsen-code/mcp-ups](https://github.com/markswendsen-code/mcp-ups) | 0 | TypeScript | 2026-03 | UPS package tracking and shipping services. | Community |
| 44 | **FedEx MCP** | [markswendsen-code/mcp-fedex](https://github.com/markswendsen-code/mcp-fedex) | 0 | TypeScript | 2026-03 | FedEx tracking, shipping rates, location finding, pickup scheduling. | Community |
| 45 | **SendCloud MCP** | [pocharlies-org/mcp-sendcloud](https://github.com/pocharlies-org/mcp-sendcloud) | 0 | TypeScript | 2026-03 | SendCloud shipping API: parcels, returns, labels, tracking. | Community |
| 46 | **Chit Chats MCP** | [hishamalhadi/chitchats-mcp](https://github.com/hishamalhadi/chitchats-mcp) | 0 | TypeScript | 2026-01 | Chit Chats shipping: shipments, tracking, rates, HS codes, labels. | Community |
| 47 | **RajaOngkir MCP** | [Arseno25/rajaongkir-mcp-server](https://github.com/Arseno25/rajaongkir-mcp-server) | 0 | Python | 2026-01 | Indonesian shipping costs and package tracking (Komerce API). | Community |
| 48 | **Printful MCP** | [Purple-Horizons/printful-mcp](https://github.com/Purple-Horizons/printful-mcp) | 1 | Python | N/A | Printful print-on-demand API including shipping/fulfillment. 17 tools. | Community |
| 49 | **Pancake POS MCP** | [lynguyenvu/pancake-mcp-server](https://github.com/lynguyenvu/pancake-mcp-server) | 1 | N/A | N/A | Pancake POS API: orders, inventory, shipping. 20 tools. | Community |
| 50 | **Nexus MCP (ecommerce)** | [karimsherifyehia/nexus-mcp-server](https://github.com/karimsherifyehia/nexus-mcp-server) | 1 | N/A | 2026-03 | Agent-native ecommerce ops: CRM, orders, inventory, fulfillment, shipping. | Community |

---

## SECTION 4: EARTH OBSERVATION & SATELLITE MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 51 | **Earth Agent (Google Earth Engine)** | [wybert/earth-agent-chrome-ext](https://github.com/wybert/earth-agent-chrome-ext) | 99 | TypeScript | 2025-04 | AI agent for Google Earth Engine. Write code, run analysis, debug, manage environment. Chrome extension + MCP. | Community |
| 52 | **NASA MCP Server** | [ProgramComputer/NASA-MCP-server](https://github.com/ProgramComputer/NASA-MCP-server) | 83 | TypeScript | 2025-03 | NASA APIs: APOD, Mars rovers, asteroids, Earth imagery. Standardized AI interface. | Community |
| 53 | **Earthdata MCP Server** | [datalayer/earthdata-mcp-server](https://github.com/datalayer/earthdata-mcp-server) | 24 | Python | 2025-02 | NASA Earthdata access (ocean data, satellite observations). | Community |
| 54 | **Copernicus MCP** | [wb1016/copernicus-mcp](https://github.com/wb1016/copernicus-mcp) | 2 | Python | 2026-01 | ESA Copernicus OData API access. Satellite imagery. | Community |
| 55 | **Sentinel Hub MCP** | [ginkgo-tech/sentinelhub-mcp](https://github.com/ginkgo-tech/sentinelhub-mcp) | 0 | N/A | 2025-06 | Copernicus Sentinel Hub satellite image interaction with LLMs. | Community |
| 56 | **NASA MCP (jezweb)** | [jezweb/nasa-mcp-server](https://github.com/jezweb/nasa-mcp-server) | 8 | N/A | N/A | NASA APIs: APOD, Mars rovers, asteroids, Earth imagery. | Community |

---

## SECTION 5: GEOPHYSICAL & ENVIRONMENTAL MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 57 | **DeepMap AI Geophysical** | [DeepMapAI/deepmap-mcp-server](https://github.com/DeepMapAI/deepmap-mcp-server) | 1 | Python | 2026-03 | 25 tools: risk scoring, earthquake/volcano/tsunami prediction, weather, insurance, climate. | Vendor |
| 58 | **Google Maps MCP (14 tools)** | [Garblesnarff/google-maps-mcp](https://github.com/Garblesnarff/google-maps-mcp) | 10 | TypeScript | 2025-06 | Location services, mapping, weather, environmental data. Includes marine-relevant geospatial tools. | Community |

---

## SECTION 6: INDUSTRIAL IoT & SCADA MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 59 | **IoT Edge MCP Server** | [poly-mcp/IoT-Edge-MCP-Server](https://github.com/poly-mcp/IoT-Edge-MCP-Server) | 22 | Python | 2025-11 | Industrial IoT, SCADA, PLC. MQTT sensors, Modbus devices, real-time monitoring, alarms, time-series, actuator control. | Community |
| 60 | **Duke IoT MCP Servers** | [Duke-CEI-Center/IoT-MCP-Servers](https://github.com/Duke-CEI-Center/IoT-MCP-Servers) | 10 | Python | 2025-06 | IoT device integration: read sensor data, dispatch collection tasks. | Community |
| 61 | **EMQX MQTT MCP** | [Benniu/emqx-mcp-server](https://github.com/Benniu/emqx-mcp-server) | 23 | N/A | N/A | EMQX MQTT broker interaction via MCP. | Community |
| 62 | **MQTT MCP** | [ezhuk/mqtt-mcp](https://github.com/ezhuk/mqtt-mcp) | 12 | N/A | N/A | Generic MQTT MCP server. | Community |
| 63 | **WinCC Unified SCADA MCP** | [vogler75/winccua-mcp-server](https://github.com/vogler75/winccua-mcp-server) | 9 | N/A | N/A | Siemens WinCC Unified SCADA system MCP. | Community |
| 64 | **WinCC V8 SCADA MCP** | [vogler75/winccv8-mcp-server](https://github.com/vogler75/winccv8-mcp-server) | 8 | N/A | N/A | Siemens WinCC V8 SCADA system MCP. | Community |

---

## SECTION 7: TIME-SERIES & MONITORING MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 65 | **InfluxDB MCP** | [idoru/influxdb-mcp-server](https://github.com/idoru/influxdb-mcp-server) | 33 | N/A | N/A | Query InfluxDB from MCP. Useful for ship sensor time-series data. | Community |
| 66 | **InfluxDB 3 MCP (Official)** | [influxdata/influxdb3_mcp_server](https://github.com/influxdata/influxdb3_mcp_server) | 29 | N/A | N/A | Official InfluxDB 3 MCP server. | Vendor (InfluxData) |
| 67 | **Factory Intelligence MCP** | [LaAnJo/Factory-Intelligence-MCP-KPI-Server](https://github.com/LaAnJo/Factory-Intelligence-MCP-KPI-Server) | 0 | N/A | N/A | KPI tools for factory dashboards using TimescaleDB. Productivity, quality, downtime. | Community |

---

## SECTION 8: CAD & ENGINEERING MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 68 | **KiCAD MCP** | [mixelpixx/KiCAD-MCP-Server](https://github.com/mixelpixx/KiCAD-MCP-Server) | 535 | N/A | N/A | PCB design via MCP. Relevant for marine electronics. | Community |
| 69 | **CAD MCP** | [daobataotie/CAD-MCP](https://github.com/daobataotie/CAD-MCP) | 286 | N/A | N/A | General CAD MCP server. | Community |
| 70 | **FreeCAD MCP** | [ATOI-Ming/FreeCAD-MCP](https://github.com/ATOI-Ming/FreeCAD-MCP) | 68 | N/A | N/A | FreeCAD automation. Model creation, document management. | Community |
| 71 | **Fusion 360 MCP** | [AuraFriday/Fusion-360-MCP-Server](https://github.com/AuraFriday/Fusion-360-MCP-Server) | 64 | N/A | N/A | Autodesk Fusion 360 control via MCP. | Community |
| 72 | **Onshape MCP** | [BLamy/onshape-mcp](https://github.com/BLamy/onshape-mcp) | 11 | N/A | N/A | Onshape cloud CAD via MCP. | Community |
| 73 | **CadQuery MCP** | [rishigundakaram/cadquery-mcp-server](https://github.com/rishigundakaram/cadquery-mcp-server) | 10 | N/A | N/A | CAD generation and verification via CadQuery. | Community |
| 74 | **SolidEdge MCP** | [tylerwagler/SolidEdge-MCP](https://github.com/tylerwagler/SolidEdge-MCP) | 4 | N/A | N/A | Solid Edge AI-assisted CAD design. | Community |
| 75 | **MultiCAD MCP** | [AnCode666/multiCAD-mcp](https://github.com/AnCode666/multiCAD-mcp) | 17 | N/A | N/A | Multiple CAD software via AI. | Community |

---

## SECTION 9: SIMULATION MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 76 | **Isaac Sim MCP** | [omni-mcp/isaac-sim-mcp](https://github.com/omni-mcp/isaac-sim-mcp) | 140 | N/A | N/A | NVIDIA Isaac Simulation MCP. Relevant for autonomous vessel sim. | Community |
| 77 | **Unity Digital Twin MCP** | [game4automation/io.realvirtual.mcp](https://github.com/game4automation/io.realvirtual.mcp) | 6 | N/A | N/A | Unity-based digital twin simulations via MCP. | Community |
| 78 | **GNS3 Network MCP** | [Wael-Rd/gns3-mcp-server](https://github.com/Wael-Rd/gns3-mcp-server) | 19 | N/A | N/A | Network simulation. Relevant for ship networking. | Community |
| 79 | **Text2Sim MCP** | [IamCatoBot/text2sim-MCP-server](https://github.com/IamCatoBot/text2sim-MCP-server) | 19 | N/A | N/A | Natural language to simulation (DES, System Dynamics). | Community |
| 80 | **STK MCP (Ansys/AGI)** | [alti3/stk-mcp](https://github.com/alti3/stk-mcp) | 25 | N/A | N/A | Ansys STK - digital mission engineering. Satellite/orbital analysis. | Community |
| 81 | **CFD/CAE Resources** | [kimimgo/awesome-ai-cae](https://github.com/kimimgo/awesome-ai-cae) | 12 | N/A | N/A | Curated list of 113 AI-ready CAE tools: CFD, FEA, SPH, neural operators, MCP servers. | Community |

---

## SECTION 10: COMPLIANCE & REGULATORY MCP SERVERS

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 82 | **DocSentinel** | [arthurpanhku/DocSentinel](https://github.com/arthurpanhku/DocSentinel) | 96 | N/A | N/A | Document assessment for compliance/cybersecurity. Multi-format parsing, RAG, risk detection. | Community |
| 83 | **Japanese Labor Law MCP** | [kentaroajisaka/labor-law-mcp](https://github.com/kentaroajisaka/labor-law-mcp) | 51 | N/A | N/A | Legal/regulatory MCP pattern. Could be applied to maritime law. | Community |
| 84 | **Insurance Claims MCP** | [chbhargavareddy/ClaimsProcessingAssistant-MCP](https://github.com/chbhargavareddy/ClaimsProcessingAssistant-MCP) | 5 | N/A | N/A | Claims processing via MCP. Relevant for marine insurance. | Community |
| 85 | **Financial Services MCP** | [SecureLend/mcp-financial-services](https://github.com/SecureLend/mcp-financial-services) | 2 | N/A | N/A | Financial services comparison SDK. Loans, banking, insurance. | Community |

---

## SECTION 11: FLIGHT TRACKING (PARALLEL PATTERN FOR MARITIME)

| # | Name | GitHub URL | Stars | Language | Created | Key Features | Type |
|---|------|-----------|-------|----------|---------|-------------|------|
| 86 | **FlightRadar24 MCP** | [sunsetcoder/flightradar24-mcp-server](https://github.com/sunsetcoder/flightradar24-mcp-server) | 46 | JavaScript | 2024-12 | Flight tracking via MCP. Comparable pattern to vessel tracking. | Community |

---

## MARKET DATA & INDUSTRY TRENDS

### AI in Maritime Market Size
- **USD 4.3B (2024)** growing at **40.6% CAGR** to 2030 (Grand View Research)
- **USD 6.24B (2025) -> USD 6.67B (2026)** at 7% CAGR (Business Research Company - narrower scope)
- **USD 4.88B (2025) -> USD 12.84B (2032)** at 14.7% CAGR (Research and Markets)
- Maritime Analytics Market: **USD 1.47B (2025) -> USD 2.38B (2030)** at 10% CAGR (Mordor Intelligence)
- Marine IoT Market: **USD 4.85B (2025) -> USD 12.31B (2032)**
- Smart Port/Automated Terminal Market: **USD 11.3B (2025) -> USD 22.4B (2035)**
- Autonomous Ships Market: Growing significantly toward 2030+ mandatory framework

### Key Industry Trends (2025-2026)

1. **Autonomous Vessels**: IMO non-mandatory code finalized in 2026; mandatory framework expected by 2030. Companies like Rolls-Royce, Kongsberg testing autonomous operations.

2. **Digital Twins**: Virtual replicas of port operations, vessel systems. 65% of logistics providers prefer AI-driven digital twins over traditional planning.

3. **Smart Ports**: China operates 52 robotic ports. AI achieves 95% truck-crane coordination. Throughput improvements of 10-20%.

4. **Predictive Maintenance**: AI analyzing sensor data to forecast equipment failures. Reduces downtime and costs significantly.

5. **Route Optimization**: AI systems analyze weather, currents, congestion, fuel prices for optimal routes. CMA CGM-Google partnership for AI-powered route optimization.

6. **Maritime Cybersecurity**: IMO updated cyber risk guidelines (MSC-FAL.1/Circ.3/Rev.3, April 2025). IACS UR E26/E27 mandatory for newbuilds since July 2024. US Coast Guard cyber incident reporting effective July 2025.

7. **LLM/RAG in Maritime**: Retrieval-Augmented Generation applied to Safety Management Systems. AI-assisted regulatory compliance.

### Major Shipping Companies & AI Adoption
- **Maersk**: ML for route optimization, sensor-based predictive maintenance
- **MSC**: AI for container delivery prediction, dock scheduling
- **CMA CGM**: Strategic partnership with Google for AI across operations
- **36 shipping companies** identified as implementing/planning AI in past year
- **SMEs make up 63%** of AI technology suppliers; startups 17% (growing)

### Maritime Cybersecurity Regulations (2025-2026)
- IMO MSC-FAL.1/Circ.3/Rev.3 (April 2025) - Updated cyber risk guidelines
- IACS UR E26/E27 - Mandatory for all newbuilds (contracts after July 2024)
- US Coast Guard - Cyber incident reporting (July 2025), annual training (Jan 2026)
- References NIST CSF, ISO/IEC 27001

---

## NOTABLE GAPS (Major Companies/Areas Without MCP Servers)

### Shipping Lines Without MCP Servers
- **MSC** (Mediterranean Shipping Company) - World's largest container line
- **CMA CGM** - Third largest container line
- **COSCO Shipping** - Chinese state-owned
- **Hapag-Lloyd** - German container line
- **Evergreen Marine** - Taiwanese
- **ONE (Ocean Network Express)** - Japanese consortium
- **Yang Ming** - Taiwanese
- **ZIM** - Israeli
- **HMM (Hyundai Merchant Marine)** - Korean

### Maritime Data Providers Without MCP Servers
- **VesselFinder** - Major vessel tracking platform
- **FleetMon** - Fleet monitoring
- **Kpler** (acquired MarineTraffic) - Commodities/shipping intelligence
- **Spire Global** - Satellite AIS data
- **exactEarth** - Satellite AIS
- **Lloyd's List Intelligence** - Maritime intelligence
- **S&P Global (IHS Markit)** - Ship data, trade data
- **Windward** - Maritime AI
- **Sinay** - Maritime data analytics

### Maritime Technology Without MCP Servers
- **ECDIS** (Electronic Chart Display) - No MCP integration
- **SignalK** - Open marine data standard (no MCP bridge)
- **NMEA 2000/0183** - No MCP parsers
- **OpenCPN** - Open-source chart plotter (no MCP)
- **Transas/Wartsila Voyage** - Navigation systems
- **DNV/Bureau Veritas/Lloyd's Register** - Classification societies (no MCP for rules)
- **IMO GISIS** - Global Integrated Shipping Information System

### Marine Science Without MCP Servers
- **CMEMS (Copernicus Marine)** - European ocean monitoring (only basic Copernicus MCP exists)
- **Argo Float Network** - 4,000+ ocean profiling floats
- **GEBCO** - Ocean bathymetry
- **IOOS** - Integrated Ocean Observing System
- **Ocean Biodiversity Information System (OBIS)** - No MCP
- **Global Fishing Watch** - No MCP
- **ICES** - International Council for Exploration of the Sea
- **IOC/UNESCO** - Intergovernmental Oceanographic Commission

### Port & Terminal Operations
- **No MCP servers exist** for terminal operating systems (TOS)
- **Navis** (Cargotec) - N4 TOS, no MCP
- **Kalmar** - Terminal automation, no MCP
- **NextPort** - AI-powered port optimization, no MCP yet
- **PortXL** - Port innovation hub, no MCP ecosystem

### Fishing & Aquaculture
- **No dedicated MCP servers** for fisheries management
- **Global Fishing Watch** - No MCP
- **FAO FishStatJ** - No MCP
- **Aquaculture monitoring systems** - No MCP integration

### Naval Architecture
- **NAPA** (Naval Architecture Package) - No MCP
- **AVEVA Marine** - No MCP
- **Maxsurf** (Bentley) - No MCP
- **DNV Sesam** - Structural analysis, no MCP
- **HydroComp** - Propulsion analysis, no MCP

---

## SUMMARY STATISTICS

| Category | Dedicated Servers | Adjacent/Repurposable | Total |
|----------|------------------|----------------------|-------|
| Vessel Tracking & AIS | 7 | 1 (FlightRadar24 pattern) | 8 |
| Shipping Lines & Carriers | 4 | 11 (UPS/FedEx/etc.) | 15 |
| Maritime Intelligence & Compliance | 4 | 3 (AML, DocSentinel, Insurance) | 7 |
| Naval Architecture & Shipbuilding | 4 | 8 (CAD servers) | 12 |
| Ocean Science & Oceanography | 5 (incl. 8-in-1 OceanMCP) | 4 (NASA, Earthdata, Copernicus) | 9 |
| Marine Weather & Surf | 3 | 7 (weather MCP servers w/ marine) | 10 |
| Maritime Heritage | 2 | 0 | 2 |
| Sailing & Yachting | 2 | 0 | 2 |
| Port & Terminal Operations | 0 | 0 | 0 |
| Fishing & Aquaculture | 1 (compliance) | 0 | 1 |
| Industrial IoT/SCADA | 0 | 6 | 6 |
| Satellite/Earth Observation | 0 | 5 | 5 |
| Time-Series/Monitoring | 0 | 3 | 3 |
| Simulation/Digital Twin | 0 | 6 | 6 |
| **TOTAL** | **~32** | **~54** | **~86** |

---

## SOURCES

### Market Research
- [Grand View Research - Maritime AI Market](https://www.grandviewresearch.com/industry-analysis/maritime-artificial-intelligence-market-report)
- [Mordor Intelligence - Maritime Analytics](https://www.mordorintelligence.com/industry-reports/maritime-analytics-market)
- [Business Research Company - AI Maritime Transport 2026](https://www.thebusinessresearchcompany.com/report/artificial-intelligence-ai-in-maritime-transport-global-market-report)
- [Technavio - Maritime AI Market 2025-2029](https://www.technavio.com/report/maritime-ai-market-industry-analysis)
- [Fortune Business Insights - Autonomous Ships](https://www.fortunebusinessinsights.com/industry-reports/autonomous-ship-market-101797)

### Industry Trends
- [Digital Twin Ports 2026 - InTech Group](https://theintechgroup.com/blog/digital-twin-ports-smart-port-technology-automation/)
- [AI in Logistics 2026 - TheIntellify](https://theintellify.com/ai-in-logistics-future-autonomous-fleets-digital-twins/)
- [Smart Port Revolution - Kings Research](https://www.kingsresearch.com/blog/top-10-companies-transforming-smart-port-market-2025)
- [Port Automation $12B Wave - GOSships](https://www.gosships.com/the-robots-are-taking-over-the-ports-and-the-numbers-are-staggering/)

### AI Adoption in Maritime
- [CMA CGM-Google Partnership - Supply Chain Dive](https://www.supplychaindive.com/news/cma-cgm-google-partnership-shipping-operations-artificial-intelligence/721993/)
- [Lloyd's Register AI in Maritime](https://www.lr.org/en/knowledge/press-room/press-listing/press-release/2024/lloyds-register-commissioned-research-reveals-the-rapid-rise-of-ai-in-maritime/)
- [UNCTAD - AI Reshaping Maritime Transport](https://unctad.org/news/navigating-future-how-ai-big-data-and-autonomous-systems-are-reshaping-maritime-transport)
- [AI Maritime Operations - SQlearn](https://www.sqlearn.com/ai-maritime-revolutionizing-shipping-operations/)
- [Maersk Tankers AI Case Study - DevsData](https://devsdata.com/case-studies/ai-data-science-maersk-tankers-maritime-logistics/)

### Maritime Cybersecurity
- [IMO Cyber Risk Guidelines Update - Hill Dickinson](https://www.hilldickinson.com/our-view/articles/global-maritime-industry-continues-to-address-cyber-risk/)
- [2026 Maritime Cybersecurity Regulations - Ship Universe](https://www.shipuniverse.com/2025-maritime-cybersecurity-regulations-a-simplified-breakdown/)
- [MIT Maritime Cybersecurity Research](https://news.mit.edu/2026/enhancing-maritime-cybersecurity-technology-policy-strahinja-janjusevic-0225)
- [DNV Maritime Cyber Security Regulations](https://www.dnv.com/maritime/insights/topics/maritime-cyber-security/regulations/)

### MCP Server Directories
- [PulseMCP - ShipXY listing](https://www.pulsemcp.com/servers/garrettxu-shipxy)
- [Smithery - MarineTraffic MCP](https://smithery.ai/server/@Cyreslab-AI/marinetraffic-mcp-server)
- [MCP Registry](https://registry.modelcontextprotocol.io/)
