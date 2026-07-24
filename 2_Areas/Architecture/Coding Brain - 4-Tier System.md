---
tags: [coding, brain, 4-tier, build, runtime, locked]
date-created: 2026-07-22
---

# Coding Brain — 4-Tier System

> **Same architecture as AEGIS-99 (L1 Free → L2 Standard → L3 Premium → Nuclear)**
> **Applies to BOTH Fiona BUILD TIME and Fiona RUNTIME**
> **Adapters + Webapp = L3/Nuclear ONLY**

---

## Architecture Overview

| Tier | # Models | Build Role | Runtime Role | Cost |
|------|----------|-----------|--------------|------|
| **L1 Free** | 5 | Simple scaffolding, lint, tests | Client simple fixes, quick scripts | $0 |
| **L2 Standard** | 5 | Standard module coding, APIs | Standard client work, web apps | ~$20-30/mo |
| **L3 Premium** | 5 | **DCC ADAPTERS + WEBAPP + complex architecture** | Complex client platforms, creative tools | ~$60-80/mo |
| **Nuclear** | 20+ | Full system integration, catastrophic | All-hands critical | ~$100-150/mo |

**CRITICAL RULE: L1/L2 NEVER touch DCC Adapters or Webapp. These are L3 minimum.**

---

## L1 FREE CODING (5 Models) — $0

### Build-Time Team

| # | Model | Role | Why |
|---|-------|------|-----|
| 1 | **Ornith-35B MoE** | Primary L1 coder | 75.6% SWE-Bench Verified at $0. 25GB VRAM. Handles 80% of simple module scaffolding. |
| 2 | **Tencent Hy3** | Logic + reasoning | ~74% SWE-Bench Verified. FREE on OpenRouter. Architectural decisions, code review. |
| 3 | **Poolside Laguna XS 2.1** | Fast iteration + testing | 70.9% SWE-Bench Verified. FREE on OpenRouter. Tests, validation. |
| 4 | **Qwen3.5-9B (L1 coding lead) | 82.5% MMLU-Pro, 76% HumanEval, Apache 2.0, ~6GB VRAM | 77.1% LiveCodeBench. Local via Ollama. Formatting, PEP8, simple functions. |
| 5 | **MiniMax M3** (NIM) | Multimodal coding | FREE via NIM. Code involving image/video processing. |

### Runtime Team

| # | Model | Role | Why |
|---|-------|------|-----|
| 1 | **Ornith-35B MoE** | Client project scaffolding | $0, fast. Simple client landing pages, basic scripts. |
| 2 | **Tencent Hy3** | Quick logic fixes | FREE. Hotfixes, small feature additions. |
| 3 | **Poolside Laguna XS 2.1** | Test writing | FREE. Write tests for client code. |
| 4 | **Qwen3.5-9B (L1 coding) | Code review, basic fixes | $0 local. Review client code before human review. |
| 5 | **MiniMax M3** (NIM) | Multimodal creative coding | FREE. Code for image/video generation in campaigns. |

### L1 Use Cases (Both Build + Runtime)
- Single file, <100 lines
- Lint, format, simple functions
- Qwen3.5-9B: Basic scaffolding, boilerplate
- Test generation
- Syntax fixes, PEP8
- Simple API endpoints
- Documentation generation

---

## L2 STANDARD CODING (5 Models) — ~$20-30/mo

### Build-Time Team

| # | Model | Role | Why |
|---|-------|------|-----|
| 6 | **GLM 5.2** (lead) | Primary build coder | 62.1% SWE-Bench Pro, 1M context, $3/M. Best value coding model. Multi-file modules. |
| 7 | **Grok 4.5** | Speed coding | 64.7% SWE-Bench Pro, 80 TPS. Time-pressed tasks. |
| 8 | **GPT-5.6 Terra** | General purpose build | 63.4% SWE-Bench Pro, 87.4% Terminal-Bench. Reliable everyday coder. |
| 9 | **Kimi K2.7** | High-speed cleanup | 260 TPS highspeed. Edge case fixes, simple refactors. $4/M. |
| 10 | **Qwen3.7-Max** | Web/UI build specialist | 80.4% SWE-Bench Verified. Module 12 (Frontend Factory). |

### Runtime Team

| # | Model | Role | Why |
|---|-------|------|-----|
| 6 | **GLM 5.2** (lead) | Primary runtime coder | $3/M, 1M context. Client websites, API integrations, automation. |
| 7 | **Kimi K2.7** (highspeed) | Real-time interactive | 260 TPS. Chat-based coding help, live debugging. |
| 8 | **GPT-5.6 Terra** | General client work | $15/M. Reliable for standard client deliverables. |
| 9 | **Grok 4.5** | Rapid prototyping | 80 TPS, $6/M. Quick prototypes for client pitches, MVPs. |
| 10 | **Qwen3.7-Max** | Web/app runtime specialist | Strong web/UI coding. Client web apps, dashboards. |

### L2 Use Cases (Both Build + Runtime)
- Multi-file modules, standard complexity
- API endpoints, database models
- Web components, UI builds
- DCC adapter LOGIC (not architecture — L3 does architecture)
- Integration code
- Client website builds

---

## L3 PREMIUM CODING (5 Models) — ~$60-80/mo

### Build-Time Team

| # | Model | Role | Why |
|---|-------|------|-----|
| 11 | **Claude Fable 5** | Complex refactors | 80% SWE-Bench Pro — best repo-level coding. Multi-file architectural changes. |
| 12 | **Claude Opus 4.8** | Architecture + DCC adapters | 69.2% SWE-Bench Pro. Best for complex DCC logic (UE, Houdini, Nuke). |
| 13 | **GPT-5.6 Sol** | Agentic build tasks | 88.8% Terminal-Bench, 80 Coding Agent Index. Autonomous multi-step build workflows. |
| 14 | **DeepSeek V4-Pro** | Algorithmic modules | 93.5% LiveCodeBench — best algorithms. Module 64, optimization code. |
| 15 | **Kimi K3** | Frontend + large-context | 88.3% Terminal-Bench, 1M context. Module 12, complex UI builds. |

