---
title: "Geospatial & Mapping MCP Servers — Mapbox, Google Maps, OpenStreetMap, QGIS, GeoServer, and More"
date: 2026-03-15T10:00:00+09:00
description: "Geospatial and mapping MCP servers let AI agents perform geocoding, routing, spatial analysis, and map visualization through natural language. We reviewed 20+ servers across commercial mapping platforms (Mapbox, Google Maps, Baidu Maps, TomTom, HERE Maps), open-source mapping (OpenStreetMap, QGIS), GIS operations (gis-mcp, GeoServer, LocuSync), government data (MLIT), and data conversion tools. Mapbox leads with 315 stars, 20 tools, and an official hosted endpoint. The gis-mcp library offers 100+ tools across Shapely, PyProj, GeoPandas, Rasterio, and PySAL."
og_description: "Geospatial MCP servers: Mapbox (315 stars, official, 20 tools, hosted endpoint, geocoding/routing/isochrones/POI/static maps), Google Maps community (cablate 193 stars, 13 tools, 3 composite; david-pivonka 2 stars, 14 tools), Baidu Maps (411 stars, official, 10 tools, first Chinese map MCP), TomTom (42 stars, official, 18 tools including EV routing), QGIS MCP (839 stars, 15 tools, desktop GIS control), gis-mcp (120 stars, 100+ tools across 6 GIS libraries), GeoServer MCP (63 stars, 40+ tools, REST API management), OpenStreetMap (3 servers, wiseman 74 stars with PostGIS, NERVsystems 15 stars Go with 25 tools), HERE Maps (8 stars, 6 tools). 20+ servers reviewed. Rating: 4.0/5."
content_type: "Review"
card_description: "Geospatial and mapping MCP servers across commercial platforms, open-source tools, and GIS libraries. Mapbox offers the strongest official server with 20 tools covering geocoding, routing, POI search, isochrones, and static map generation — plus a hosted endpoint requiring zero local setup. The gis-mcp library provides the deepest GIS integration with 100+ tools bridging Shapely, PyProj, GeoPandas, Rasterio, and PySAL to LLMs. QGIS MCP is the most popular server by stars (839) enabling AI control of desktop GIS workflows. Google Maps has no official MCP server, but two strong community options cover the full Places/Routes/Geocoding API surface. The category is rich and practical — geospatial is one of the strongest MCP verticals."
---

Geospatial and mapping is one of the richest MCP categories we've reviewed. AI agents that can geocode addresses, calculate routes, perform spatial analysis, and generate maps through natural language unlock workflows that previously required specialized GIS training. The category spans five areas: **commercial mapping platforms** (Mapbox, Google Maps, Baidu Maps, TomTom, HERE Maps), **open-source mapping** (OpenStreetMap, QGIS), **GIS operations libraries** (gis-mcp, GeoServer, LocuSync), **government geospatial data** (Japan MLIT), and **data conversion tools**.

The headline finding: **Mapbox has the strongest official MCP server** — 20 tools covering geocoding, routing, POI search, isochrones, travel matrices, map matching, route optimization, and static map generation, plus a hosted endpoint at mcp.mapbox.com requiring zero local setup. **The gis-mcp library has the deepest GIS integration** with 100+ tools across six Python libraries (Shapely, PyProj, GeoPandas, Rasterio, PySAL, plus visualization). **QGIS MCP is the most popular by stars** (839) enabling AI control of desktop GIS projects. The main gap is that **Google Maps has no official MCP server** — two strong community options exist but neither has Google's backing.

## Commercial Mapping Platforms

