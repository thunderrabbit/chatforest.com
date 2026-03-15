# Sports & Fitness MCP Servers — Research Notes

Research date: 2026-03-15

## Summary

Found **50+ MCP servers** across 10 subcategories covering sports data, fitness tracking, wearables, nutrition, workout planning, sports betting, and more. The fitness/wearable tracking space is the most populated, with Strava alone having 10+ implementations.

---

## 1. FITNESS TRACKING — Strava

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [r-huijts/strava-mcp](https://github.com/r-huijts/strava-mcp) | ~50 | TypeScript | MIT | 24 | Full Strava API v3 — activities, segments, routes, leaderboards, athlete data | Active |
| [tomekkorbak/strava-mcp-server](https://github.com/tomekkorbak/strava-mcp-server) | ~18 | Python | — | ~5 | Query athlete activities from Strava API | Active |
| [eddmann/strava-mcp](https://github.com/eddmann/strava-mcp) | — | Python | — | ~10 | Activities, athlete stats, segments, routes, training analysis | Active |
| [kw510/strava-mcp](https://github.com/kw510/strava-mcp) | — | TypeScript | — | — | Remote MCP on Cloudflare Workers with Strava OAuth built-in | Active |
| [MariyaFilippova/mcp-strava](https://github.com/MariyaFilippova/mcp-strava) | — | — | — | — | Strava + Claude Desktop integration | Active |
| [gcoombe/strava-mcp](https://github.com/gcoombe/strava-mcp) | — | — | — | — | All major Strava API endpoints — activities, routes, segments, clubs, gear | Active |
| [ctvidic/strava-mcp-server](https://github.com/ctvidic/strava-mcp-server) | ~2 | Python | — | — | Strava API integration | Active |
| [bronteee/strava-mcp](https://github.com/bronteee/strava-mcp) | — | — | — | — | Strava data for Claude Desktop | Active |
| [rbctmz/mcp-server-strava](https://github.com/rbctmz/mcp-server-strava) | — | — | — | — | Strava API + MCP SDK integration | Active |
| [BojanMakivic/strava-activity-mcp-server](https://github.com/BojanMakivic/strava-activity-mcp-server) | — | — | — | — | Authorization, token management, fetch activities | Active |
| [yorrickjansen/strava-mcp](https://github.com/yorrickjansen/strava-mcp) | — | — | — | — | Strava interaction | Active |
| [justmytwospence/strava-mcp](https://github.com/justmytwospence/strava-mcp) | — | — | — | — | Strava API v3 — activities, profiles, segments, routes | Active |
| [mcp.pipedream.com/app/strava](https://mcp.pipedream.com/app/strava) | N/A | — | — | — | Hosted Strava MCP (Pipedream) | Active |

**Top pick: r-huijts/strava-mcp** — most stars, most tools (24), TypeScript, MIT license.

---

## 2. FITNESS TRACKING — Garmin

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [Taxuspt/garmin_mcp](https://github.com/Taxuspt/garmin_mcp) | ~190-260 | Python | — | ~10+ | Activities, health metrics, body composition, 130+ tests | Active, well-tested |
| [dshvadskiy/garmin_mcp](https://github.com/dshvadskiy/garmin_mcp) | ~8 | Python | — | ~5 | Sleep, steps, activities, heart rate via python-garminconnect | Active |
| [eddmann/garmin-connect-mcp](https://github.com/eddmann/garmin-connect-mcp) | — | Python | — | — | Activities, health metrics, sleep data, training analysis | Active |
| [st3v/garmin-workouts-mcp](https://github.com/st3v/garmin-workouts-mcp) | — | — | — | 5 | Create/list/schedule/delete workouts on Garmin Connect | Active |
| [charlesfrisbee/garmin-workouts-mcp](https://github.com/charlesfrisbee/garmin-workouts-mcp) | — | — | — | — | Natural language to Garmin workout creation | Active |
| [wklm/garmin-workouts-mcp](https://github.com/wklm/garmin-workouts-mcp) | — | — | — | — | Upload training plans in natural language to Garmin watch | Active |

**Top pick: Taxuspt/garmin_mcp** — highest stars in the entire sports/fitness category, well-tested.

---

## 3. FITNESS TRACKING — Other Wearables (WHOOP, Oura, Fitbit, Apple Health, COROS, Withings)

### WHOOP
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [JedPattersonn/whoop-mcp](https://github.com/JedPattersonn/whoop-mcp) | — | TypeScript | — | — | Biometric data for Claude/LLMs | Active |
| [ctvidic/whoop-mcp-server](https://github.com/ctvidic/whoop-mcp-server) | ~15 | Python | — | — | User profiles, cycles, recovery, sleep, workouts | Active |
| [nissand/whoop-mcp-server-claude](https://github.com/nissand/whoop-mcp-server-claude) | — | — | — | 18+ | Full OAuth + 18 API endpoints for WHOOP | Active |
| [JasonBates/whoop-mcp-server](https://github.com/JasonBates/whoop-mcp-server) | — | — | — | — | Recovery, sleep, strain for Claude Desktop | Active |
| [elizabethtrykin/whoop-mcp](https://github.com/elizabethtrykin/whoop-mcp) | — | — | — | — | WHOOP data | Active |
| [k0va1/whoop-mcp](https://github.com/k0va1/whoop-mcp) | — | — | — | — | WHOOP data | Active |
| [xokvictor/whoop-mcp](https://github.com/xokvictor/whoop-mcp) | — | Go | — | — | WHOOP data (Go implementation) | Active |
| [RomanEvstigneev/whoop-mcp-server](https://github.com/RomanEvstigneev/whoop-mcp-server) | — | — | — | — | WHOOP data | Active |

### Oura Ring
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [tomekkorbak/oura-mcp-server](https://github.com/tomekkorbak/oura-mcp-server) | ~36 | Python | — | — | Sleep, readiness, resilience, heart rate, workouts | Active |

### Fitbit
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [TheDigitalNinja/mcp-fitbit](https://github.com/TheDigitalNinja/mcp-fitbit) | ~25 | TypeScript | — | — | Weight, sleep, profile via OAuth 2.0 | Active |

### Apple Health
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [neiltron/apple-health-mcp](https://github.com/neiltron/apple-health-mcp) | ~522 | TypeScript | — | — | SQL queries on Apple Health data via DuckDB, weekly/monthly reports | Active, **highest stars overall** |
| [the-momentum/apple-health-mcp-server](https://github.com/the-momentum/apple-health-mcp-server) | ~99 | Python | — | 5+ | Structure analysis, record search, data summaries, Docker-ready | Active |
| [salgado/apple-watch-health-mcp](https://github.com/salgado/apple-watch-health-mcp) | — | Python | — | — | Elasticsearch + Apple HealthKit step data | Active |
| [HealthyApps/health-auto-export-mcp-server](https://github.com/HealthyApps/health-auto-export-mcp-server) | — | — | — | — | Apple Health via Health Auto Export iOS app | Active |

### COROS
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [Dhivakarkd/corus-mcp](https://github.com/Dhivakarkd/corus-mcp) | — | — | — | 8 | Activity data, EvoLab metrics, training calendar, zones, GPS data | Active |
| [rowlando/coros-workout-mcp](https://github.com/rowlando/coros-workout-mcp) | — | — | — | — | Create COROS strength workouts, push to watch | Active |

### Withings
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [akutishevsky/withings-mcp](https://github.com/akutishevsky/withings-mcp) | — | — | — | 7 | Sleep, body measurements, workouts, heart data, goals | Active |
| [schimmmi/withings-mcp-server](https://github.com/schimmmi/withings-mcp-server) | — | — | — | — | Body measurements, activities, sleep | Active |

---

## 4. MULTI-PLATFORM FITNESS AGGREGATORS

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [Async-IO/pierre_mcp_server](https://github.com/Async-IO/pierre_mcp_server) | ~10 | Rust | — | 47 | Strava/Garmin/Fitbit/WHOOP/COROS/Terra (150+ wearables), training load, race predictions, nutrition planning | Active |
| [gesteves/domestique](https://github.com/gesteves/domestique) | — | TypeScript | — | ~10 | Intervals.icu + WHOOP + TrainerRoad unified access, Docker support | Active |
| [ewongz/fitness-mcp-server](https://github.com/ewongz/fitness-mcp-server) | — | — | MIT | — | Strava + Intervals.icu, power curves, workout analysis | Active |
| [Marholoubek/health_mcp](https://github.com/Marholoubek/health_mcp) | — | — | — | — | Whoop + Strava aggregation, extensible adapter architecture | Active |
| [nori.ai/health-mcp](https://nori.ai/health-mcp) (HealthMCP) | — | — | — | — | Apple Health, lab results, Oura, Garmin, WHOOP | Active |
| [openwearables.io](https://www.openwearables.io/) (Open Wearables) | — | — | — | — | Unified API: Apple Health, Garmin, Whoop, Polar, Suunto, Samsung | Active |

---

## 5. TRAINING PLATFORMS (Intervals.icu, TrainingPeaks, TrainerRoad)

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [eddmann/intervals-icu-mcp](https://github.com/eddmann/intervals-icu-mcp) | — | Python | — | 48 | 9 categories: activities, analysis, athlete, wellness, events, performance, workouts, gear | Active, **most tools** |
| [mrgeorgegray/intervals-icu-mcp](https://github.com/mrgeorgegray/intervals-icu-mcp) | — | — | — | — | Training data, activities, events, wellness | Active |
| [mvilanova/intervals-mcp-server](https://github.com/mvilanova/intervals-mcp-server) | — | — | — | — | Intervals.icu API for Claude/ChatGPT | Active |
| [JamsusMaximus/trainingpeaks-mcp](https://github.com/JamsusMaximus/trainingpeaks-mcp) | ~13 | Python | — | — | CTL/ATL/TSB fitness data, power PRs, read-only, encrypted cookies | Active |

---

## 6. WORKOUT & EXERCISE PLANNING

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [Juxsta/wger-mcp](https://github.com/Juxsta/wger-mcp) | — | TypeScript | MIT | 12 | 400+ exercises, workout routines, JWT auth, 80%+ test coverage | Active |
| [Dinesh-Satram/fitness_coach_MCP](https://github.com/Dinesh-Satram/fitness_coach_MCP) | — | Python | — | — | Personalized coaching, workout/nutrition plans, progress tracking, web dashboard | Active |
| [evangstav/personal-mcp](https://github.com/evangstav/personal-mcp) | — | Python | — | — | Workout tracking, nutrition logging, journal, mood/energy tracking | Active |
| [chrisdoc/hevy-mcp](https://github.com/chrisdoc/hevy-mcp) | — | TypeScript | — | — | Hevy workouts, routines, folders, exercise templates (PRO required) | Active |
| [meimakes/hevy-mcp-server](https://github.com/meimakes/hevy-mcp-server) | — | TypeScript | — | — | Hevy API, stdio + SSE transport modes | Active |

### JEFit
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| ai-mcp-garage/jefit-mcp | — | — | — | — | JEFit workout data analysis, workout dates, exercise info | Active |

---

## 7. NUTRITION & DIET TRACKING

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [MCP-Forge/nutritionix-mcp-server](https://github.com/MCP-Forge/nutritionix-mcp-server) | — | Python | — | — | Food search, nutritional data, 500+ exercise calorie estimates | Active |
| [GuptaPurujit/nutritionix_mcp](https://github.com/GuptaPurujit/nutritionix_mcp) | — | — | — | — | Nutritionix API v2, meal logging, macronutrient breakdowns | Active |
| [ai-mcp-garage/mcp-myfitnesspal](https://github.com/ai-mcp-garage/mcp-myfitnesspal) | ~6 | Python | MIT | 4 | Daily macros, water intake, date-range summaries, meals | Active |
| [AdamWalt/myfitnesspal-mcp-python](https://github.com/AdamWalt/myfitnesspal-mcp-python) | — | Python | — | — | Food diary, exercises, body measurements, nutrition goals, water | Active |
| [jevy/myfitnesspal-mcp](https://github.com/jevy/myfitnesspal-mcp) | — | — | — | — | MyFitnessPal data | Active |

---

## 8. SPORTS DATA — Multi-Sport

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [balldontlie-api/mcp](https://github.com/balldontlie-api/mcp) | — | — | — | 250+ | **Official** — NBA, NFL, MLB, NHL, EPL, WNBA, NCAAF, NCAAB, MMA, FIFA WC 2026, La Liga, Serie A, UCL, Bundesliga, Ligue 1 | Active, **most endpoints** |
| [mikechao/balldontlie-mcp](https://github.com/mikechao/balldontlie-mcp) | — | — | — | — | NBA, NFL, MLB via Balldontlie API | Active |
| [michaelfromorg/mcp-sports](https://github.com/michaelfromorg/mcp-sports) | — | — | — | — | Real-time sports data, stats, fantasy, betting | Active |
| Apify 62-in-1 Sports Data MCP | N/A | — | — | 58 | 38 leagues, 20 modes, 6 MCPs, HTML reports | Hosted (Apify) |
| Apify ESPN MCP Server | N/A | — | — | 12 | Live scores, standings, stats, news, odds | Hosted (Apify) |

---

## 9. SPORTS DATA — Sport-Specific

### Baseball (MLB)
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [guillochon/mlb-api-mcp](https://github.com/guillochon/mlb-api-mcp) | ~36 | Python | — | — | Standings, schedules, player stats (sabermetrics), rosters, live boxscores | Active |
| [etweisberg/mlb-mcp](https://github.com/etweisberg/mlb-mcp) | ~9 | Python | — | — | Statcast, FanGraphs, Baseball Reference, MLB Stats API | Active |
| [robcerda/mlb-sportradar-mcp](https://github.com/robcerda/mlb-sportradar-mcp) | — | — | — | — | SportRadar MLB API | Active |
| [ian7525/mlb_mcp_server](https://github.com/ian7525/mlb_mcp_server) | — | — | — | — | MLB data | Active |

### Hockey (NHL)
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [dylangroos/nhl-mcp](https://github.com/dylangroos/nhl-mcp) | — | TypeScript | — | — | Live games, scores, stats, teams, player analysis, reports | Active |

### Soccer/Football
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [yeonupark/mcp-soccer-data](https://github.com/yeonupark/mcp-soccer-data) | — | Python | — | — | Real-time football match data via SoccerDataAPI | Active |
| [obinopaul/soccer-mcp-server](https://github.com/obinopaul/soccer-mcp-server) | ~4 | Python | — | — | API-Football — leagues, standings, fixtures, player stats | Active |

### Australian Football (AFL)
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [willvelida/mcp-afl-server](https://github.com/willvelida/mcp-afl-server) | ~3 | C# | MIT | — | Squiggle API — games, standings, teams, power rankings, tips | Active |

### Formula 1
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [Darakhsh1999/f1-mcp-server](https://github.com/Darakhsh1999/f1-mcp-server) | — | Python | — | — | FastF1 + OpenF1 API — calendars, results, lap times, telemetry | Active |
| [rakeshgangwar/f1-mcp-server](https://github.com/rakeshgangwar/f1-mcp-server) | — | TypeScript | — | — | Formula One racing data (FastF1) | Active |

### Cycling (Pro Racing)
| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [r-huijts/firstcycling-mcp](https://github.com/r-huijts/firstcycling-mcp) | ~14 | TypeScript | — | — | Pro cycling — rider bios, race results, start lists from FirstCycling | Active |

---

## 10. SPORTS BETTING & FANTASY SPORTS

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| [cloudbet/sports-mcp-server](https://github.com/cloudbet/sports-mcp-server) | ~10 | Go | — | 1 | Cloudbet API — upcoming events, live odds, market info | Active |
| [hrgarber/wagyu_mcp_hackathon](https://github.com/hrgarber/wagyu_mcp_hackathon) | ~2 | Python | — | — | The Odds API — sports, odds across bookmakers, test/real modes | Active |
| [kitchenchem/degen-mcp](https://github.com/kitchenchem/degen-mcp) | ~1 | Python | — | — | The Odds API — sports betting odds | Active |
| seang1121/sports-betting-mcp | — | — | — | — | Live odds, injury reports, picks for NBA/NHL/NCAAB, 59.6% win rate | Active |
| roizenlabs/sportintel-mcp | — | — | — | — | DFS player projections, lineup optimization, SHAP explainability | Hosted (Apify) |
| Apify Sportsbook Odds Scraper MCP | N/A | — | — | — | Sportsbook odds scraping | Hosted (Apify) |

---

## 11. RUNNING PERFORMANCE

| Repo | Stars | Language | License | Tools | Key Capabilities | Status |
|------|-------|----------|---------|-------|-------------------|--------|
| Running Performance Calculator (Glama) | — | — | — | — | VDOT, training paces, race predictions, HR zones (Jack Daniels, McMillan, Riegel) | Active |

---

## 12. YOGA & MEDITATION

No dedicated MCP servers found for yoga or meditation specifically. The closest are general wellness/fitness coach servers that may include mindfulness components.

---

## TOP SERVERS BY STARS

1. **neiltron/apple-health-mcp** — ~522 stars (Apple Health + SQL/DuckDB)
2. **Taxuspt/garmin_mcp** — ~190-260 stars (Garmin Connect)
3. **the-momentum/apple-health-mcp-server** — ~99 stars (Apple Health)
4. **r-huijts/strava-mcp** — ~50 stars (Strava, 24 tools)
5. **tomekkorbak/oura-mcp-server** — ~36 stars (Oura Ring)
6. **guillochon/mlb-api-mcp** — ~36 stars (MLB)
7. **TheDigitalNinja/mcp-fitbit** — ~25 stars (Fitbit)
8. **tomekkorbak/strava-mcp-server** — ~18 stars (Strava)
9. **ctvidic/whoop-mcp-server** — ~15 stars (WHOOP)
10. **r-huijts/firstcycling-mcp** — ~14 stars (Pro Cycling)

---

## KEY OBSERVATIONS

1. **Strava dominance**: 10+ implementations, most of any single platform. The ecosystem is fragmented with many small repos.
2. **Apple Health leads in stars**: neiltron/apple-health-mcp at 522 stars is the most popular sports/fitness MCP server by far.
3. **Garmin well-served**: Taxuspt/garmin_mcp is well-tested (130+ tests) and popular.
4. **WHOOP highly fragmented**: 8+ implementations, none clearly dominant.
5. **BALLDONTLIE is the sports data king**: Official MCP with 250+ endpoints across 18 leagues.
6. **Nutrition underserved**: Only Nutritionix and MyFitnessPal servers exist; no Cronometer, Lose It, etc.
7. **No yoga/meditation servers**: Gap in the market.
8. **No dedicated gym/equipment management**: No servers for gym booking, equipment tracking, etc.
9. **Fantasy sports sparse**: Only DFS-focused SportIntel; no servers for ESPN Fantasy, Yahoo Fantasy, etc.
10. **Pierre is the most ambitious**: 47 tools, Rust-based, multi-platform (Strava/Garmin/Fitbit/WHOOP/COROS/Terra).
11. **Multi-wearable trend**: Open Wearables and Pierre both aim to unify data across devices.
12. **Intervals.icu well-served**: eddmann's implementation has 48 tools across 9 categories.
