# REMAINING ITEMS — Complete Master List

> Generated: 2026-07-28
> Source: Deep scan of all upload files vs vault contents

---

## TIER 1 — CRITICAL (Must Address)

### 1. 8 Pre-Seeded DCC Known Issues
**Status:** Partially scattered, NOT consolidated
**What:** Known failure modes for each DCC:
- DaVinci Resolve GUI dependency → davinci-rest REST shim
- Houdini: hython for headless mode
- Nuke 17.0 breaking changes from 16.x
- Cinema 4D Tencent Cloud auth → HuggingFace fallback
- UE 5.7: EditorActorSubsystem (NOT deprecated EditorLevelLibrary)
- Blender headless REQUIRES --background flag
- 4 DCCs need custom MCP builds from scratch
- ComfyUI: LTX Video Fast as primary video generation model
**Where to add:** DCC Adapter Ecosystem.md — "Known Issues" section
**Source:** NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 10

### 2. Session Start Protocol (GitNexus)
**Status:** NOT in vault
**What:** 5-step protocol for starting any session:
1. Run: `npx gitnexus query "what changed since last session"`
2. Check blast radius of planned changes
3. Load primer_[supervisor].md
4. Read MEMORY.md current state
5. Begin work with full context
**Where to add:** New file or Build Flow.md
**Source:** NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 9

### 3. CLAUDE.md GitNexus Additions
**Status:** NOT in vault
**What:** Specific additions to CLAUDE.md:
- Full graph index: `.gitnexus/` (LadybugDB via MCP)
- Structural map: `.code-review-graph/` (SQLite via MCP)
- Check blast radius before any change
- Never modify function without checking dependents
- If dependency chain 3+ levels deep: use plan mode first
- Use codegraph_explore or graph MCP tools before grepping
**Where to add:** Supervisor Configuration.md (Claude Code section)
**Source:** NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 9

### 4. Plurai (Evals & Guardrails)
**Status:** NOT in vault
**What:** 
- Corrected pricing: $0.15/1K tokens (NOT $500-2K)
- SLMs (Small Language Models) for validation
- 15x lower cost than LLM-as-judge, <100ms latency
- Use cases: AEGIS-99 enforcement at scale, tool invocation validation, policy compliance, grounding validation (prevents hallucination), real-time guardrails sub-100ms
- 1M tokens FREE on signup, $30 = 200K tokens
**Where to add:** AI Types Catalog (Tracked) + Security Stack
**Source:** NEW_STUFF_FROM_CORRECTED_ANALYSIS(1).txt

### 5. Lemur (Neural Architecture Search)
**Status:** NOT in vault
**What:** Google's AutoML tool for neural architecture search
- Could optimize FIONA's model selection per task type
- Could auto-tune DCC adapter parameters
- Low build value, high runtime value
**Where to add:** AI Types Catalog (Tracked for runtime)
**Source:** NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 15

---

## TIER 2 — HIGH VALUE (Should Address)

### 6. Temporal.io (Workflow Orchestration)
**Status:** In Budget Breakdown only ($0-50), no architecture doc
**What:** Workflow orchestration for build + runtime
- Could orchestrate the 30-day build timeline
- Could manage DCC adapter deployment sequences
- Durable execution (survives crashes)
**Where to add:** Architecture note or Build Flow.md
**Source:** NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 16

### 7. FlashKDA (CUDA Kernels for Kimi)
**Status:** NOT in vault
**What:** Custom CUDA kernels for accelerating Kimi K2.7 inference
- Build artifact memory
- Proactive context surfacing
- Asset discovery (semantic search)
**Where to add:** AI Types Catalog or brief note
**Source:** NEW_STUFF_FROM_CORRECTED_ANALYSIS(1).txt

### 8. Alibaba Metis / HDPO (RL Framework)
**Status:** NOT in vault
**What:** Reinforcement learning framework for training overseers
- Train overseers/supervisors to route cheap vs expensive models optimally
- Runtime: Reduce API costs 50-80% while maintaining accuracy
- Metacognitive training (agents know when they need external tools)
- Self-improving efficiency policy
**Where to add:** AI Types Catalog (Tracked) + Supervisor Configuration
**Source:** NEW_STUFF_FROM_CORRECTED_ANALYSIS(1).txt

### 9. ASI-Evolve (Autonomous Scientific Optimization)
**Status:** Mentioned in Creative Taste System, NOT detailed
**What:** Agentic framework that autonomously optimizes AI training data
- Optimizes DCC adapter code as it's written
- Auto-tunes AEGIS-99 scoring weights
- Auto-discovers better Leanstral proof patterns
- Self-improves without human intervention
**Where to add:** Deepen Creative Taste System.md or separate note
**Source:** ASI_EVOLVE_OPENMYTHOS_ANALYSIS(1).txt

