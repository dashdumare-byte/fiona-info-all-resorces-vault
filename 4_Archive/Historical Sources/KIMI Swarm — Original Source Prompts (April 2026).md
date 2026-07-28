---
tags: [historical, kimi-swarm, source-prompts, april-2026, archive, original-architecture]
date-created: 2026-07-28
date-origin: 2026-04-30
status: HISTORICAL — Architecture evolved significantly since these prompts
---

# KIMI Swarm — Original Source Prompts (April 2026)

> **ARCHIVAL DOCUMENT:** These are the original system prompts used to configure Kimi Agent Swarm for FIONA v1.7 analysis tasks in April 2026. The architecture described here is the **v4.0-era baseline** — many model versions, timelines, and configurations have since been upgraded. This file preserves the original thinking and extracts the parts that remain relevant.

---

## What Kimi Swarm Was

Kimi Agent Swarm was FIONA's first multi-agent analysis layer. Three specialized prompts configured Kimi to act as:
1. **Repository Intelligence Swarm** — Analyze GitHub Stars lists for tool/repo value
2. **Resource Intelligence Swarm** — Analyze Google Drive folders for creative taste extraction
3. **Repo List Analysis Swarm** — Deep-dive analysis of specific repositories

**Current status:** The Kimi Swarm concept evolved into the **Universal Research Mandate** (all 8 models research independently) and the **3-Tier AEGIS-99 System** (L1/L2/L3/Nuclear). The prompts below are preserved as historical source material.

---

## HISTORICAL ARCHITECTURE (April 2026 — FOR REFERENCE ONLY)

⚠️ **The following describes the ORIGINAL April 2026 architecture. All model versions, timelines, and budgets have since been upgraded. See [[Model Roster]] for current specifications.**

### Original Model Stack (v4.0)
- **AEGIS-99:** Nemotron-3-Super-120B (35%) + GPT-5.5 (35%) + MiniMax M2.7 (25%) + Qwen3.6 (20%) + DeepSeek V4-Pro (20%) + D-Wave quantum (15%)
- **Code Pool (9-model):** Claude Opus 4.7/4.6, GPT-5.5, Qwen3.6, MiniMax M2.7, GLM-5.1, Kimi K2.6, DeepSeek V4-Pro
- **Supervisors:** Claude Code (Opus 4.7/4.6), Codex (GPT-5.5), OpenCode (Qwen3.6 + Nemotron)
- **Timeline:** 16-day build (later expanded to 30 days)
- **Budget:** $250-300 total, $15/day cap (later adjusted to $10/day)
- **DCC Versions:** UE 5.7, Blender 5.1.1, DaVinci 21, Nuke 17, C4D 2026.2, Houdini 21, ComfyUI

### What Changed (Evolution Log)
| April 2026 (Original) | Current (July 2026) | Reason |
|----------------------|---------------------|--------|
| GPT-5.5 | GPT-5.6 Sol/Terra/Luna | OpenAI released 5.6 family |
| Kimi K2.6 | Kimi K2.7 (+21.8% coding) | Moonshot upgrade |
| MiniMax M2.7 | MiniMax M3 (open-source) | MiniMax released M3 |
| Claude Opus 4.7/4.6 | Opus 5 (primary) / Opus 4.8 | Anthropic upgrades |
| GLM-5.1 | GLM-5.2 (1M context, long-horizon) | Z.ai upgrade |
| Qwen3.6 | Qwen3.7-Max | Alibaba upgrade |
| 16-day build | 30-day build | Realistic scope assessment |
| $15/day cap | $10/day cap | Budget discipline |
| D-Wave primary quantum | ORION Hybrid Classical-Quantum | D-Wave too expensive, Braket production |
| 9-model critical pool | 19-model L3 Premium pool | 3-Tier AEGIS-99 expansion |
| Fable 5 | Removed (suspended) → Opus 5 | Anthropic export controls |

---

## STILL-RELEVANT: Business Context

The following business descriptions remain accurate and are referenced across the vault:

### Pure Magic (Primary)
- Music video production
- DJ visuals
- AI/Web3 consulting

### B4D Grillz
- Custom dental jewelry manufacturing
- **Tolerance:** ±0.05mm biocompatible
- **Materials:** Biocompatible resins (NextDent C&B MFH)
- **Output:** STL files for 3D printing

### Body Language Shipping
- Freight/cargo to Nigeria
- **Challenge:** NGN/USD currency exposure
- **Need:** Logistics optimization + currency hedging

---

## STILL-RELEVANT: Creative Taste Categories

When analyzing any creative asset or resource, assess against these 10 categories:

| Category | What to Assess |
|----------|---------------|
| **Cinematography** | Lighting, camera work, composition, color grading |
| **Color Theory** | Palette preferences, emotional color associations |
| **Marketing** | Brand voice, target audience, campaign strategies |
| **Business Strategy** | Pure Magic positioning, B4D Grillz operations, Body Language Shipping logistics |
| **Inspiration** | Mood boards, visual references, style guides |
| **Technical** | Software workflows, pipeline documentation, API references |
| **Psychology** | Human behavior, emotional triggers, perception |
| **Music/Audio** | Sound design, music theory, DJ techniques |
| **3D/Design** | Modeling, texturing, rendering, product design |
| **Writing/Narrative** | Scriptwriting, storytelling, copywriting |

