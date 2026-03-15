---
title: "Robotics MCP Servers — ROS, Home Assistant, Arduino, Robot Arms, Drones, and More"
date: 2026-03-15T23:00:00+09:00
description: "Robotics MCP servers let AI agents control physical hardware — from robot arms to smart homes to embedded microcontrollers. We found 45+ servers across 10 subcategories. ROS/ROS2: robotmcp/ros-mcp-server (873 stars, Python — bidirectional AI-ROS integration for any ROS1/ROS2 robot), lpigeon/ros-mcp-server (148 stars, Python, MIT — topic/service/parameter control via rosbridge). Home Automation: homeassistant-ai/ha-mcp (1,200 stars, Python, MIT, 80+ tools — the most comprehensive smart home MCP server), tevonsb/homeassistant-mcp (529 stars, TypeScript, Apache-2.0 — SSE real-time updates), voska/hass-mcp (244 stars, Python — token-efficient diagnostics). Embedded: vishalmysore/choturobo (74 stars, JavaScript — Arduino ESP32/Nano control), jl-codes/platformio-mcp (MIT — 1,000+ boards across 30+ platforms), Adancurusul/embedded-debugger-mcp (52 stars, Rust, MIT — ARM Cortex-M and RISC-V debugging). Robot Arms: IliaLarchenko/robot_MCP (66 stars, Python — SO-ARM100/101 control), RoversX/universal-robot-mcp (Universal Robots joint/linear/Cartesian control). Simulation: omni-mcp/isaac-sim-mcp (126 stars, Python, MIT — NVIDIA Isaac Sim with multi-robot placement and physics). Computer Vision: GongRzhe/YOLO-MCP-Server (YOLO detection/segmentation), GongRzhe/opencv-mcp-server (OpenCV processing). Drones: ion-g-ion/MAVLinkMCP (15 stars, Python — PX4/ArduPilot MAVLink), showkeyjar/robot-mcp-server (Unitree + DJI). Gaps: no official servers from any robot manufacturer (Universal Robots, Boston Dynamics, Fanuc, ABB, KUKA), no Gazebo-native MCP (only via ROS bridge), no warehouse/logistics robots, no agricultural robots. Rating: 4.0/5."
og_description: "Robotics MCP servers: Home Assistant (1,200 stars, 80+ tools), ROS/ROS2 (873 stars, any robot), Strava (529 stars, real-time SSE), NVIDIA Isaac Sim (126 stars, multi-robot simulation), Arduino/ESP32 (74 stars, hardware control), robot arms (66 stars, SO-ARM100), PlatformIO (1,000+ boards). 45+ servers across ROS, home automation, embedded, drones, and simulation. Rating: 4.0/5."
content_type: "Review"
card_description: "Robotics MCP servers for controlling physical hardware through AI agents — from industrial robot arms to smart home devices to embedded microcontrollers. This is one of the most exciting MCP categories because it bridges the digital-physical gap. **Home Assistant dominates** with homeassistant-ai/ha-mcp (1,200 stars, 80+ tools) providing comprehensive smart home control — device management, automation, calendars, cameras, backups, and system queries. Two community alternatives (tevonsb/homeassistant-mcp at 529 stars with SSE real-time updates, voska/hass-mcp at 244 stars with token-efficient design) ensure the smart home space is well-covered. **ROS/ROS2 is the other major hub** — robotmcp/ros-mcp-server (873 stars) enables bidirectional AI-ROS integration without modifying existing robot code, supporting topic subscription, service calls, and sensor data reading for any ROS1/ROS2 robot. lpigeon/ros-mcp-server (148 stars, MIT) adds parameter control and cross-platform support. At least 5 additional ROS2 implementations exist. **Embedded hardware has surprising depth** — choturobo (74 stars) controls Arduino ESP32/Nano robots, platformio-mcp covers 1,000+ boards across 30+ platforms, embedded-debugger-mcp (52 stars, Rust) provides ARM Cortex-M and RISC-V debugging with J-Link/ST-Link, and multiple ESP32-native MCP server libraries exist for running MCP directly on microcontrollers. **Robot arms** are represented by universal-robot-mcp (Universal Robots with joint/linear/Cartesian control and collision detection) and robot_MCP (66 stars, SO-ARM100/101 educational arms). **NVIDIA Isaac Sim** (126 stars, MIT) enables natural language control of physics-based robot simulation with dynamic placement of Franka, G1, Go1, and Jetbot robots. ZigBee devices get coverage through MCP2ZigBee2MQTT. Quadruped robots have a dedicated Unitree Go2 server (17 stars). Even humanoid robots are covered — reachy-mini-mcp controls Pollen Robotics' Reachy Mini with speech, vision, and 12 emotions. Major gaps: no official servers from any robot manufacturer (Universal Robots, Boston Dynamics, Fanuc, ABB, KUKA, iRobot), no Gazebo-native simulation (only via ROS bridge), no dedicated warehouse/logistics robot servers, no agricultural robot servers, no Roomba/consumer robot integration. The category earns 4.0/5 — exceptional community coverage in home automation and ROS, with embedded hardware emerging as a surprisingly active frontier."
---