### Runtime Team

| # | Model | Role | Why |
|---|-------|------|-----|
| 11 | **Claude Fable 5** | Complex client architecture | 80% SWE-Bench Pro. Large client projects, e-commerce, custom platforms. |
| 12 | **Claude Opus 4.8** | DCC runtime integration | Best for UE blueprints, Houdini VEX, Nuke Python at runtime. |
| 13 | **Kimi K3** | Creative frontend + vision | Frontend Code Arena #1. Creative campaign websites, interactive experiences. |
| 14 | **DeepSeek V4-Pro** | Algorithmic creative tools | 93.5% LiveCodeBench. Custom algorithms for generative art, data viz. |
| 15 | **GPT-5.6 Sol** | Autonomous creative workflows | 80 Coding Agent Index. Overnight campaign generation, content pipelines. |

### L3 EXCLUSIVE: DCC Adapters + Webapp
**L1/L2 are BLOCKED from these tasks:**

| Task | Why L3 Minimum |
|------|---------------|
| **M27: Blender 5.2.0 LTS Adapter** | Complex bpy API, headless mode, Python API changes |
| **M28: DaVinci Resolve 21 Adapter** | davinci-rest REST shim, color science integration |
| **M29: Nuke 17 Adapter** | Python API, USD-based 3D system, BigCat ML |
| **M30: Cinema 4D 2026.3.2 Adapter** | Python API + MoGraph module, `maxon` import fixes |
| **M31: Houdini 21 Adapter** | `hou` module in `hython`, VEX/Python interop |
| **M32: Unreal Engine 5.8 Adapter** | Remote Control API, EditorActorSubsystem, MCP plugin |
| **M33: ComfyUI Adapter** | Latest SHA rolling, custom node system |
| **M20: API Gateway (Webapp)** | Full web application architecture, security, scaling |

### L3 Use Cases (Both Build + Runtime)
- DCC adapter architecture and implementation
- Webapp architecture and implementation
- Complex multi-module refactors
- Algorithm-heavy modules
- Frontend design systems
- Security-critical code (M65 SENTRY)
- Cross-module dependency management

---

## NUCLEAR CODING (All 20+ Models Parallel)

### Trigger Conditions (Ashandy approval ONLY)
- Day 30: Full 69-module integration validation
- Catastrophic build failures
- Final security audit (all models review all code)
- Client-critical deadline with zero tolerance
- Full creative campaign generation (runtime)

### Execution
All L1 + L2 + L3 models run in parallel. AEGIS-99 >=0.95 consensus. GPT-5.6 Sol Ultra coordinates 4 parallel subagents.

---

## CODING TASK ROUTING MATRIX

| Task Type | Complexity | Build Tier | Runtime Tier | Example |
|-----------|-----------|------------|--------------|---------|
| Single file, <100 lines | Low | L1 | L1 | Lint, format, simple function |
| Multi-file, standard | Medium | L2 | L2 | API endpoint, web component |
| DCC adapter or webapp | **HIGH** | **L3** | **L3** | UE 5.8 integration, API Gateway |
| Complex refactor, architecture | High | L3 | L3 | Module restructure, design system |
| Full system rebuild | Critical | Nuclear | Nuclear | 69-module integration |

---

## COST COMPARISON

| Tier | Build (30 days) | Runtime (monthly) |
|------|----------------|-------------------|
| L1 Free | $0 | $0 |
| L2 Standard | ~$150-200 total | ~$20-30/mo |
| L3 Premium | ~$300-400 total | ~$60-80/mo |
| Nuclear | ~$500 (Day 30 only) | ~$100-150/mo |

**Total build coding cost:** ~$450-600 (within $300 budget if L3 used sparingly)
**Total runtime coding cost:** ~$120-180/mo (within $200-250/mo total budget)

---

## Auto-Escalation Rules (Coding)

| From | To | Trigger | Cost Impact |
|------|-----|---------|-------------|
| L1 | L2 | >1 file OR complexity > 0.6 | +$0.01-0.05/call |
| L2 | L3 | DCC adapter OR webapp OR >5 files | +$0.10-0.50/call |
| L3 | Nuclear | **Ashandy says "go nuclear" ONLY** | +$5-20/call |

**De-escalation:** Auto-return to L2 after task completion.

---

## Key Distinctions

1. **Opus 4.8 vs Fable 5 vs Sol**: Opus 4.8 = pure coding reliability (69.2% SWE-Bench). Fable 5 = repo-level refactoring (80% SWE-Bench). Sol = agentic workflows (80 Coding Agent Index). All three L3, different roles.
2. **Kimi K2.7 vs K3**: K2.7 = L2, high-speed, cheap ($4). K3 = L3, large-context, expensive ($15). NOT the same model.
3. **GLM 5.2**: L2 lead for standard coding. Escalates to L3 only for architecture decisions.
4. **Adapters + Webapp**: L3 MINIMUM. Never L1/L2. Hard rule.
5. **Ornith-35B**: Best free coding model. Handles 80% of L1 tasks. Self-hosted on Lightning.ai.
6. **Nuclear**: Ashandy approval only. No auto-escalation from L3.

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Initial 4-Tier Coding Brain system |
| 2026-07-22 | Adapters + Webapp = L3/Nuclear only (hard rule) |
| 2026-07-22 | Separate teams for Build-Time and Runtime |
