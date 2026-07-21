---
tags: [build, merge, pre-build, locked, 35-tasks]
date-created: 2026-06-06
source: FIONA_v1.7_MERGE_BUILD_PLAN(1).txt + FIONA_COMPLETE_LOCKIN_V3.md
---

# Merge Build Plan

> **Pre-merge (you) -> Merge session (4-8hrs) -> Post-merge pre-build (you) -> 30-day build (system).**

---

## Phase 1: Pre-Merge Preparation (YOU DO NOW)

### 1. API Keys (All Verified and Working)
- [ ] Z.ai API key -> test **GLM-5.2** string (GLM-5.1 as fallback)
- [ ] NVIDIA NIM free dev key -> test Nemotron string
- [ ] Alibaba Cloud Model Studio -> test Qwen3.7 string
- [ ] OpenRouter API key -> test ALL OpenRouter models (GPT-5.5, Kimi K2.6, V4-Pro, MiniMax M3)
- [ ] Vertex AI project ID -> test Claude Opus 4.8
- [ ] AWS Bedrock credentials -> test Claude fallback
- [ ] Moonshot API key -> test Kimi Agent mode
- [ ] GitHub Personal Access Token
- [ ] Tavily, Exa, Firecrawl, Brave Search, E2B API keys
- [ ] Semantic Scholar (free, no key needed)

### 2. Files Ready to Upload
- [ ] This vault (FionaVault) synced to GitHub
- [ ] 8 BATCH spec files (BATCH_01.md through BATCH_09.md)
- [ ] Google Drive module files + error catalog (from Ashandy)
- [ ] Module research rubric + code generation rubric

### 3. Tools Installed Locally
- [ ] Claude Code CLI (>=2.1.95)
- [ ] Codex CLI (with plugin)
- [ ] OpenCode CLI
- [ ] Cursor Pro (SSH configured)
- [ ] Git

---

## Phase 2: Merge Session (4-8 hours in Antigravity / Claude Code)

### Hour 0-1: Environment Setup
- [ ] Upload all files to workspace
- [ ] Verify all API keys (run test calls)
- [ ] Install MCP servers (Context7, E2B, GitHub, Consensus, etc.)
- [ ] Install research tools (FacTool, DeepResearcher, GitNexus, pyan3, tach)
- [ ] Install overseer tools (Pi Agent, Goose)
- [ ] Install ASI-Evolve dependencies (MongoDB, Docker)
- [ ] Install OpenMythos (770M model)
- [ ] Configure Langfuse for trace logging
- [ ] Test Ollama + Gemma 4: `ollama pull gemma4:26b`

### Hour 1-2: Config File Generation
- [ ] Generate CLAUDE.md from vault content
- [ ] Generate AGENTS.md from vault content
- [ ] Generate opencode.json from vault content
- [ ] Generate .cursor/environment.json
- [ ] Grind.ts hook (MAX_ITERATIONS=10 DCC / 5 standard)
- [ ] Custom commands: /review, /fix-issue, /update-deps, /security-review

### Hour 2-3: Supervisor Master File Compilation
- [ ] Compile ALL architecture decisions into single MASTER file
- [ ] Each supervisor gets relevant SLICE
- [ ] Test: All 3 supervisors can read vault

### Hour 3-4: AEGIS-99 Configuration
- [ ] Configure model weights (v4.1)
- [ ] Set thresholds (0.85 standard, 0.90 critical)
- [ ] Configure research consensus weights
- [ ] Test with sample module

### Hour 4-5: Overseer Configuration
- [ ] Install Pi Agent in Lightning.ai terminal
- [ ] Configure Pi objectives (8 shared)
- [ ] Install Goose in Lightning.ai
- [ ] Configure Goose recipes
- [ ] Set up shared JSONL log
- [ ] Configure escalation rules (5th failure -> Ashandy)

### Hour 5-6: Research Stack Configuration
- [ ] Context7 MCP (all 7 DCC tools covered)
- [ ] Firecrawl MCP (test with Houdini docs)
- [ ] Tavily, Exa, Brave Search APIs
- [ ] Semantic Scholar
- [ ] E2B MCP, GitHub MCP, Consensus MCP
- [ ] FacTool, DeepResearcher, GitNexus
- [ ] pyan3 + networkx, tach

