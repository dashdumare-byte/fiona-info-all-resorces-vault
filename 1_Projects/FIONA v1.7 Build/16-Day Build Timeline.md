---
tags: [build, timeline, 16-day, locked, project-active]
date-created: 2026-06-06
source: FIONA_v1.7_MERGE_BUILD_PLAN(1).txt + FIONA_v1.7_CRITICAL_MODULES_LOCKED(1).txt
---

# 16-Day Build Timeline

> **Day-by-day execution plan. 69 modules. Lightning.ai. $15/day cap.**

---

## Pre-Merge (BEFORE Day 1)

### API Keys (All Verified)
- [ ] Z.ai API key -> test **GLM-5.2** (GLM-5.1 fallback)
- [ ] NVIDIA NIM free dev key -> test Nemotron
- [ ] Alibaba Cloud Model Studio -> test Qwen3.7
- [ ] OpenRouter API key -> test GPT-5.5, Kimi K2.6, V4-Pro, MiniMax M3
- [ ] Vertex AI project ID -> test Claude Opus 4.8
- [ ] AWS Bedrock credentials -> test Claude fallback
- [ ] Moonshot API key -> test Kimi Agent mode
- [ ] D-Wave Leap free trial -> apply at dwavesys.com/quantum-launchpad
- [ ] GitHub Personal Access Token
- [ ] Tavily, Exa, Firecrawl, Brave Search, E2B API keys

### Tools Installed
- [ ] Claude Code CLI (>=2.1.95)
- [ ] Codex CLI + plugin
- [ ] OpenCode CLI
- [ ] Cursor Pro (SSH configured)
- [ ] Pi Agent, Goose
- [ ] Ollama + Gemma 4 26B

### Files Ready
- [ ] This vault synced to GitHub
- [ ] 8 BATCH spec files (BATCH_01.md through BATCH_09.md)
- [ ] Google Drive module files + error catalog (AWAITING from Ashandy)
- [ ] Module research rubric + code generation rubric

---

## Day 1-3: Core Infrastructure

### Modules Built (5 critical modules simultaneously)
| Module | Name | Pool | AEGIS | Checkpoint |
|--------|------|------|-------|------------|
| M1 | UTM (Universal Task Manager) | 9-model critical | >=0.90 | DAG management works |
| M11 | Orchestrator (Master Coordinator) | 9-model critical | >=0.90 | Load balancing, failover |
| M-X | AEGIS-99 Engine | 9-model critical | >=0.95 | Self-validation passes |
| M-Y | Security (Content Filtering + Injection Protection) | 9-model critical | >=0.95 | OWASP LLM Top 10 covered |
| M-Z | Memory Manager (mem0 + EverMemOS) | 9-model critical | >=0.90 | Persistence across sessions |

### Daily Pattern
- Universal research (all 8 models, 30-60min)
- Cross-verification (15-30min)
- FacTool verification (10-15min)
- Parallel generation (all models)
- AEGIS consensus
- 3-supervisor review
- Cursor hard gate

### CHECKPOINT: All 5 infra modules pass AEGIS >=0.90

---

## Day 4-5: DCC Adapters Batch A

| Module | DCC Tool | Version | Pool | AEGIS |
|--------|----------|---------|------|-------|
| M26 | ComfyUI | latest main branch SHA | 9-model critical | >=0.90 |
| M27 | Blender | 5.2.0 LTS (bpy API, headless --background) | 9-model critical | >=0.90 |
| M28 | DaVinci Resolve | 21.0 (davinci-rest REST shim) | 9-model critical | >=0.90 |
| M29 | Nuke | 17.0 (Python API changes from 16.x) | 9-model critical | >=0.90 |

- Rate: 2 adapters/day
- Kimi Agent research 30min before each
- super-smoke-test after each adapter

### CHECKPOINT: All 4 adapters launch headless, pass super-smoke-test

---

## Day 6-7: DCC Adapters Batch B

| Module | DCC Tool | Version | Pool | AEGIS |
|--------|----------|---------|------|-------|
| M30 | Cinema 4D | 2026.3.2 (Python API, MoGraph) | 9-model critical | >=0.90 |
| M31 | Houdini | 21.0 (hou module in hython, VEX/Python) | 9-model critical | >=0.90 |
| M32 | Unreal Engine | 5.8 (Remote Control API, EditorActorSubsystem) | 9-model critical | >=0.90 |

