---
tags: [build, merge, pre-build, locked, 36-tasks]
date-created: 2026-06-08
---

# Merge Build Plan

> **Pre-merge (you) -> Merge session (4-8hrs) -> 16-day build (system).**
> Budget: $300-350 | Daily cap: $20 | Fable 5 reserve: $50-100

---

## Phase 1: Pre-Merge Preparation (YOU DO NOW)

### API Keys (All Verified)
- [ ] OpenRouter API key -> test GPT-5.5, Kimi K2.6, V4-Pro, MiniMax M3
- [ ] Vertex AI project ID -> test Claude Opus 4.8, Fable 5
- [ ] NVIDIA NIM free dev key -> test Nemotron 3 Ultra 550B
- [ ] Z.ai API key -> test GLM-5.1
- [ ] Alibaba Cloud Model Studio -> test Qwen3.7
- [ ] D-Wave Leap free trial -> apply at dwavesys.com/quantum-launchpad
- [ ] GitHub Personal Access Token
- [ ] Tavily, Exa, Firecrawl, Brave Search, E2B API keys

### 36. Install GBrain (NEW -- Pre-Merge Task)
GBrain is Garry Tan's (YC CEO) open-source agent memory system.

**Install (2 minutes):**
```bash
# Install Bun runtime
curl -fsSL https://bun.sh/install | bash

# Install GBrain
bun install -g github:garrytan/gbrain

# Initialize with embedded PGLite (no Docker needed)
gbrain init --pglite

# Import FionaVault
gbrain import C:\Users\USER\OneDrive\Documents\FionaVault

# Verify
gbrain doctor
```

**Configure MCP for all agents:**
```bash
# Claude Code
claude mcp add gbrain -- gbrain serve

# Codex / Cursor / Windsurf -- add to mcpServers config
# {
#   "mcpServers": {
#     "gbrain": {
#       "command": "gbrain",
#       "args": ["serve"]
#     }
#   }
# }
```

**Overnight cron (starts Day 1):**
```bash
# Runs at 3 AM daily
gbrain sync --break-lock --all
```

**Build-time value:** 2-3 days saved (research synthesis, pattern reuse, contradiction detection)
**Runtime value:** Client memory, taste learning, cross-project intelligence, agent shared memory
**Cost:** FREE (open source)
**Risk:** LOW (additive, doesn't break existing stack)

---

## Phase 2: Merge Session (4-8 hours)

### Hour 0-1: Environment Setup
- [ ] Upload all files to workspace
- [ ] Verify all API keys (including Fable 5)
- [ ] Install MCP servers (Context7, E2B, GitHub, GBrain)

### Hour 1-2: Config Generation
- [ ] Generate configs from vault content
- [ ] Grind.ts hook (MAX_ITERATIONS=10 DCC / 5 standard)

### Hour 2-3: AEGIS-99 Configuration
- [ ] Configure model weights with Nemotron 3 Ultra 550B
- [ ] Set thresholds (0.85 standard, 0.90 critical, 0.95 Module 68)
- [ ] Configure F-GARP with Step 4b (Fable 5)

### Hour 3-4: Fable 5 Integration
- [ ] Test Fable 5 API connection
- [ ] Verify activation protocol (Ashandy approval)
- [ ] Test F-GARP Step 4b with sample deadlock

### Hour 4-5: Overseer Configuration
- [ ] Install Pi Agent + Goose
- [ ] Configure shared JSONL log

### Hour 5-6: GBrain Setup
- [ ] Import vault to GBrain
- [ ] Configure overnight cron
- [ ] Test MCP connection

### Hour 6-7: Research Stack
- [ ] Context7 MCP (all 7 DCC tools)
- [ ] GBrain capture test

### Hour 7-8: Final Integration Test
- [ ] Research -> Gen -> AEGIS -> Supervisors -> Cursor Gate
- [ ] COMMIT: "Fiona v1.7 Merge Complete -- Ready for Build"