### 10. OpenMythos (770M Param Creative Narrative)
**Status:** Mentioned in Creative Taste System, NOT detailed
**What:** Open-source creative narrative generator with Looped Transformers
- Adds "creative seasoning" to client-facing output
- Non-deterministic narrative generation
- 770M params = runs FAST on Lightning.ai
- Prevents "robotic" responses
**Where to add:** Deepen Creative Taste System.md or separate note
**Source:** ASI_EVOLVE_OPENMYTHOS_ANALYSIS(1).txt

---

## TIER 3 — MEDIUM VALUE (Address If Time)

### 11. DeepResearcher (Autonomous Research Agent)
**Status:** Mentioned in URM, NOT detailed
**What:** End-to-end autonomous research agent
- Recursive browsing (3-4 levels deep)
- Cross-verification (3+ sources)
- Could replace Kimi Agent for deeper research
**Where to add:** Universal Research Mandate (expand DeepResearcher section)
**Source:** FACETOOL_DEEPRESEARCHER_ASI_ANALYSIS(1).txt

### 12. A2A Protocol Details
**Status:** Partially in Tool Integration/Code Mode
**What:** Google's Agent-to-Agent protocol
- v1.0 stable spec (March 2026)
- 150+ organizations supporting
- OAuth 2.0 + signed Agent Cards
- pip install a2a-sdk
- FREE (Apache 2.0)
**Where to add:** Expand Tool Integration — Code Mode Architecture.md
**Source:** NEW_STUFF_FROM_CORRECTED_ANALYSIS(1).txt

### 13. PDF Files (20+ files)
**Status:** NOT read/extracted
**Files:** 
- FIONA RESEARCH AND PREGBUILD INTELLIGENCE
- fiona drive session3 analysis
- Fiona Architecture Gap Solution Discovery
- FIONA AI Orchestration Research Gaps
- FIONA v1.7 Deep Research Gap‑Closure Report
- Engineering Investigation for FIONA
- FIONA v1_7 Architecture Gap Closure
- FIONA Architecture Gap-Closure Investigation
- FIONA_Risk_3_Risk_6_Research_Report
- FIONA_v1.7_Risk3_Risk6_Deep_Architectural_Research
- Fiona Four Offerings Complete Spec
- fiona drive category reanalysis
- A&D report
- BIG Blue Ocean Opportunity Analysis
- CLAUDE Seven-DCC Adapter Ecosystem
- And duplicate copies
**Action:** Read and extract any unique insights not in vault

### 14. DOCX Files (4 files)
**Status:** NOT read/extracted
**Files:**
- Fiona GGOG_1778102153.735104.docx
- Fiona DCC Adapters chat (LEBROV & G).docx
- FIONA Project Update chat (SENTRY & SNYK).docx
- Duplicate copies
**Action:** Read and extract any unique insights

### 15. Items 11-19 from NEW_RESEARCH_TOOLS_ANALYSIS (Cost Clarifications)
**Status:** Mostly already implied in vault
**Items:**
- GitHub MCP: FREE (uses existing token)
- Lean 4: Free
- Leanstral: Free via Labs API, self-hostable
- DeepSeek-Prover-V2: Free on HuggingFace
- Tier 2 review: ~$3.80/day
- Langfuse SDK v3: Discard OpenLLMetry if using v3
- Super-smoke-test stop hook: JSON config
- Code-review-graph: pip install
- Tach: pip install
**Action:** Add as brief notes where relevant, or skip (already implied)

---

## TIER 4 — COMPLETED (For Reference)

### ✅ Completed in Last Push:
1. Agent Swarm (100 sub-agents) → AI Types Catalog
2. Nemotron 8AM cron → Mega Cycle + URM
3. OpenClaw cron → Overseer Config + Cron Automation file
4. PromptCachePrefixBuilder → PULSE
5. ModelContextWindowGuard → PULSE + Model Roster
6. Claude Code Subagents → Supervisor Config
7. Claude Code Hooks → Supervisor Config
8. FacTool → Security Stack
9. 9-Step Information Retrieval → URM

### ✅ Completed in Earlier Pushes:
- Loop Engineering (4 files merged)
- KIMI Swarm Historical Archive
- Cursor Composer 2.5 (updated with 3.0+ features)
- Tool Integration — Code Mode Architecture
- All stale data fixes (3-Tier consistency sweep)
- All cross-references between files

---

## RECOMMENDED PRIORITY ORDER

**Batch 1 (Critical):** Items 1-5
**Batch 2 (High):** Items 6-10
**Batch 3 (Medium):** Items 11-15

**Total remaining:** 15 items across 4 tiers
