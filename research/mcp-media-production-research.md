# MCP Servers for Media Production & Broadcasting — Research Survey

**Date**: 2026-03-30
**Researcher**: ChatForest AI Agent (Claude)
**Scope**: Comprehensive survey of MCP (Model Context Protocol) servers across video production, audio production, broadcasting, media asset management, graphics/VFX, podcasting, music streaming, image generation, content distribution, and transcription/captioning.

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Video Production & Editing](#1-video-production--editing-mcp-servers)
3. [Audio Production & Music](#2-audio-production--music-mcp-servers)
4. [Broadcasting & Streaming](#3-broadcasting--streaming-mcp-servers)
5. [Media Asset Management](#4-media-asset-management-mcp-servers)
6. [Graphics, VFX & 3D](#5-graphics-vfx--3d-mcp-servers)
7. [Podcast & Content Creation](#6-podcast--content-creation-mcp-servers)
8. [Music & Audio Streaming Platforms](#7-music--audio-streaming-platform-mcp-servers)
9. [Image Generation & Editing](#8-image-generation--editing-mcp-servers)
10. [Content Distribution & Delivery](#9-content-distribution--delivery-mcp-servers)
11. [Transcription & Captioning](#10-transcription--captioning-mcp-servers)
12. [AI Video Generation](#11-ai-video-generation-mcp-servers)
13. [Market Data & Industry Trends](#market-data--industry-trends)
14. [Major Gaps — Platforms Without MCP Servers](#major-gaps--platforms-without-mcp-servers)
15. [Regulatory Considerations](#regulatory-considerations)
16. [Sources](#sources)

---

## Executive Summary

The MCP ecosystem for media production and broadcasting has grown substantially by early 2026, with **160+ servers** identified across all categories. The landscape is dominated by community-built servers, with a small but growing number of official vendor integrations (ElevenLabs, Cloudinary, Figma, Canva, Epidemic Sound). FFmpeg-based servers are the most mature and widely adopted for video/audio processing, while professional NLE (non-linear editing) integrations for Premiere Pro, DaVinci Resolve, and After Effects are emerging rapidly. Notable gaps remain in broadcast automation, professional DAW support beyond Ableton, and many major SaaS platforms (Descript, Riverside, Anchor/Spotify for Creators) that lack MCP servers entirely.

**Key statistics:**
- Total servers identified: ~165+
- Official/vendor-built servers: ~8 (ElevenLabs, Cloudinary, Figma, Canva, Epidemic Sound, Dacast, Transloadit, Mux)
- Highest-starred server: Figma-Context-MCP (14,024 stars) — though primarily design-to-code
- Highest-starred media-specific: ElevenLabs MCP (1,278 stars)
- Market size: AI in media & entertainment projected at $99.48B by 2030

---

## 1. Video Production & Editing MCP Servers

### FFmpeg-Based Servers (General-Purpose Video Processing)

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **video-creator/ffmpeg-mcp** | 126 | Video search, trimming, stitching, playback, clip, overlay, concat | Community | ~15 tools |
| **egoist/ffmpeg-mcp** | 119 | Clean FFmpeg wrapper for MCP | Community | ~10 tools |
| **misbahsy/video-audio-mcp** | 66 | Basic video and audio editing via FFmpeg | Community | ~12 tools |
| **kevinwatt/ffmpeg-mcp-lite** | 21 | Convert, compress, trim, extract audio, add subtitles | Community | ~8 tools |
| **dubnium0/ffmpeg-mcp** | 15 | Advanced FFmpeg operations | Community | ~15 tools |
| **AmolDerickSoans/ffmpeg-mcp** | 14 | Decode, encode, transcode, mux, demux, stream, filter | Community | ~20 tools |
| **bitscorp-mcp/mcp-ffmpeg** | N/A | FFmpeg Video Processor (listed on Smithery) | Community | N/A |

### Adobe Premiere Pro

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **hetpatel-11/Adobe_Premiere_Pro_MCP** | 98 | 97 tools exposed; project ops, ingest, sequence creation, timeline editing, transitions, effects, keyframes, metadata, exports | Community | 97 tools (43 live-tested) |
| **leancoderkavy/premiere-pro-mcp** | 11 | CEP/ExtendScript integration, AI-driven video editing | Community | 269 tools |
| **ayushozha/AdobePremiereProMCP** | 5 | Timeline editing, color grading, audio mixing, effects, export | Community | 1,027 tools (claimed) |
| **jordanl61/premiere-pro-mcp-server** | N/A | Premiere Pro automation | Community | N/A |

### DaVinci Resolve

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **samuelgursky/davinci-resolve-mcp** | 732 | Project management, timeline manipulation, media pool, color grading, Fusion, audio, playback | Community | 50+ tools |
| **Tooflex/davinci-resolve-mcp** | 12 | Expanded feature fork | Community | ~40 tools |
| **guycochran/resolve-mcp-server** | 4 | AI-powered remote video editing via Claude | Community | 53 tools |
| **JossBen/mcp-video-editing-assistant** | 1 | Learning video editing patterns with Resolve integration | Community | N/A |

### Final Cut Pro

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **DareDev256/fcpxml-mcp-server** | 26 | FCPXML manipulation, timeline analysis, batch editing, QC, multi-track | Community | 53 tools |
| Multiple AppleScript-based servers | N/A | ~100 tools via AppleScript/JXA automation; project management, import, timeline, effects | Community | ~100 tools |

### Other Video Editing

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **IbrarArif/video-editing-mcp-server** (VideoCraft) | 6 | AI-powered video editing suite | Community | N/A |
| **timkulbaev/ai-video-editor** | 4 | Auto-edits talking-head videos; removes silences, filler words | Community | N/A |
| **MigueDuque/capcut-mcp-server-extended** | 2 | CapCut MCP server with presets and parametrized workflows | Community | N/A |
| **moeloubani/editly-mcp** | 1 | Editly video editing with cross-platform support | Community | N/A |
| **robinbraemer/roughcut** | 0 | Agentic video editing: MCP server + Studio UI | Community | N/A |

---

## 2. Audio Production & Music MCP Servers

### DAW Integration

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **ahujasid/ableton-mcp** | 2,358 | Two-way MCP control of Ableton Live sessions; tracks, clips, tempo, instruments | Community | ~30 tools |
| **uisato/ableton-mcp-extended** | 148 | Extended Ableton Live control through AI assistants | Community | ~40 tools |
| **xiaolaa2/ableton-copilot-mcp** | 73 | Real-time Ableton Live 12 control; song management, MIDI editing, audio recording | Community | 104 tools |
| **hamzabels85/reaper-mcp** | N/A | AI-powered REAPER music production; create fully mixed/mastered tracks | Community | ~58 tools |
| **davidpadbury/music-assistant-mcp** | N/A | REAPER DAW control; project management, tracks, MIDI, FX, mixing, mastering, rendering | Community | 58 tools |
| **axiomantic/audiomancer** | 0 | AI-assisted music production with TidalCycles; sample libraries, audio analysis | Community | N/A |

### Audio Processing

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **DeveloperZo/mcp-audio-tweaker** | N/A | Batch audio processing via FFmpeg; sample rate, bitrate, volume, effects, mastering presets | Community | ~10 tools |
| **bretbouchard/audio_agent_mcp** | 1 | Audio analysis, MIDI learning, device optimization with librosa, numpy | Community | N/A |
| **matthensleyio/FFMpeg.MCP** | 1 | .NET 9 FFMpeg audio processing; conversion, trimming, merging, quality, metadata | Community | ~8 tools |

### Text-to-Speech & Voice

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **elevenlabs/elevenlabs-mcp** | 1,278 | TTS, voice cloning, audio transcription, voice agents, outbound calls, audio isolation, soundscapes | **Official** | ~15 tools |
| **mamertofabian/elevenlabs-mcp-server** | N/A | Community ElevenLabs integration | Community | N/A |

### AI Music Generation

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **sandraschi/suno-mcp** | N/A | Suno AI music generation; custom and inspiration modes | Community | ~5 tools |
| **mcp-suno** (PyPI) | N/A | Suno via AceDataCloud API; generate music, lyrics, manage audio | Community | ~5 tools |
| **blooper20/fingerstyle-tab-mcp** | 1 | Convert guitar audio to fingerstyle tablature using Spotify's Basic Pitch | Community | N/A |

---

## 3. Broadcasting & Streaming MCP Servers

### OBS Studio

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **royshil/obs-mcp** | 78 | OBS via WebSocket; scene management, source control, streaming/recording, transitions | Community | ~20 tools |
| **sbroenne/mcp-server-obs** | 6 | .NET 10 MCP server for OBS; recordings, streaming, scenes, window capture | Community | ~15 tools |
| **yshk-mrt/obs-mcp** | N/A | OBS automation (YC hackathon project) | Community | N/A |
| **LarsCanGit/OBS-MCP** | N/A | OBS MCP server | Community | N/A |

### Live Streaming Platforms

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **Dacast MCP Live Stream Server** | N/A | AI-driven live streaming automation; simulcast, DVR, recording, playlists, thumbnails | **Official** | N/A |

### Platform Integrations (YouTube, Twitch)

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **anaisbetts/mcp-youtube** | 507 | YouTube transcript extraction, content analysis | Community | ~5 tools |
| **ZubeidHendricks/youtube-mcp-server** | 473 | YouTube API; video management, Shorts creation, advanced analytics | Community | ~20 tools |
| **TomCools/twitch-mcp** | 6 | Twitch Chat integration; Quarkus-based | Community | ~5 tools |
| **mtane0412/twitch-mcp-server** | 2 | Twitch Helix API; channel info, streams, games, users, clips, chat settings | Community | ~15 tools |
| 40+ other YouTube MCP servers | Various | Transcript extraction, metadata, playlist management | Community | Various |

### Screen Recording & Capture

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **m2ai-mcp-servers/loom-mcp** | N/A | Loom video management; list, retrieve, edit, merge recordings | Community | ~6 tools |
| **nihitgupta2/devstudio** | 4 | Screen recording, demo automation, multi-monitor, audio/video mux | Community | N/A |

---

## 4. Media Asset Management MCP Servers

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **cloudinary/mcp-servers** | 8 | Upload, transform, search, organize media; OAuth, remote/local server options; MediaFlows; structured metadata | **Official** | ~20 tools |
| **Transloadit MCP Server** | N/A | 86+ processing robots; video encoding (HLS/MP4/WebM), image resize/crop/watermark, audio transcode, OCR, STT/TTS, AI moderation | **Official** | 86+ robots |

---

## 5. Graphics, VFX & 3D MCP Servers

### Adobe After Effects

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **Dakkshin/after-effects-mcp** | 257 | Remote control via ExtendScript; compositions, text, shapes, solids, properties, keyframes | Community | ~30 tools |
| **p10q/ae-mcp** | 16 | After Effects interaction via MCP; cross-platform | Community | ~20 tools |

### Blender

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **poly-mcp/Blender-MCP-Server** | 31 | Control Blender via AI agents; thread-safe, auto-dependency install | Community | 51 tools |
| **seehiong/blender-mcp-n8n** | 30 | Blender automation from n8n; modeling, materials, lighting, rendering, animation | Community | 45+ tools |
| **PatrykIti/blender-ai-mcp** | 8 | Modular MCP + Blender addon; YAML workflows, semantic search | Community | ~30 tools |
| **youichi-uda/blender-mcp-pro** | 4 | Lights, modifiers, animation, shader nodes, geometry nodes | Community | 100+ tools |
| **RFingAdam/mcp-blender** | 1 | Most comprehensive claimed; 3D modeling, AI generation, MSFS content | Community | 218 tools |
| 10+ additional Blender MCP servers | 0-4 | Various Blender automation approaches | Community | Various |

### Game Engines (3D/VFX Adjacent)

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **CoplayDev/unity-mcp** | 7,807 | Unity Editor bridge; assets, scenes, scripts, graphics, packages | Community | 25+ tools |
| **chongdashu/unreal-mcp** | 1,661 | Unreal Engine control via natural language; Cursor, Windsurf, Claude Desktop | Community | ~30 tools |
| **flopperam/unreal-engine-mcp** | 706 | UE 5.5+; build 3D worlds, architectural scenes with AI commands | Community | ~25 tools |
| **HurtzDonutStudios/ai-forge-mcp** | 4 | 250 tools across 10 servers; Blender, Substance Painter/Designer/Sampler, UE5 | Community | 250 tools |

### Adobe Creative Suite (Multi-App)

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **mikechambers/adb-mcp** | 531 | Adobe Creative Suite MCP; Photoshop, Affinity Photo/Designer/Publisher, Canva | Community | ~40 tools |

### Multi-Tool Suites

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **Travor278/OmniMCP** | 3 | Multimodal automation; FFmpeg, GIMP, Inkscape, Blender, FreeCAD, MATLAB, Godot | Community | 54 tools |

---

## 6. Podcast & Content Creation MCP Servers

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **Pod Engine MCP** | N/A | Direct AI agent access to podcast data | Community/Official | N/A |
| **chaodoze/transcriber** | 0 | Podcast transcription with speaker diarization; Apple Silicon optimized | Community | N/A |
| **quietnotion/barevalue-mcp** | N/A | Upload raw audio, get edited episodes; filler removal, noise reduction, transcripts, show notes, social clips | Community | N/A |
| **NvkAnirudh/LinkedIn-Post-Generator** | 20 | Generate LinkedIn posts from YouTube video transcripts | Community | ~5 tools |

### Notable Gap

No dedicated MCP servers were found for major podcast hosting platforms: **Buzzsprout, Spotify for Creators (Anchor), RSS.com, Podbean, Transistor, Captivate, Libsyn, or Simplecast**. Similarly, **Descript** (the leading AI podcast editor) has no MCP server despite having an API.

---

## 7. Music & Audio Streaming Platform MCP Servers

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **marcelmarais/spotify-mcp-server** | 269 | Lightweight; playback control, playlist management | Community | ~10 tools |
| **Carrieukie/spotify-mcp-server** | 19 | Spotify Web API; playback, search, playlists, user profiles | Community | ~15 tools |
| **PeterAkande/spotify_mcp** | N/A | Python/FastMCP; highly comprehensive | Community | 36+ tools |
| **kennethreitz/mcp-applemusic** | 79 | Apple Music control via AppleScript (macOS only) | Community | ~10 tools |
| **akr4/applemusic-mcp-server** | N/A | Rust-based; Apple Music Web API, search, deep links | Community | ~5 tools |
| **yuhuacheng/tidal-mcp** | 37 | TIDAL authentication, favorites, recommendations, playlist management | Community | ~8 tools |
| **Epidemic Sound MCP** | N/A | Royalty-free music search and licensing for AI agents | **Official (Beta)** | N/A |
| 15+ additional Spotify MCP servers | 0-2 | Various Spotify integrations | Community | Various |

### Notable Gap

No MCP servers found for: **SoundCloud, Bandcamp, Deezer, Amazon Music, Pandora, YouTube Music (standalone)**.

---

## 8. Image Generation & Editing MCP Servers

### AI Image Generation

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **SureScaleAI/openai-gpt-image-mcp** | 97 | OpenAI GPT-4o/gpt-image-1 generation and editing | Community | ~5 tools |
| **shinpr/mcp-image** | 92 | Gemini-powered; prompt optimization, quality presets (fast/balanced/quality) | Community | ~5 tools |
| **spartanz51/imagegen-mcp** | 33 | OpenAI text-to-image, image-to-image with mask | Community | ~5 tools |
| **qhdrl12/mcp-server-gemini-image-generator** | 31 | Gemini Flash models; intelligent filename generation | Community | ~3 tools |
| **CLOUDWERX-DEV/gpt-image-1-mcp** | 18 | OpenAI gpt-image-1 generation and editing | Community | ~5 tools |
| **Lala-0x3f/mj-mcp** | 7 | Midjourney MCP server | Community | ~3 tools |
| **strato-space/media-gen-mcp** | 8 | OpenAI gpt-image-1 and Sora-2; images and video | Community | ~8 tools |
| **ImaginePro MCP** | N/A | Multi-model: Midjourney, Flux, Nano Banana | Community | ~10 tools |
| 20+ additional image generation servers | 0-5 | Various providers (Gemini, Grok, RunPod, Azure, OpenRouter) | Community | Various |

### Design Platforms

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **GLips/Figma-Context-MCP** | 14,024 | Figma layout info for AI coding agents | Community | ~10 tools |
| **figma/mcp-server-guide** | 756 | Official Figma MCP server guide; write to canvas, design context | **Official** | ~15 tools |
| **Canva MCP Server** | N/A | Create designs, autofill templates, search, export; first design platform with native MCP | **Official** | ~10 tools |

---

## 9. Content Distribution & Delivery MCP Servers

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **Mux MCP Server** | N/A | Upload video assets, playback policies, streaming analytics, multi-CDN | **Official** | N/A |
| **Cloudflare Stream MCP** | N/A | Upload via URL, live stream management, signed URLs; part of Cloudflare Agents | **Official** | N/A |
| **Transloadit MCP** | N/A | Media processing pipeline; HLS encoding, image optimization, delivery | **Official** | 86+ robots |
| **Cloudinary MCP** | 8 | Image/video transformation, optimization, CDN delivery | **Official** | ~20 tools |

### Notable Gap

No MCP servers found for: **Vimeo, Wistia, Brightcove, JW Player, Bunny Stream, AWS MediaConvert, Azure Media Services**.

---

## 10. Transcription & Captioning MCP Servers

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **arcaputo3/mcp-server-whisper** | 50 | OpenAI Whisper + GPT-4o; advanced audio transcription | Community | ~5 tools |
| **BigUncle/Fast-Whisper-MCP-Server** | 14 | Faster Whisper; high-performance speech recognition | Community | ~3 tools |
| **SmartLittleApps/local-stt-mcp** | 12 | Local whisper.cpp; speaker diarization, multi-format (txt/json/vtt/srt/csv), Apple Silicon optimized | Community | ~5 tools |
| **vittuhy/audio-and-video-transcript** (Apify) | N/A | Transcribe video/audio to TXT, SRT, VTT, TSV, JSON via Whisper | Community | ~3 tools |
| **kvadratni/speech-faster-whisper** | N/A | Speech interface with Faster Whisper | Community | N/A |
| **DefiBax/voice-recorder-whisper** | N/A | Voice recording + Whisper transcription | Community | N/A |
| **tomoima525/vid-subtitle** | 1 | Add subtitles to videos using FFmpeg + Whisper API | Community | ~3 tools |
| **EthanBobbyTR/VideoMCP** | 1 | Video to frames + transcription via FFmpeg and Whisper | Community | ~3 tools |
| **chaodoze/transcriber** | 0 | Podcast transcription with speaker diarization | Community | N/A |
| Elysia Tools (noise reduction + analysis) | N/A | FFmpeg-based audio processing MCP server API | Community | ~5 tools |

---

## 11. AI Video Generation MCP Servers

| Server | GitHub Stars | Key Features | Official/Community | Tools |
|--------|-------------|--------------|-------------------|-------|
| **writingmate/sora-2-mcp** | 2 | OpenAI Sora 2 generation + FFmpeg merging/fade animations | Community | ~5 tools |
| **strato-space/media-gen-mcp** | 8 | OpenAI gpt-image-1 + Sora-2; images and video with compression | Community | ~8 tools |
| **VidCraftAI (Adiverse07)** | 2 | Natural language to Manim animations; React + Flask + MCP | Community | N/A |
| **HeyGen MCP integration** | N/A | Automated video creation via AI avatars | Community | N/A |
| **Google Veo MCP integration** | N/A | Referenced in skill tools; Veo integration for video generation | Community | N/A |

**Note**: OpenAI announced Sora app shutdown (April 26, 2026) and API shutdown (September 24, 2026). Google Veo 3.1 continues development with 1080p, synchronized audio, and non-destructive editing.

---

## Market Data & Industry Trends

### Market Size

| Metric | Value | Source |
|--------|-------|--------|
| AI in Media & Entertainment (2024) | $25.98B | Grand View Research |
| AI in Media & Entertainment (2025) | $33.68B | Grand View Research |
| AI in Media & Entertainment (2030 projected) | $99.48B | Grand View Research |
| CAGR (2025-2030) | 24.2% | Grand View Research |
| AI Video Generator Market (2026) | $847M-$946M | Fortune Business Insights / Business Research Co. |
| AI Video Generator Market (2034 projected) | $3.35B | Fortune Business Insights |
| AI Video Generation & Editing Software (2026) | $3.67B | Meticulous Research |
| AI Video Generation & Editing Software (2036 projected) | $24.89B | Meticulous Research |
| AI Content Generation Market (2026) | $7.09B | Research and Markets |
| AI Content Generation Market (2030 projected) | $26.73B | Research and Markets |
| Generative AI in Media & Entertainment (2035 projected) | $21.2B | Precedence Research |

### Key Industry Trends

1. **AI-Native Media Organizations**: By 2026, companies built from the ground up on AI are expected to operate with 20-30% human costs compared to traditional media companies' 60-70%.

2. **AI Video Goes Mainstream**: Experts predict 75% of marketing videos will be AI-generated or AI-assisted by end of 2026. Sora is shutting down (April/September 2026), while Google Veo 3.1 adds 1080p with synchronized audio and non-destructive editing.

3. **MCP as Creative Middleware**: MCP is emerging as the standard protocol connecting AI assistants to creative tools, replacing one-off scripts with consistent orchestrated control layers. Every major game engine now has MCP integration.

4. **Professional NLE Integration Explosion**: DaVinci Resolve (732 stars), After Effects (257 stars), Premiere Pro (98 stars), and Ableton Live (2,358 stars) all have substantial MCP server ecosystems developing rapidly.

5. **Real-Time AI Broadcasting**: Dacast's MCP Live Stream Server and OBS MCP integrations signal the beginning of AI-orchestrated live production, reducing manual complexity for solo creators.

6. **Voice AI Maturity**: ElevenLabs' official MCP server (1,278 stars) shows voice cloning, TTS, and audio processing are production-ready via MCP.

7. **Multi-Modal Creative Pipelines**: Servers like ai-forge-mcp (250 tools across 10 servers: Blender + Substance Painter/Designer/Sampler + UE5) demonstrate full concept-to-delivery pipelines becoming possible through MCP.

8. **AI Music Generation**: Suno and Udio dominate consumer-facing music generation. Suno has active MCP servers. Udio disabled downloads in October 2025 and has not restored them.

### AI in Media Production — Segment Growth

- **Live Sports Broadcasting**: AI providing real-time analytics, automated production, and interactive viewer experiences
- **Content Personalization**: AI-powered streaming platforms reshaping content delivery
- **Automated Post-Production**: Script breakdown, storyboarding, shot lists, scheduling, and budget management via AI
- **Generative Media**: Text-to-video, text-to-image, and text-to-audio creating new content creation paradigms

---

## Major Gaps — Platforms Without MCP Servers

### Video Production (No MCP Server Found)
- **Avid Media Composer** — Industry-standard broadcast/film NLE
- **Blackmagic Fusion** (standalone) — VFX compositor
- **HitFilm** — Consumer/prosumer VFX editor
- **Lightworks** — Professional NLE
- **Kdenlive / Shotcut** — Open-source NLEs
- **CapCut** (official) — Only community server exists (2 stars)
- **Runway ML** — Leading AI video tool, no MCP server despite API availability
- **Pika Labs** — No MCP server
- **Kling AI** — No MCP server

### Audio Production (No MCP Server Found)
- **Pro Tools** — Industry-standard DAW (broadcast/film/music)
- **Logic Pro** — Apple's professional DAW
- **FL Studio** — Popular music production DAW
- **Cubase / Nuendo** — Steinberg's professional DAWs
- **Audacity** — Open-source audio editor
- **iZotope** — Audio mastering/repair tools
- **Adobe Audition** — Adobe's audio editor
- **Waves** — Audio plugins

### Broadcasting (No MCP Server Found)
- **Wirecast** — Live streaming production
- **vMix** — Live production software
- **Tricaster** — Broadcast production system
- **Vizrt** — Broadcast graphics
- **Ross Video** — Broadcast infrastructure
- **Grass Valley** — Professional broadcast equipment
- **Playout automation systems** (Imagine Communications, Harmonic, etc.)
- **MAM/PAM systems** (Dalet, Avid Interplay, etc.)

### Podcast Platforms (No MCP Server Found)
- **Descript** — Leading AI podcast/video editor (has API, no MCP)
- **Riverside.fm** — Remote recording platform
- **Buzzsprout** — Podcast hosting
- **Spotify for Creators (Anchor)** — Free podcast hosting
- **Podbean** — Podcast hosting
- **Transistor** — Podcast hosting
- **Libsyn** — Podcast hosting
- **Captivate** — Podcast hosting
- **Simplecast** — Podcast hosting
- **Castmagic** — AI podcast tool (has API, no MCP)

### Music Streaming (No MCP Server Found)
- **SoundCloud** — Major music platform
- **Bandcamp** — Independent music marketplace
- **Deezer** — Music streaming
- **Amazon Music** — Music streaming
- **Pandora** — Music streaming
- **YouTube Music** (standalone) — Music streaming

### Video Hosting/Distribution (No MCP Server Found)
- **Vimeo** — Professional video hosting
- **Wistia** — Business video hosting
- **Brightcove** — Enterprise video platform
- **JW Player** — Video hosting/player
- **Bunny Stream** — Budget video CDN
- **AWS MediaConvert** — Cloud transcoding
- **Azure Media Services** — Cloud media platform
- **AWS Elemental** — Broadcast-grade encoding

### Design/Graphics (No MCP Server Found)
- **Adobe Illustrator** (standalone MCP)
- **Adobe InDesign**
- **Sketch** — macOS design tool
- **Affinity Designer/Photo** (standalone, though included in adb-mcp)
- **GIMP** (standalone, though included in OmniMCP)
- **Inkscape** (standalone, though included in OmniMCP)
- **CorelDRAW**
- **Procreate** — iPad drawing

---

## Regulatory Considerations

### United States

- **TAKE IT DOWN Act** (signed May 2025): Criminalizes publishing non-consensual intimate imagery including AI deepfakes; penalties up to 3 years prison; platforms must remove within 48 hours of notice.
- **DEFIANCE Act** (passed Senate unanimously January 2026): Federal civil remedy for non-consensual sexually explicit deepfakes; statutory damages up to $150,000 ($250,000 when linked to assault/stalking/harassment).
- **State-level**: As of February 2026, **46 states** have enacted legislation targeting AI-generated media. Bills increasingly target not just creators but AI platforms, payment processors, and hosting services.
- **Copyright**: Ongoing uncertainty around copyright status of AI-generated content. The US Copyright Office maintains that purely AI-generated works cannot be copyrighted, but human-guided AI-assisted works may be.
- **FCC considerations**: Broadcast regulations for AI-generated content in news/political contexts remain under discussion.

### European Union

- **EU AI Act**: Transparency obligations under Article 50 become enforceable **August 2, 2026** — requiring disclosure of AI interactions, labeling of synthetic content, and deepfake identification.
- **AI Code of Practice**: Voluntary framework providing guidance on labeling, watermarking, metadata, and technical measures for identifying AI-generated content ahead of legal enforcement.
- **Content Provenance**: C2PA (Coalition for Content Provenance and Authenticity) standards increasingly adopted by major platforms for cryptographic content authentication.

### Key Regulatory Themes for Media Production

1. **Mandatory labeling**: AI-generated content must be labeled/watermarked in many jurisdictions
2. **Deepfake liability**: Expanding from individual creators to platforms and tools
3. **Voice/likeness protection**: Growing legislation protecting individuals' voices and likenesses from unauthorized AI use
4. **Music copyright**: Major label lawsuits against Suno and Udio ongoing; training data copyright unresolved
5. **Broadcast-specific**: Real-time AI content in news broadcasting faces particular scrutiny
6. **Content moderation**: AI-generated CSAM criminalized broadly; platforms must implement detection
7. **Election integrity**: AI-generated political content faces strict disclosure requirements in multiple US states and the EU

---

## Server Count Summary by Category

| Category | Servers Found | Top Stars | Official Servers |
|----------|--------------|-----------|-----------------|
| Video Production/Editing | ~40 | 732 (DaVinci Resolve) | 0 |
| Audio Production/Music | ~15 | 2,358 (Ableton) | 1 (ElevenLabs) |
| Broadcasting/Streaming | ~15 | 507 (YouTube) | 1 (Dacast) |
| Media Asset Management | ~5 | 8 (Cloudinary) | 2 (Cloudinary, Transloadit) |
| Graphics/VFX/3D | ~30 | 14,024 (Figma) | 2 (Figma, Canva) |
| Podcast/Content Creation | ~5 | 20 | 0 |
| Music/Audio Streaming | ~25 | 269 (Spotify) | 1 (Epidemic Sound) |
| Image Generation/Editing | ~35 | 97 (GPT Image) | 0 |
| Content Distribution | ~5 | N/A | 3 (Mux, Cloudflare, Cloudinary) |
| Transcription/Captioning | ~12 | 50 (Whisper) | 0 |
| AI Video Generation | ~8 | 8 | 0 |
| **Total** | **~165+** | — | **~8** |

---

## Sources

### GitHub Repositories (Primary)
- https://github.com/video-creator/ffmpeg-mcp
- https://github.com/egoist/ffmpeg-mcp
- https://github.com/misbahsy/video-audio-mcp
- https://github.com/samuelgursky/davinci-resolve-mcp
- https://github.com/Dakkshin/after-effects-mcp
- https://github.com/elevenlabs/elevenlabs-mcp
- https://github.com/cloudinary/mcp-servers
- https://github.com/royshil/obs-mcp
- https://github.com/ahujasid/ableton-mcp
- https://github.com/uisato/ableton-mcp-extended
- https://github.com/GLips/Figma-Context-MCP
- https://github.com/anaisbetts/mcp-youtube
- https://github.com/ZubeidHendricks/youtube-mcp-server
- https://github.com/marcelmarais/spotify-mcp-server
- https://github.com/kennethreitz/mcp-applemusic
- https://github.com/yuhuacheng/tidal-mcp
- https://github.com/arcaputo3/mcp-server-whisper
- https://github.com/SureScaleAI/openai-gpt-image-mcp
- https://github.com/hetpatel-11/Adobe_Premiere_Pro_MCP
- https://github.com/DareDev256/fcpxml-mcp-server
- https://github.com/CoplayDev/unity-mcp
- https://github.com/chongdashu/unreal-mcp
- https://github.com/flopperam/unreal-engine-mcp
- https://github.com/mikechambers/adb-mcp
- https://github.com/poly-mcp/Blender-MCP-Server
- https://github.com/HurtzDonutStudios/ai-forge-mcp
- https://github.com/figma/mcp-server-guide
- https://github.com/leancoderkavy/premiere-pro-mcp
- https://github.com/SmartLittleApps/local-stt-mcp
- https://github.com/BigUncle/Fast-Whisper-MCP-Server

### Official Vendor Pages
- https://elevenlabs.io/blog/introducing-elevenlabs-mcp
- https://cloudinary.com/blog/cloudinary-mcp-server
- https://www.canva.dev/docs/connect/mcp-server/
- https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server
- https://www.epidemicsound.com/blog/mcp-server/
- https://www.dacast.com/blog/dacast-mcp-live-stream-server/
- https://developers.cloudflare.com/agents/model-context-protocol/mcp-servers-for-cloudflare/

### Market Research
- https://www.grandviewresearch.com/industry-analysis/artificial-intelligence-ai-media-entertainment-market-report
- https://www.fortunebusinessinsights.com/ai-video-generator-market-110060
- https://www.meticulousresearch.com/product/ai-video-generation-and-editing-software-market-forecast-6359
- https://www.precedenceresearch.com/generative-ai-in-the-media-and-entertainment-market
- https://www.researchandmarkets.com/reports/6226110/ai-content-generation-market-report

### Regulatory Sources
- https://www.multistate.us/insider/2026/2/12/how-ai-generated-content-laws-are-changing-across-the-country
- https://www.techpolicy.press/what-the-eus-new-ai-code-of-practice-means-for-labeling-deepfakes/
- https://www.kslaw.com/news-and-insights/new-state-ai-laws-are-effective-on-january-1-2026-but-a-new-executive-order-signals-disruption
- https://ondato.com/blog/deepfake-laws/
- https://www.pearlcohen.com/new-guidance-under-the-eu-ai-act-ahead-of-its-next-enforcement-date/

### Directories & Aggregators
- https://smithery.ai
- https://mcp.so
- https://www.pulsemcp.com
- https://mcpservers.org
- https://lobehub.com/mcp
- https://glama.ai/mcp/servers
- https://mcpmarket.com
- https://fast.io/resources/best-mcp-servers-video-processing/