- Rate: 1-2 adapters/day
- Full 9-model critical pool per adapter

### CHECKPOINT: All 3 adapters launch headless, pass super-smoke-test

---

## Day 8: Integration

- Cross-adapter compatibility testing
- Pipeline end-to-end: intake -> process -> output
- UE5 + C4D integration specifically

### CHECKPOINT: DCC pipeline works end-to-end

---

## Day 9: Module 68 — B4D Grillz (DEDICATED FULL DAY)

| Attribute | Value |
|-----------|-------|
| **Module** | Blender 4 Dental (B4D Grillz Controller) |
| **Function** | Custom dental jewelry design |
| **Tolerance** | +-0.05mm |
| **Materials** | Biocompatible (NextDent C&B MFH resin) |
| **Pool** | 9-model critical |
| **AEGIS** | >=0.95 (highest) |

### Special Protocols
- [ ] Axplorer MANDATORY (pre-code math pattern discovery)
- [ ] ultrathink: ALWAYS (not conditional)
- [ ] E2B sandbox: ACTUAL STL generation test with synthetic dental model
- [ ] Leanstral: ALL tolerance math gets formal verification

### Research Focus
- Dental geometry standards
- STL precision requirements
- Biocompatible materials database
- 3D printing formats
- Dental workflow specifics

### CHECKPOINT: STL precision +-0.05mm verified, biocompatible materials confirmed

---

## Day 10: Module 69 — Web App (DEDICATED FULL DAY)

| Attribute | Value |
|-----------|-------|
| **Module** | Web Chat Interface |
| **Function** | Primary user touchpoint |
| **Stack** | React/Vue frontend, Python/FastAPI backend |
| **Database** | Supabase (real-time sync) |
| **Auth** | Supabase Auth (RLS) |
| **Pool** | 9-model critical |
| **AEGIS** | >=0.90 |

### Team
- Qwen3.7 leads frontend
- Full 9-model pool for backend/security
- Codex: Web security adversarial review

### CHECKPOINT: Web app deploys, real-time sync works, auth functional

---

## Day 11-14: Standard Modules (50 modules)

| Attribute | Value |
|-----------|-------|
| **Count** | 50 modules |
| **Rate** | ~4 modules/day |
| **Pool** | 8-model standard (Opus 4.6, not 4.8) |
| **AEGIS** | >=0.85 |
| **Research** | 4-model pool (reduced cost) |

### CHECKPOINT: All modules pass, no critical failures

---

## Day 15-16: Integration + Deployment

- Full system end-to-end test
- Critical path verification
- Runtime environment setup
- Voice integration test (nemotron-asr-stream + nemotron-voicechat)
- Final AEGIS-99 system validation

### CHECKPOINT: Fiona responds to simple/standard/coding/critical tasks

### Final Commit
"Fiona v1.7 Build Complete — 69 Modules Production-Ready"

---

## Budget Tracking

| Phase | Days | Est. Daily | Est. Total |
|-------|------|------------|------------|
| Infrastructure | 3 | $10-12 | $30-36 |
| DCC Batch A | 2 | $12-15 | $24-30 |
| DCC Batch B | 2 | $12-15 | $24-30 |
| Integration | 1 | $8-10 | $8-10 |
| B4D Grillz | 1 | $15 (full cap) | $15 |
| Web App | 1 | $12-15 | $12-15 |
| Standard Modules | 4 | $6-8 | $24-32 |
| Integration+Deploy | 2 | $8-10 | $16-20 |
| **TOTAL** | **16** | | **$153-163** |

**Within $250-300 budget. $15/day cap enforced.**

---

## Merge Session (4-8 hours, Pre-Day 1)

| Hour | Activity |
|------|----------|
| 0-1 | Environment setup: API key verification, MCP install, tool install |
| 1-2 | Config generation: CLAUDE.md, AGENTS.md, opencode.json, .cursor/env |
| 2-3 | Supervisor master file compilation |
| 3-4 | AEGIS-99 configuration + test |
| 4-5 | Overseer configuration (Pi + Goose) |
| 5-6 | Research stack configuration |
| 6-7 | Formal verification setup |
| 7-8 | Final integration test + commit |

---

*See also: [[Critical Modules]], [[DCC Adapter Ecosystem]], [[Merge Build Plan]], [[Model Roster]]*