### Mapbox

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [mapbox/mcp-server](https://github.com/mapbox/mcp-server) | 315 | TypeScript | 20 | stdio, hosted |

**mapbox/mcp-server** (315 stars, TypeScript, MIT, 104 commits) is the official MCP server from Mapbox. Twenty tools organized into three categories:

**Offline geospatial utilities** (8 tools) — `distance`, `point_in_polygon`, `bearing`, `midpoint`, `centroid`, `area`, `bounding_box`, `buffer`, `simplify`. Local calculations using Turf.js — no API calls needed. These work without a Mapbox token for purely geometric operations.

**API-powered tools** (10 tools) — `search_and_geocode`, `reverse_geocoding`, `category_search`, `directions`, `matrix`, `isochrone`, `map_matching`, `optimization`, `static_image`. Full access to Mapbox's geocoding (global address resolution), routing (driving/walking/cycling with turn-by-turn), travel time matrices (up to 25×25 origins/destinations), isochrones (reachability polygons), map matching (snap GPS traces to roads), and route optimization (multi-stop TSP solving).

**Resource tools** (2 tools) — `resource_reader` for fetching Mapbox tilesets and datasets, plus a deprecated `category_list` tool.

Standout feature: **hosted endpoint at mcp.mapbox.com/mcp** — connect directly without installing or running anything locally. Just add the URL and your Mapbox access token. This is the simplest setup of any geospatial MCP server. Supports Claude Desktop, VS Code, Cursor, and the Goose framework.

Requires a Mapbox access token (free tier available with generous limits). The combination of zero-install hosted mode, offline geometric tools, and comprehensive API coverage makes this the best starting point for geospatial MCP integration.

### Google Maps

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [cablate/mcp-google-map](https://github.com/cablate/mcp-google-map) | 193 | TypeScript | 13 | stdio, HTTP |
| [david-pivonka/google-maps-mcp-server](https://github.com/david-pivonka/google-maps-mcp-server) | 2 | TypeScript | 14 | stdio |

Google has no official Google Maps MCP server. Two community servers fill the gap:

**cablate/mcp-google-map** (193 stars, TypeScript, MIT, 77 commits) is the most popular. Ten atomic tools — `maps_search_nearby`, `maps_search_places`, `maps_place_details`, `maps_geocode`, `maps_reverse_geocode`, `maps_distance_matrix`, `maps_directions`, `maps_elevation`, `maps_timezone`, `maps_weather` — plus three composite tools: `maps_explore_area` (neighborhood analysis combining search + details + geocoding), `maps_plan_route` (multi-stop routing with alternatives), `maps_compare_places` (side-by-side venue comparison). Runs in three modes: stdio, StreamableHTTP server, and standalone CLI execution. The composite tools are genuinely useful — they chain multiple API calls into single operations that make sense for agent workflows.

**david-pivonka/google-maps-mcp-server** (2 stars, TypeScript, MIT, 15 commits) has broader API coverage with 14 tools including `places_autocomplete`, `places_photos`, `roads_nearest`, `ip_geolocate`, and `geolocation_estimate` — APIs not covered by cablate's server. More tools but less adoption and no composite operations.

Both require a Google Cloud API key with the Places API (New) enabled. Google also offers the **Google Maps Platform Code Assist toolkit** — an MCP server focused on documentation and code samples rather than live API access, aimed at developers building Maps apps rather than agents using Maps data.

### Baidu Maps

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [baidu-maps/mcp](https://github.com/baidu-maps/mcp) | 411 | Python/JS | 10 | stdio, SSE |

**baidu-maps/mcp** (411 stars, Python 55.9%/JavaScript 44.1%, MIT, 67 commits) is the official Baidu Maps MCP server — the first map service provider in China to support MCP. Ten tools: `map_geocode`, `map_reverse_geocode`, `map_search_places`, `map_place_details`, `map_directions_matrix`, `map_directions`, `map_weather`, `map_ip_location`, `map_road_traffic`, `map_poi_extract`.

The most notable inclusion is `map_road_traffic` for real-time traffic conditions and `map_poi_extract` for extracting points of interest from text — capabilities not found in most mapping MCP servers. Dual SDK support (Python and JavaScript/TypeScript). Requires a server-side API key from Baidu Maps Open Platform with MCP (SSE) service enabled.

Primary value: comprehensive Chinese mapping data. If your use case involves Chinese addresses, roads, or POIs, this is the only real option — Google Maps coverage in China is limited and Mapbox requires separate China-specific tokens.

### TomTom

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [tomtom-international/tomtom-mcp](https://github.com/tomtom-international/tomtom-mcp) | 42 | TypeScript | 18 | stdio |

**tomtom-international/tomtom-mcp** (42 stars, TypeScript, Apache 2.0, 444 commits) is the official TomTom MCP server. Eighteen tools across two backends:

**Standard tools** (11) — `tomtom-geocode`, `tomtom-reverse-geocode`, `tomtom-fuzzy-search`, `tomtom-poi-search`, `tomtom-nearby`, `tomtom-routing`, `tomtom-waypoint-routing`, `tomtom-reachable-range`, `tomtom-traffic`, `tomtom-static-map`, `tomtom-dynamic-map`. Available on both TomTom Maps and Orbis Maps backends.

**Orbis Maps exclusive** (5) — `tomtom-ev-routing`, `tomtom-search-along-route`, `tomtom-area-search`, `tomtom-ev-search`, `tomtom-data-viz`. The EV routing tools are unique — they calculate routes accounting for battery range, charging station locations, and energy consumption, something no other mapping MCP server offers.

The 444-commit count is the highest of any mapping MCP server, indicating serious ongoing development. Requires Node.js 22.x and a TomTom API key (free developer tier available).

### HERE Maps

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [limingchina/heremaps-mcp-server](https://github.com/limingchina/heremaps-mcp-server) | 8 | JavaScript | 6 | stdio |

**limingchina/heremaps-mcp-server** (8 stars, JavaScript, Apache 2.0, 14 commits) is a community server for HERE Maps. Six tools: `maps_geocode`, `maps_reverse_geocode`, `maps_search_places`, `maps_directions`, `maps_get_traffic_incidents`, `maps_display`. Basic but functional coverage of HERE's core APIs. Requires a HERE Maps API key. No official server from HERE exists.

## Open-Source Mapping

### QGIS

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [jjsantos01/qgis_mcp](https://github.com/jjsantos01/qgis_mcp) | 839 | Python | 15 | stdio |

**jjsantos01/qgis_mcp** (839 stars, Python, 13 commits) connects QGIS Desktop to AI assistants through MCP. Fifteen tools including `load_project`, `create_new_project`, `add_vector_layer`, `add_raster_layer`, `execute_processing`, `execute_code`, `render_map`, `save_project`, `get_layers`, `remove_layer`, `zoom_to_layer`, and more.

The standout is `execute_processing` — it exposes QGIS's entire processing algorithm library (hundreds of geoprocessing tools) through a single MCP tool. This means the AI agent can run buffer operations, spatial joins, terrain analysis, and any other QGIS processing algorithm by name. Similarly, `execute_code` allows arbitrary Python execution within QGIS's environment, giving access to the full PyQGIS API.

This is a **desktop integration** — it requires a running QGIS 3.x instance with the MCP plugin installed. The architecture uses a QGIS plugin that runs an MCP server within the application, communicating via stdin/stdout. Best suited for interactive GIS workflows where the user wants AI assistance while working in QGIS, rather than headless server-side processing.

The 839-star count makes it the most popular geospatial MCP server by a wide margin — GIS professionals clearly want AI integration in their existing tools.

### OpenStreetMap

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [jagan-shanmugam/open-streetmap-mcp](https://github.com/jagan-shanmugam/open-streetmap-mcp) | 172 | Python | 12 | stdio |
| [wiseman/osm-mcp](https://github.com/wiseman/osm-mcp) | 74 | Python | 7 | stdio |
| [NERVsystems/osmmcp](https://github.com/NERVsystems/osmmcp) | 15 | Go | 25 | stdio |

Three OpenStreetMap MCP servers with different approaches:

**jagan-shanmugam/open-streetmap-mcp** (172 stars, Python, MIT, 9 commits) is the most popular. Twelve tools focused on practical location queries: `geocode_address`, `reverse_geocode`, `find_nearby_places`, `get_route_directions`, `search_category`, `suggest_meeting_point`, `explore_area`, `find_schools_nearby`, `analyze_commute`, `find_ev_charging_stations`, `analyze_neighborhood`, `find_parking_facilities`. The specialized tools (schools, EV charging, parking, commute analysis) make this feel more like a location assistant than a raw geocoding API. Uses Nominatim and OSRM — no API key required, though rate limits apply.

**wiseman/osm-mcp** (74 stars, Python/HTML, 21 commits) takes a different approach — it combines map visualization with direct database queries. Seven tools: `get_map_view`, `set_map_view`, `set_map_title`, `add_map_marker`, `add_map_line`, `add_map_polygon`, `query_osm_postgres`. Includes a web-based Leaflet map viewer with Server-Sent Events for real-time updates. Requires a PostgreSQL/PostGIS database loaded with OpenStreetMap data — heavier setup but allows complex spatial SQL queries against the full OSM dataset.

**NERVsystems/osmmcp** (15 stars, Go, MIT, 173 commits) has the most tools (25) and most active development. Adds emission enrichment (`enrich_emissions`), polyline encoding/decoding, bbox calculations, tag filtering, and distance sorting on top of the standard geocoding/routing/POI capabilities. Written in Go for performance. The 173-commit count suggests ongoing maintenance.

All three are free — OpenStreetMap data requires no API key. The tradeoff is rate limits on Nominatim/OSRM public instances vs. running your own.

## GIS Operations Libraries

### gis-mcp

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [mahdin75/gis-mcp](https://github.com/mahdin75/gis-mcp) | 120 | Python | 100+ | stdio |

**mahdin75/gis-mcp** (120 stars, Python, 249 commits, v0.14.0 beta) is the most comprehensive GIS MCP server. Over 100 tools bridging six Python GIS libraries to LLMs:

**Shapely** (29 tools) — buffer, intersection, union, difference, symmetric difference, convex hull, simplify, and other geometric operations. The core computational geometry toolkit.

**PyProj** (13 tools) — coordinate transformations between any CRS. Reproject geometries, transform coordinate arrays, compute geodesic distances and areas on the ellipsoid.

**GeoPandas** (13 tools) — read/write geospatial files (Shapefile, GeoJSON, GeoPackage), spatial joins, overlays, dissolves, and attribute operations on geodataframes.

**Rasterio** (20 tools) — raster data I/O, clipping, reprojection, NDVI computation, hillshade generation. Bridges the vector/raster divide.

**PySAL** (18 tools) — spatial statistics, spatial weights, spatial autocorrelation (Moran's I, LISA), and regionalization algorithms.

**Visualization** (2 tools) — `create_static_map` and `create_interactive_web_map` for rendering results.

**Data access** (6 tools) — administrative boundaries, climate data, ecology data, movement data, land cover, and satellite imagery retrieval.

This is effectively a complete GIS workstation exposed via MCP. The breadth is unmatched — no other server covers geometry operations, coordinate transforms, raster processing, spatial statistics, and data visualization in one package. Requires Python 3.10+. Published on PyPI as `gis-mcp`.

### GeoServer MCP

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [mahdin75/geoserver-mcp](https://github.com/mahdin75/geoserver-mcp) | 63 | Python | 40+ | stdio |

**mahdin75/geoserver-mcp** (63 stars, Python, 42 commits) connects LLMs to the GeoServer REST API. Over 40 tools across workspace management (create/list workspaces), datastore management (Shapefile, GeoPackage, PostGIS datastores), layer management (create, configure, list, remove layers), layer group management (7 tools), user and access control (7 tools), feature type and attribute management (6 tools), style management, and system operations.

By the same author as gis-mcp — together they cover both GIS analysis (gis-mcp) and geospatial data serving (geoserver-mcp). Requires a running GeoServer instance with REST API enabled. Python 3.10+.

### LocuSync (GIS-MCP-Server)

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [matbel91765/gis-mcp-server](https://github.com/matbel91765/gis-mcp-server) | 1 | Python | 14 | stdio |

**matbel91765/gis-mcp-server** (1 star, Python, MIT, 32 commits) provides geocoding, routing, elevation, and spatial analysis using free public APIs (Nominatim, OSRM, Open-Elevation). Fourteen tools: `geocode`, `reverse_geocode`, `batch_geocode`, `get_elevation`, `get_elevation_profile`, `distance`, `buffer`, `spatial_query`, `transform_crs`, `route`, `isochrone`, `read_file`, `write_file`. File I/O supports Shapefile, GeoJSON, and GeoPackage formats.

A good lightweight alternative if you need basic geospatial operations without the heavy dependency chain of gis-mcp. No API keys required.

## Government Geospatial Data

### Japan MLIT

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [MLIT-DATA-PLATFORM/mlit-dpf-mcp](https://github.com/MLIT-DATA-PLATFORM/mlit-dpf-mcp) | 130 | Python | 18 | stdio |
| [chirikuuka/mlit-geospatial-mcp](https://github.com/chirikuuka/mlit-geospatial-mcp) | 70 | Python | 1 | stdio |

Two servers for Japan's Ministry of Land, Infrastructure, Transport and Tourism (MLIT) data:

**MLIT-DATA-PLATFORM/mlit-dpf-mcp** (130 stars, Python, MIT, 4 commits) is the official MLIT Data Platform MCP server. Eighteen tools for searching, browsing, and downloading Japan's national geospatial datasets through GraphQL APIs: `search`, `search_by_location_rectangle`, `search_by_location_point_distance`, `search_by_attribute`, `get_data`, `get_data_summary`, `get_data_catalog`, `get_file_download_urls`, `get_prefecture_data`, `get_municipality_data`, `get_mesh`, and more. Covers infrastructure, transportation, land use, and environmental datasets.

**chirikuuka/mlit-geospatial-mcp** (70 stars, Python, MIT, 14 commits) focuses on the Real Estate Information Library API — a single `get_multi_api` tool that accesses 25 of 35 available data types covering property prices, disaster risk zones, schools, medical facilities, population projections, and urban planning designations. Requires an API key from the Real Estate Information Library.

These are niche but notable — Japan is ahead of most countries in providing official MCP access to government geospatial data.

## Data Conversion

### GIS Data Conversion MCP

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [ronantakizawa/gis-dataconversion-mcp](https://github.com/ronantakizawa/gis-dataconversion-mcp) | 15 | JavaScript | 9 | stdio |

**ronantakizawa/gis-dataconversion-mcp** (15 stars, JavaScript, MIT, 19 commits) converts between geospatial formats. Nine tools: `wkt_to_geojson`, `geojson_to_wkt`, `csv_to_geojson`, `geojson_to_csv`, `geojson_to_topojson`, `topojson_to_geojson`, `kml_to_geojson`, `geojson_to_kml`, `coordinates_to_location`. Over 1,000 npm downloads. Simple and focused — when you just need to convert between WKT, GeoJSON, CSV, TopoJSON, and KML formats.

## Desktop GIS Integration

### ArcGIS Pro

| Server | Stars | Language | Tools | Transport |
|--------|-------|----------|-------|-----------|
| [nicogis/MCP-Server-ArcGIS-Pro-AddIn](https://github.com/nicogis/MCP-Server-ArcGIS-Pro-AddIn) | 22 | C# | 4 | stdio (Named Pipes) |

**nicogis/MCP-Server-ArcGIS-Pro-AddIn** (22 stars, C#, 10 commits) integrates MCP with ArcGIS Pro Desktop. Four tools: `pro.getActiveMapName`, `pro.listLayers`, `pro.countFeatures`, `pro.zoomToLayer`. The architecture is clever — a .NET Add-In runs inside ArcGIS Pro and communicates with a separate .NET 8 MCP server via Named Pipes. Currently read-only with limited tools, but demonstrates the pattern for AI-assisted desktop GIS. Requires Visual Studio 2022, ArcGIS Pro SDK, and ArcGIS Pro installation.

## Also notable

- **Google Maps Platform Code Assist** — an official Google MCP server focused on documentation and code samples for developers building Maps applications, not for live API access
- **Cesium AI Integrations** — a newly announced repository (March 2026) exploring MCP server integration with Cesium's 3D geospatial platform; still early
- **ThinkGeo MCP Server** — indexes 12,700+ ThinkGeo documentation pages for developer assistance; no API key required
- **Baidu Maps community** (hithereiamaliff/mcp-baidumaps) — an independent Baidu Maps implementation, under improvement

## The bottom line

Geospatial is one of the strongest MCP categories. Every major mapping platform has at least a community MCP server, and several (Mapbox, Baidu, TomTom) have official ones with serious investment (444 commits from TomTom, 104 from Mapbox). The gis-mcp library with 100+ tools across six Python libraries is the most comprehensive GIS toolkit available via MCP. QGIS MCP's 839 stars show genuine demand from GIS professionals for AI integration.

**Best for general geocoding/routing:** Mapbox MCP (official, hosted, 20 tools, free tier)
**Best for Google Maps data:** cablate/mcp-google-map (193 stars, 13 tools with composites)
**Best for GIS analysis:** gis-mcp (100+ tools, Shapely/PyProj/GeoPandas/Rasterio/PySAL)
**Best for desktop GIS:** QGIS MCP (839 stars, execute any processing algorithm)
**Best for Chinese mapping:** Baidu Maps MCP (official, 411 stars)
**Best for EV routing:** TomTom MCP (EV-specific routing and charging station tools)
**Best for free/no-API-key:** OpenStreetMap servers (Nominatim + OSRM, rate-limited)

Rating: **4.0/5** — Rich ecosystem with multiple official vendor servers, the most comprehensive GIS library integration in any MCP category (gis-mcp), strong open-source options, and practical real-world utility. The main gaps are no official Google Maps server and limited 3D/globe capabilities (Cesium integration is nascent). The hosted Mapbox endpoint is exactly how MCP servers should be deployed.

---

*This review was researched and written by an AI agent. We have not personally tested these servers — our analysis is based on documentation, source code, GitHub metrics, and community adoption. See our [methodology](/about/) for details.*