Robotics MCP servers bridge the gap between AI and the physical world — letting agents control robot arms, manage smart homes, program microcontrollers, fly drones, and run physics simulations. Instead of writing ROS commands or Home Assistant YAML by hand, these servers let AI agents interact with hardware through natural language.

This review covers the **robotics and hardware automation** vertical — ROS/ROS2 integration, home automation, embedded systems, robot arms, simulation, drones, and computer vision for robotics. For 3D printing and CNC, see our [Printing & 3D Printing MCP review](/reviews/printing-3d-printing-mcp-servers/). For industrial IoT and manufacturing, see our [Manufacturing & Industrial MCP review](/reviews/manufacturing-industrial-mcp-servers/). For IoT and embedded platforms, see our [IoT & Embedded MCP review](/reviews/iot-embedded-mcp-servers/).

The headline findings: **Home Assistant has the most popular robotics-adjacent MCP server** at 1,200 stars with 80+ tools. **ROS/ROS2 integration is maturing fast** — robotmcp/ros-mcp-server (873 stars) works with any ROS robot without code changes. **Embedded hardware is a surprisingly active frontier** — multiple libraries let you run MCP servers directly on ESP32 and RP2040 microcontrollers. **No major robot manufacturer has an official MCP server** — not Universal Robots, Boston Dynamics, Fanuc, ABB, or KUKA.

## Home Automation

### homeassistant-ai/ha-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [homeassistant-ai/ha-mcp](https://github.com/homeassistant-ai/ha-mcp) | 1,200 | Python | MIT | 80+ |

The **most popular server in this entire review** and among the highest-starred MCP servers in any category. This is the official Home Assistant MCP integration, providing comprehensive smart home control:

- **Device control** — lights, switches, thermostats, locks, covers, fans, media players
- **Automation management** — create, modify, trigger, and debug automations
- **Entity search** — query device states across your entire home
- **Calendars and todo lists** — integrated scheduling and task management
- **Dashboards** — manage Lovelace dashboard configurations
- **Backup and restore** — system backup management
- **History and statistics** — query historical sensor data and trends
- **Camera snapshots** — capture images from connected cameras
- **System queries** — check Home Assistant health, add-ons, and configuration

80+ tools make this one of the most feature-rich MCP servers in existence, rivaling Garmin's 96-tool fitness server.

### tevonsb/homeassistant-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [tevonsb/homeassistant-mcp](https://github.com/tevonsb/homeassistant-mcp) | 529 | TypeScript | Apache-2.0 | — |

A community alternative with a key differentiator: **SSE (Server-Sent Events) for real-time updates.** While the official server uses request-response, this server streams state changes as they happen — useful for monitoring scenarios like "tell me when the front door opens."

### voska/hass-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [voska/hass-mcp](https://github.com/voska/hass-mcp) | 244 | Python | — | — |

Focuses on **token efficiency** — a real concern when LLMs query hundreds of smart home entities. Includes smart search, diagnostic tools, guided prompts, and Docker deployment. Good for homes with many devices where context window management matters.

### Additional Home Automation Servers

- **allenporter/mcp-server-home-assistant** (~60 stars, Python) — lightweight bridge, 1 tool for contextual smart home awareness
- **jango-blockchained/advanced-homeassistant-mcp** — secure and extensible, supports Claude/GPT/Cursor
- **ichbinder/MCP2ZigBee2MQTT** — intelligent ZigBee device discovery via MQTT broker, auto-analyzes device capabilities, remote server support via HTTP