---

## STILL-RELEVANT: Ingestion Pipeline

How files should be processed and stored in FIONA's memory:

| File Type | Processing Method | Storage Location |
|-----------|-------------------|------------------|
| PDF/Text | Extract text → Chunk → Embeddings → Chroma | Chroma (text embeddings) |
| Images | CLIP embedding (visual features) → Chroma | Chroma (image embeddings) |
| Videos | Extract audio → Transcribe (Whisper) → Chunk → Chroma | Chroma (text embeddings) |
| Audio | Transcribe (Whisper) → Chunk → Chroma | Chroma (text embeddings) |
| Spreadsheets | Convert to text/JSON → Chunk → Chroma | Chroma (text embeddings) |
| Presentations | Extract slides as images + text → Both embeddings | Chroma (both) |

**Current implementation:** This pipeline is documented in [[Memory Architecture]] and [[Creative Taste System]].

---

## STILL-RELEVANT: Research Intelligence Stack

The following research tools and their roles remain current:

| Tool | Role | MCP Command |
|------|------|-------------|
| **Context7** | Version-specific library docs | `npx -y @upstash/context7-mcp` |
| **Tavily** | AI-optimized web search | Via API key |
| **Firecrawl** | Full web page extraction | `npx -y firecrawl-mcp` |
| **Exa** | Neural web search for code/repos | Via API key |
| **Brave Search** | Privacy-focused web search | `npx -y @modelcontextprotocol/server-brave-search` |
| **Semantic Scholar** | Academic paper search | Via API |
| **Markdownify** | Convert web content to markdown | Via API |
| **E2B** | Code execution sandbox | `npx -y @e2b/mcp-` |
| **Consensus** | Research paper summary/verification | MCP available |

**Note:** These tools are also documented in [[Universal Research Mandate]] and [[Research Vote Weights]].

---

## STILL-RELEVANT: Core Design Principles

These principles from the original prompts remain foundational:

1. **No output ships without unanimous multi-model consensus (AEGIS-99).** Speed is secondary to correctness.
2. **Every model in the pool must independently research and cross-verify.** Not 5 models — ALL models.
3. **Search before building. Test before shipping. Ship the complete thing.**
4. **Lightning.ai = only build environment.** Dell Latitude 7490 is NEVER used for build work.
5. **DCC hard gates are MANDATORY.** Build FAILS if versions don't match.
6. **Cursor Pro = mandatory hard gate.** Zero failing tests, zero critical lint, AEGIS PASS required.
7. **Quantum layer is MANDATORY for production builds.**
8. **Memory Authority Hierarchy must be in CLAUDE.md at merge.**
9. **Universal Research Mandate = ALL models research before generating.**

---

## What the Swarm Prompts Did (Workflow)

### GitHub Repo Analysis Prompt
1. Receive GitHub Stars list link
2. For EACH repository:
   - Fetch README, analyze code structure
   - Assess: FIONA relevance, build value, runtime value, cost, complexity
   - Flag: security risks, license issues, maintenance status
3. Categorize: Critical / High / Medium / Low / Skip
4. Output: Structured analysis with recommendations

### Google Drive Analysis Prompt
1. Receive Google Drive folder link
2. For EACH file:
   - Identify file type, size, last modified
   - Extract content summary
   - Assess creative taste value (10 categories above)
   - Determine ingestion pipeline method
   - Map to business use cases
3. Output: Full resource catalog with ingestion plan

### Repo Deep Analysis Prompt
1. Receive specific repository for deep-dive
2. Analyze: architecture, dependencies, API surface, test coverage, documentation
3. Compare against FIONA requirements
4. Output: Detailed integration assessment

---

## Why These Were Archived

The Kimi Swarm approach (3 specialized prompts, single-model analysis) evolved into:

| Old Approach (Kimi Swarm) | Current Approach (3-Tier AEGIS-99) |
|---------------------------|-----------------------------------|
| 1 model (Kimi) doing analysis | 8+ models research independently |
| Static prompts | Universal Research Mandate with cross-verification |
| Single-pass analysis | AEGIS-99 consensus scoring ≥0.90 |
| Manual result integration | FacTool verification + automated brief compilation |
| Kimi-only | Multi-model: Opus, GPT-5.6, DeepSeek, GLM-5.2, Qwen3.7, MiniMax M3, Kimi K2.7 |

**The swarm concept lives on** — it's just that FIONA's "swarm" is now the full 19-model L3 Premium pool with AEGIS-99 consensus, not a single Kimi instance with 3 prompts.

---

## Source Files
- `KIMI_SWARM_GITHUB_REPO_PROMPT.txt` (15.7KB) — April 30, 2026
- `KIMI_SWARM_GOOGLE_DRIVE_PROMPT.txt` (9.5KB) — April 30, 2026
- `KIMI_SWARM_REPO_ANALYSIS_PROMPT.txt` (13.4KB) — April 30, 2026

---

## Related Files
- [[Universal Research Mandate]] — Current 8-model independent research system
- [[Model Roster]] — Current model specifications (all versions upgraded)
- [[AEGIS-99 Consensus Engine]] — Current consensus engine
- [[Creative Taste System]] — Current creative taste learning system
- [[Memory Architecture]] — Current ingestion pipeline implementation