### Hour 6-7: Formal Verification Setup
- [ ] Lean 4 kernel
- [ ] axiom-lean-engine, axle-mcp-server
- [ ] Leanstral configuration
- [ ] DeepSeek-Prover-V2 (HuggingFace)
- [ ] LeanDojo, Axplorer
- [ ] Test: Generate simple proof

### Hour 7-8: Final Integration Test
- [ ] Run /security-review PRE-merge
- [ ] End-to-end test with simple module
- [ ] Verify: Research -> Gen -> AEGIS -> Supervisors -> Cursor Gate
- [ ] Verify: Pi + Goose log all steps
- [ ] Verify: Langfuse captures full trace
- [ ] COMMIT: "Fiona v1.7 Merge Complete -- Ready for Build"

---

## Phase 3: Post-Merge Pre-Build (Lightning.ai)

### 1. Upload Merge Output
- [ ] All config files
- [ ] Supervisor master file
- [ ] AEGIS-99 configuration
- [ ] Research tool configurations
- [ ] Overseer configurations
- [ ] All spec files
- [ ] This vault (Git clone or sync)

### 2. Verify Lightning.ai Environment
- [ ] Python 3.11+ installed
- [ ] Node.js 18+ installed (for MCP servers)
- [ ] Git configured
- [ ] Ollama running with gemma4:26b
- [ ] All API keys in environment variables
- [ ] MongoDB running (for ASI-Evolve)
- [ ] Docker available
- [ ] Sufficient storage

### 3. Test Connectivity
- [ ] SSH from your machine to Lightning.ai
- [ ] Cursor Pro SSH connection
- [ ] All API calls from Lightning.ai
- [ ] MCP server connections
- [ ] Overseer communication (Pi + Goose)

### 4. Pre-Seed lessons.md
- [ ] Add all 8 known DCC issues
- [ ] Add merge session lessons
- [ ] Verify: All supervisors read lessons.md on session start

### 5. Set Up Cron Jobs
- [ ] Nemotron daily 8am research cron
- [ ] GitNexus re-index every 15 minutes
- [ ] Tier 2 review every 20 hours
- [ ] Pi + Goose health check every 5 minutes
- [ ] ASI-Evolve weekly optimization (starts Week 2)

### 6. Final Ashandy Review
- [ ] Review all config files
- [ ] Verify DCC version gates
- [ ] Confirm budget ($250-300)
- [ ] Set daily check-ins (suggested: 8am, 12pm, 6pm, 10pm)
- [ ] Configure alerts (Slack/Discord/email)
- [ ] APPROVE: "Ready to start Day 1"

---

## What Goes Into Lightning.ai

### Software (Installed)
| Tool | Purpose |
|------|---------|
| Claude Code CLI | Supervisor 1 |
| Codex CLI + plugin | Supervisor 2 |
| OpenCode CLI | Supervisor 3 |
| Pi Agent | Overseer 1 |
| Goose | Overseer 2 |
| Ollama | Local model runner (Gemma 4) |
| MCP servers (10+) | Research tools |
| Python 3.11+, Node.js 18+ | Runtime |
| MongoDB, Docker | ASI-Evolve |
| Lean 4 | Formal verification |
| pyan3, networkx, tach | Static analysis |
| GitNexus, FacTool, DeepResearcher | Research intelligence |
| Langfuse, OpenLLMetry, OpenObserve | Tracing |
| Logfire, super-smoke-test | Verification |
| OpenMythos (770M) | Creative narrative |
| ASI-Evolve | Self-optimization |
| Snyk, Semgrep, Trivy, garak, Giskard | Security (build) |
| Sentry, NeMo Guardrails, HallucinationAutoFixer | Security (runtime) |

### Models (API Calls, NOT Local)
All models via API — see [[Model Roster]] for full list.

### Files (Stored)
- This vault (Git-synced)
- Config files (CLAUDE.md, AGENTS.md, opencode.json, .cursor/env)
- BATCH_01.md through BATCH_09.md
- MEMORY.md (build state tracking)
- tasks/lessons.md
- memory/YYYY-MM-DD.md (daily research briefs)
- .gitnexus/ (codebase knowledge graph)
- .code-review-graph/ (structural map SQLite)
- logs/ (Langfuse / OpenObserve)
- pi-agent.log, goose.log (JSONL audit)

---

*See also: [[30-Day Build Timeline]], [[Critical Modules]], [[Model Roster]]*