The Home Assistant ecosystem is **the most well-served niche in robotics MCP** — 7 implementations ensure coverage for virtually any smart home setup.

## ROS / ROS2 Integration

### robotmcp/ros-mcp-server

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [robotmcp/ros-mcp-server](https://github.com/robotmcp/ros-mcp-server) | 873 | Python | — | — |

The **most popular ROS MCP server** and the gateway to controlling any ROS-based robot with AI. Key features:

- **Bidirectional AI-ROS integration** — not just sending commands, but receiving sensor data and robot state
- **ROS1 and ROS2 support** — works with both generations of the Robot Operating System
- **Zero code changes** — only requires a rosbridge node on the robot side
- **Topic subscription** — real-time sensor data streams (lidar, cameras, IMU, joint states)
- **Service calls** — trigger robot behaviors (navigation goals, gripper commands, mode changes)
- **Multi-platform AI support** — works with Claude Desktop, Gemini, and ChatGPT

The "no changes to existing robot code" design is critical — it means any lab or factory with an existing ROS robot can add AI control without touching their deployment.

### lpigeon/ros-mcp-server

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [lpigeon/ros-mcp-server](https://github.com/lpigeon/ros-mcp-server) | 148 | Python | MIT | ~8 |

A more focused alternative with explicit tool definitions: list topics, list services, list message types, view type definitions, publish/subscribe topics, call services (including custom), get/set parameters. Uses WebSocket via rosbridge and works cross-platform (Linux/Windows/macOS).

### Additional ROS Implementations

- **kakimochi/ros2-mcp-server** (~73 stars, Python, MIT) — ROS2-specific, topic-based robot control
- **Yutarop/ros-mcp** (Python) — controls robots via topics, services, and actions; includes socket server for Gazebo/rqt_graph launching
- **TakanariShimbo/rosbridge-mcp-server** (Python, 8 tools) — rosbridge WebSocket monitoring and control
- **wise-vision/mcp_server_ros_2** (~4 stars, Python, MPL-2.0) — subscribe, publish, list, and call services
- **ngres/ros2mcp** — expose arbitrary ROS2 services and topics as MCP tools; includes Gazebo and Rviz2 demo

At least 7 independent ROS MCP servers exist — reflecting the robotics community's enthusiasm for AI integration. The pattern mirrors what we see in other popular APIs like Google Calendar: once the use case is obvious, multiple implementations appear rapidly.

## Embedded Hardware

### vishalmysore/choturobo

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [vishalmysore/choturobo](https://github.com/vishalmysore/choturobo) | 74 | JavaScript | — | — |

Controls **Arduino ESP32 and Arduino Nano 368** robot hardware via MCP using the Johnny-Five library:

- LEDs, motors, servos, fans, sensors
- Wireless control via ESP32 WiFi
- Wired USB control via Arduino Nano
- Natural language robot commands through Claude/GPT

### jl-codes/platformio-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [jl-codes/platformio-mcp](https://github.com/jl-codes/platformio-mcp) | — | — | MIT | — |

**Board-agnostic embedded development** via PlatformIO — supports 1,000+ boards across 30+ platforms including ESP32, Arduino, STM32, nRF52, and RP2040. Initialize projects, build firmware, upload, monitor serial, and manage libraries, all through AI.

### Adancurusul/embedded-debugger-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [Adancurusul/embedded-debugger-mcp](https://github.com/Adancurusul/embedded-debugger-mcp) | 52 | Rust | MIT | — |

**Embedded debugging with probe-rs** — supports ARM Cortex-M and RISC-V architectures with J-Link and ST-Link integration. Having an AI agent help with embedded debugging could be transformative for developers who spend hours decoding register dumps.

### MCP on Microcontrollers

A fascinating subcategory: libraries that run MCP servers **directly on microcontrollers**:

- **AaronWander/EmbedMCP** (C) — lightweight C library for creating MCP servers on STM32, ESP32, Nordic nRF, and Raspberry Pi. Transforms C functions into AI-accessible tools.
- **redbasecap-buiss/mcpd** — MCP Server SDK for ESP32/RP2040 with built-in GPIO tools (digital read/write, analog read, pin mode), WiFi info, I2C scanner
- **navado/ESP32MCPServer** — WebSocket-based MCP on ESP32 for resource discovery and monitoring
- **ertgtct/mcpesp** — ESP32 MCP server library, exposes hardware capabilities via HTTP/JSON-RPC

Running MCP natively on a $5 microcontroller is remarkable — it means any ESP32 project can become AI-controllable without a host computer.

### Additional Embedded Servers

- **Volt23/mcp-arduino-server** (Python, FastMCP) — arduino-cli bridge, manage sketches/boards/libraries, WireViz schematics
- **AimanMadan/Arduino_MCP_Server** — control Arduino from computer via MCP
- **grammy-jiang/RaspberryPiOS-MCP** (Python) — system monitoring, GPIO control, I2C communication, camera capture, Cloudflare Tunnel + OAuth, self-update

## Robot Arms

### IliaLarchenko/robot_MCP

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [IliaLarchenko/robot_MCP](https://github.com/IliaLarchenko/robot_MCP) | 66 | Python | — | — |

Controls **SO-ARM100/101 educational robot arms** with partial LeKiwi support (arm only). Works with Claude, Gemini, and GPT models. Includes a simple agent for autonomous task execution.

### RoversX/universal-robot-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [RoversX/universal-robot-mcp](https://github.com/RoversX/universal-robot-mcp) | — | Python | — | — |

The only **industrial robot arm** MCP server found — controls Universal Robots cobots with:

- Robot connection management
- Real-time status monitoring
- Joint motion control
- Linear motion control
- Cartesian path planning
- Simulation mode
- Collision detection and movement validation

Universal Robots makes the world's most popular collaborative robot arms (used in factories worldwide), so having MCP integration — even community-built — is significant.

### monteslu/robot-mcp

A minimal but fun implementation: **1 tool (moveMyServo, 0-180 degrees)** using Johnny-Five. The simplest possible robot arm MCP server — controls a single servo motor.

## Simulation

### omni-mcp/isaac-sim-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [omni-mcp/isaac-sim-mcp](https://github.com/omni-mcp/isaac-sim-mcp) | 126 | Python | MIT | — |

**NVIDIA Isaac Sim integration** — the most capable robotics simulation platform available. Features:

- Natural language control of simulation environments
- Dynamic robot placement (Franka Panda, Unitree G1 humanoid, Unitree Go1 quadruped, NVIDIA Jetbot)
- Robot movement controls with physics-based interactions
- Multi-robot grid creation for swarm scenarios
- Quadruped walking simulation with waypoint navigation
- Custom lighting and USD asset search

Isaac Sim is industry-standard for robotics simulation — this server makes it accessible to AI agents for testing robot behaviors without physical hardware.

## Drones & UAV

### ion-g-ion/MAVLinkMCP

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [ion-g-ion/MAVLinkMCP](https://github.com/ion-g-ion/MAVLinkMCP) | 15 | Python | — | — |

Controls **PX4 and ArduPilot drones** via the MAVLink protocol — the standard communication protocol used by millions of drones worldwide. Enables LLM-to-drone communication with a fastagent client example.

### Additional Drone Servers

- **0xKoda/drone-mcp** (Python) — DJI Tello control with takeoff, land, directional movement, rotation, SSE real-time streaming
- **showkeyjar/robot-mcp-server** (Python) — dual-purpose: Unitree robot motion control + DJI drone flight commands (takeoff/landing), emergency stop, real-time status

## Computer Vision for Robotics

- **groundlight/mcp-vision** (Python) — HuggingFace computer vision models (zero-shot object detection) as MCP tools
- **GongRzhe/opencv-mcp-server** (Python) — OpenCV image/video processing, from basic manipulation to advanced object detection and tracking
- **GongRzhe/YOLO-MCP-Server** (Python) — YOLO object detection, segmentation, classification, real-time camera analysis via Claude

## Quadruped & Humanoid Robots

### lpigeon/unitree-go2-mcp-server

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [lpigeon/unitree-go2-mcp-server](https://github.com/lpigeon/unitree-go2-mcp-server) | 17 | Python | — | — |

Natural language control of the **Unitree Go2 robot dog** — commands are translated to ROS2 instructions. Requires ROS2 Humble or Foxy.

### jackccrawford/reachy-mini-mcp

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [jackccrawford/reachy-mini-mcp](https://github.com/jackccrawford/reachy-mini-mcp) | — | — | Apache-2.0 | 7 |

Controls **Pollen Robotics Reachy Mini humanoid robot** — speak, listen, see, and express 12 built-in emotions. Works with Claude/GPT/Grok. Zero robotics expertise required, 30 minutes to first demo.

## Serial & Hardware Communication

- **mcp2everything/mcp2serial** (Python) — AI-to-hardware control via serial communication, Raspberry Pi Pico support
- **Adancurusul/serial-mcp-server** — comprehensive serial communication for embedded systems, IoT devices, hardware debugging

## Robot Memory

### robotmem/robotmem

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [robotmem/robotmem](https://github.com/robotmem/robotmem) | — | Python | — | 7 |

**Persistent memory for AI-controlled robots** — a niche but important capability. Uses SQLite + FTS5 for full-text search, BM25 ranking, vector search via FastEmbed, spatial nearest-neighbor sorting, and memory consolidation with proactive recall. CPU-only, single-file database. Useful for robots that need to remember past interactions, locations, or learned behaviors across sessions.

## Industrial Automation

### poly-mcp/IoT-Edge-MCP-Server

| Server | Stars | Language | License | Tools |
|--------|-------|----------|---------|-------|
| [poly-mcp/IoT-Edge-MCP-Server](https://github.com/poly-mcp/IoT-Edge-MCP-Server) | — | Python | — | — |

The only **industrial IoT MCP server** found — integrates MQTT + Modbus protocols with InfluxDB time-series storage, Redis cache, real-time monitoring, alarms, and actuator control. Enterprise-grade, works with PolyMCP for AI agent orchestration.

## What's Missing

The gaps in robotics MCP are significant:

- **No official manufacturer servers** — Universal Robots, Boston Dynamics, Fanuc, ABB, KUKA, iRobot, and every other major robot company are absent
- **No Gazebo-native MCP** — simulation is only accessible via ROS bridge, not directly
- **No warehouse/logistics robot servers** — no AMR (Autonomous Mobile Robot) fleet management
- **No agricultural robot servers** — despite precision agriculture being a major robotics market
- **No consumer robot integration** — no Roomba, no Roborock, no lawn mower robots
- **No Peloton or Zwift** — fitness equipment with robotics-like control surfaces
- **No safety-certified servers** — robotics has strict safety standards (ISO 10218, IEC 62443) that no MCP server addresses
- **No digital twin platforms** — Azure Digital Twins, AWS IoT TwinMaker, Siemens MindSphere are all absent

The safety gap is particularly notable. Industrial robots can cause serious harm, and none of these servers implement the safety interlocks, watchdog timers, or emergency stop protocols that real industrial deployments require. The Universal Robots MCP has collision detection, but that's the exception.

## Bottom Line

Robotics MCP servers earn **4.0 out of 5**. The category is surprisingly deep — 45+ servers across home automation, ROS, embedded hardware, robot arms, simulation, drones, and computer vision.

**Home Assistant is the standout** at 1,200 stars with 80+ tools — it's one of the most comprehensive MCP servers in any category, not just robotics. **ROS integration is maturing fast** with 7+ implementations led by robotmcp at 873 stars. **The embedded subcategory is the most exciting frontier** — multiple projects now run MCP servers directly on $5 microcontrollers, democratizing AI-hardware integration.

The community is building faster than the manufacturers. No major robot company has released an official MCP server, leaving community developers to reverse-engineer APIs and build bridges. This pattern — community leading, vendors following — is consistent across the MCP ecosystem, but the stakes in robotics are higher because physical hardware is involved.

For smart home enthusiasts, **ha-mcp** is essential. For roboticists, **robotmcp/ros-mcp-server** is the universal adapter. For makers and hobbyists, **platformio-mcp** and **choturobo** open up AI-controlled hardware projects. For researchers, **isaac-sim-mcp** brings NVIDIA's simulation stack to AI agents. The category has real depth — and it's only getting deeper.
