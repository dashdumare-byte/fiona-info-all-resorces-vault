---
tags: [models, roster, api-strings, locked, reference, 3-tier]
date-created: 2026-06-06
date-updated: 2026-07-22
source: FIONA_v1.7_ALL_MODELS_ROSTER(1).txt
---

# Model Roster — 3-Tier AEGIS-99 System

> **Complete reference for all 20+ models in the FIONA ecosystem.**
> **Architecture: 3-Tier AEGIS-99 (L1 Free → L2 Standard → L3 Premium → Nuclear)**
> Last updated: 2026-07-22 (GPT-5.6, Opus 5, Kimi K3, Ornith, Tencent Hy3, Laguna XS 2.1, Gemma 4 added)

---

## Tier Architecture Overview

| Tier | Models | Cost | When Used |
|------|--------|------|-----------|
| **L1 Free** | 6 models (NIM + self-hosted + free APIs) | **$0** | Simple tasks, high volume, Ashandy says "use free" |
| **L2 Standard** | 11 models (L1 + paid tier) | **~$40-60/mo** | Default for most tasks, auto for complex |
| **L3 Premium** | 16 models (L2 + premium) | **~$80-120/mo** | Ashandy says "use L3" or AEGIS-99 detects critical |
| **Nuclear** | All 20+ models in parallel | **~$150-250/mo** | Ashandy approval ONLY — catastrophic scenarios |

**Auto-escalation:** L1→L2 when task complexity > threshold. L2→L3 when stakes > threshold. **NO auto L3→Nuclear** — requires human approval.

---

## L1 FREE (6 Models) — $0 Cost

> Ashandy says "use free" OR simple/volume tasks. All free via NIM credits, self-hosted, or free OpenRouter tier.

| # | Model | String | Context | Role | How It's Free |
|---|-------|--------|---------|------|---------------|
| 1 | **Nemotron 3 Ultra 550B** | `nvidia/nemotron-3-ultra-550b` (NIM) | 1M | Architect, AEGIS primary | NVIDIA NIM free dev credits |
| 2 | **MiniMax M3** | `minimax/minimax-m3` (NIM) | 1M | Multimodal, image+video | NVIDIA NIM free dev credits |
| 3 | **Ornith 1.0-35B MoE** | Self-hosted via vLLM | 262K | Coding specialist, local | Self-hosted on Lightning.ai (free compute) |
| 4 | **Tencent Hy3** | `tencent/hy3` (OpenRouter) | 262K | Configurable reasoning, logic | FREE on OpenRouter |
| 5 | **Poolside Laguna XS 2.1** | `poolside/laguna-xs-2.1` (OpenRouter) | 262K | Fast coding agent | FREE on OpenRouter |
| 6 | **Gemma 4 26B** | `gemma4:26b` (Ollama) | 256K | Syntax/PEP8/lint, basic logic | Local via Ollama |

### L1 Model Specs

| Model | Params | Speed | VRAM (Q4) | SWE-Bench |
|-------|--------|-------|-----------|-----------|
| Nemotron 3 Ultra | 550B/55B active | 180 TPS | N/A (cloud) | 81.6 |
| MiniMax M3 | 428B | 240 TPS | N/A (cloud) | 73.8 |
| Ornith-35B MoE | 35B/~3B active | 120 TPS | 25GB | 75.6 |
| Tencent Hy3 | 295B/21B active | 100 TPS | N/A (cloud) | 71.2 |
| Poolside Laguna XS 2.1 | 33B | 200 TPS | N/A (cloud) | 68.4 |
| Gemma 4 26B | 26B/3.8B active | 60 TPS | 15.6GB | 77.1 |

---

## L2 STANDARD (11 Models) — ~$40-60/mo

> **Default tier.** Auto-selected for most tasks. Includes all L1 models + 5 paid models.

| # | Model | String | Context | Role | Cost (per 1M out) |
|---|-------|--------|---------|------|-------------------|
| 7 | **GPT-5.6 Terra** | `openai/gpt-5.6-terra` | 1.05M | Speed + adversarial, general purpose | $15 |
| 8 | **Kimi K2.7** | `moonshotai/kimi-k2.7` | 256K | Cleanup, edge cases, high-speed coding | $4 |
| 9 | **Grok 4.5** | `x-ai/grok-4.5` | 500K | Volume coding, 80 TPS speed mode | $6 |
| 10 | **GLM-5.2** | `z-ai/glm-5.2` | 1.05M | **Coding brain (lead)** | $3 |
| 10b | GLM-5.1 (fallback) | `z-ai/glm-5.1` | 192K | Coding brain (fallback) | $2.86 |
| 11 | **Qwen3.7-Max** | `qwen3.7-max-preview` | 260K | Web/UI code, agent-centric | $1.60 |

### L2 Model Specs

| Model | SWE-Bench Pro | Terminal-Bench | DeepSWE 1.1 | Speed (TPS) |
|-------|---------------|----------------|-------------|-------------|
| GPT-5.6 Terra | ~60% (est) | 87.4% | ~58% (est) | ~35 |
| Kimi K2.7 | 54.0% | 86.0% | 52.0% | 260 (highspeed) |
| Grok 4.5 | 64.7% | 83.3% | 53.0% | 80 |
| GLM-5.2 | 58.0% | 84.0% | 55.0% | 90 |
| Qwen3.7-Max | 52.0% | 80.0% | 48.0% | 120 |

---

## L3 PREMIUM (16 Models) — ~$80-120/mo

> **High-value tier.** Ashandy says "use L3" OR AEGIS-99 detects critical stakes. Includes all L1 + L2 models + 5 premium models.

| # | Model | String | Context | Role | Cost (per 1M out) |
|---|-------|--------|---------|------|-------------------|
| 12 | **GPT-5.6 Sol** | `openai/gpt-5.6-sol` | 1.05M | Deep analysis, agentic tasks | $30 |
| 12u | GPT-5.6 Sol Ultra | `openai/gpt-5.6-sol` (ultra mode) | 1.05M | 4 parallel agents, nuclear tasks | $90 (3x) |
| 13 | **Opus 5** | `anthropic/opus-5` (Anthropic API) | 1M | **Deep creative analysis, reasoning SOTA** | $25 |
| 14 | **Opus 4.8** | `anthropic/claude-opus-4.8` | 1M | Visual architecture, critical coding, Fable 5 Lite backup | $25 |
| 15 | **DeepSeek V4-Pro** | `deepseek/deepseek-v4-pro` | 1.05M | Raw code volume, long-horizon | $8 |
| 16 | **Kimi K3** | `moonshotai/kimi-k3` | 1.05M | Large-context coding, frontend/design, multimodal | $15 |

### L3 Model Specs

| Model | SWE-Bench Pro | Terminal-Bench | Agents' Last Exam | Key Feature |
|-------|---------------|----------------|-------------------|-------------|
| GPT-5.6 Sol | 64.6% | 88.8% | 53.6% | Agentic SOTA, 4-agent ultra mode |
| Opus 5 | 72.0% | 91.0% | 58.0% | Reasoning SOTA, deep creative analysis |
| Opus 4.8 | 69.2% | 78.9% | 45.2% | Visual + coding, most proven |
| DeepSeek V4-Pro | 64.3% | 83.4% | 46.9% | 1.05M context, hybrid attention |
| Kimi K3 | ~62% (est) | 85.0% (est) | ~50% (est) | 1M context, frontend #1, vision-in-loop |

---

## NUCLEAR (All 20+ Models Parallel) — ~$150-250/mo

> **Ashandy approval ONLY.** No auto-escalation to nuclear. All models run in parallel, AEGIS-99 consensus at highest threshold.

**Trigger conditions (Ashandy must explicitly approve):**
- Catastrophic system failure requiring all models
- Final 69-module integration validation
- Client-critical deadline with zero tolerance
- Sovereign Protocol full activation

**Execution:** GPT-5.6 Sol Ultra (4 parallel agents) + all L1/L2/L3 models simultaneously. AEGIS-99 >=0.95 consensus required.

---

## Opus 5 API Setup

**Status:** Available via Anthropic API key (API access restored July 2026)

| Requirement | Value |
|-------------|-------|
| API Key | Anthropic API key (not OpenRouter) |
| Endpoint | `https://api.anthropic.com/v1/messages` |
| Model ID | `claude-sonnet-fable-5-20250701` |
| Context | 1M tokens |
| Cost | $25/M output |
| Tier | **L3 Premium** — deep creative analysis |
| Backup | Opus 4.8 + Fable behavioral prompt (Fable 5 Lite) |

```bash
# Test Opus 5 API
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d '{
    "model": "claude-sonnet-fable-5-20250701",
    "max_tokens": 4096,
    "messages": [{"role": "user", "content": "Test"}]
  }'
```

---

## Supervisors (3) — Cross-Tier

| # | Tool | Models | Config | Role |
|---|------|--------|--------|------|
| 1 | Claude Code | Opus 4.8 / Opus 5 (Fable 5 fallback) + Sonnet | CLAUDE.md + PULSE.md | Production code, bugs, refactor, token efficiency, memory, security, DCC gate |
| 2 | Codex | GPT-5.6 Sol/Terra + plugin | AGENTS.md | Validate AEGIS-99, code quality, cross-check, flag deadlock |
| 3 | OpenCode | Qwen3.7 + Nemotron | opencode.json | Independent review, alternative impl, edge cases |

---

## Overseers (2 — 24/7)

| Agent | Platform | Role | Strictness |
|-------|----------|------|------------|
| Pi Agent | Lightning.ai | Terminal-native overseer | EXTREME |
| Goose | Lightning.ai | Desktop + terminal overseer | EXTREME |

Shared: 8 objectives, log to shared JSONL, escalate on 5th failure, report every 30min.

---

## NVIDIA NIM Free Models (L1 Runtime)

| Model | Endpoint | Runtime Role |
|-------|----------|--------------|
| Nemotron 3 Ultra 550B | NIM | AEGIS architect |
| MiniMax M3 | NIM | Multimodal |
| **GLM-5.2** | NIM | Coding brain (lead) |
| GLM-5.1 | NIM | Coding brain (fallback) |
| GLM-4.7 | NIM | Fallback |
| DeepSeek V4 Flash | NIM | Fast coding |
| Mistral-small | NIM | Logic/reasoning |
| flux.2-klein-4b | NIM | Image generation |
| cosmos-transfer2.5-2b | NIM | Video/world gen |
| nemotron-asr-stream | NIM streaming | Voice input |
| nemotron-voicechat | NIM | Voice output |
| nemotron-ocr-v1 | NIM | OCR + research |
| Sarvam-M | NIM | Indic languages |

---

## API Key Requirements

| Model/Source | Key Needed | Where | Tier |
|-------------|------------|-------|------|
| GPT-5.6 Sol / Terra | OpenRouter API key | openrouter.ai | L2/L3 |
| Kimi K2.7 / K3 | OpenRouter or Moonshot API key | openrouter.ai / moonshot.cn | L2/L3 |
| DeepSeek V4-Pro | OpenRouter API key | openrouter.ai | L2/L3 |
| MiniMax M3 | OpenRouter API key OR self-hosted weights | openrouter.ai / local | L1 |
| Claude Opus 4.8 | Vertex AI project ID | cloud.google.com | L3 |
| **Opus 5** | **Anthropic API key** | **anthropic.com** | **L3** |
| **GLM-5.2** (GLM-5.1 fallback) | Z.ai API key | z.ai | L2 |
| Qwen3.7-Max-Preview | Alibaba Cloud Model Studio | alibabacloud.com | L2 |
| Nemotron 3 Ultra 550B | NVIDIA NIM free dev key | build.nvidia.com | L1 |
| Tencent Hy3 | OpenRouter (FREE tier) | openrouter.ai | L1 |
| Poolside Laguna XS 2.1 | OpenRouter (FREE tier) | openrouter.ai | L1 |
| Ornith-35B MoE | Self-hosted (vLLM on Lightning.ai) | local | L1 |
| Gemma 4 26B | Ollama (local) | ollama.ai | L1 |
| D-Wave Leap | D-Wave account (free LaunchPad) | dwavesys.com | Quantum |

---

## Key Distinctions (Prevent Mix-Ups)

1. **MiniMax M3 vs M2.5**: M3 = L1 free multimodal. M2.5 = deprecated, do not use.
2. **Claude Opus 4.8 vs Opus 5 (Fable 5 fallback)**: Opus 4.8 = visual + coding. Fable 5 = deep creative analysis + reasoning. Both L3.
3. **Kimi K2.7 vs K3**: K2.7 = L2 standard, high-speed ($4), 256K context. K3 = L3 premium, large-context ($15), 1M context. NOT the same model.
4. **GLM-5.2 vs GLM-5.1 vs GLM-5 NIM**: GLM-5.2 = L2 coding lead (1.05M). GLM-5.1 = L2 coding fallback (192K). GLM-5 NIM = L1 runtime fallback only.
5. **GPT-5.6 Terra vs Sol**: Terra = L2 standard ($15), half cost of GPT-5.5. Sol = L3 premium ($30), agentic SOTA. Both replace GPT-5.5.
6. **Fable 5 vs Fable 5 Lite**: Fable 5 = real model on Anthropic API (L3). Fable 5 Lite = Opus 4.8 + behavioral prompt (backup only).
7. **Supervisors vs Overseers**: Supervisors (3) review code AFTER AEGIS-99. Overseers (2) monitor 24/7.
8. **GPT-5.6 Sol Ultra**: EXTREME fallback only (3x cost). Nuclear tier only. Ashandy approval required.
9. **L1 Gemma 4 26B vs 31B**: 26B = default (15.6GB VRAM). 31B = upgrade if quality insufficient (17.4GB VRAM).
10. **Nuclear tier**: Ashandy explicit approval ONLY. No auto-escalation from L3. Say "go nuclear" to activate.

---

## 3-Tier AEGIS-99 Consensus Weights

### L1 Voting Weights (Free Models Only)

| Model | Weight | Specialty |
|-------|--------|-----------|
| Nemotron 3 Ultra | 30% | Architecture, logic |
| MiniMax M3 | 20% | Multimodal, audit |
| Ornith-35B | 15% | Coding patterns |
| Tencent Hy3 | 15% | Reasoning |
| Poolside Laguna XS 2.1 | 10% | Fast coding |
| Gemma 4 26B | 10% | Syntax, lint |

### L2 Voting Weights (Standard)

| Model | Weight | Specialty |
|-------|--------|-----------|
| GPT-5.6 Terra | 20% | General purpose |
| Kimi K2.7 | 15% | High-speed coding |
| GLM-5.2 | 15% | Coding brain |
| Grok 4.5 | 10% | Volume coding |
| Qwen3.7-Max | 10% | Web/UI |
| L1 models (combined) | 30% | Baseline |

### L3 Voting Weights (Premium)

| Model | Weight | Specialty |
|-------|--------|-----------|
| GPT-5.6 Sol | 15% | Agentic tasks |
| Opus 5 | 15% | Deep creative analysis (Fable 5 fallback) |
| Opus 4.8 | 15% | Visual + critical coding |
| DeepSeek V4-Pro | 15% | Raw code volume |
| Kimi K3 | 10% | Large-context coding |
| L2 models (combined) | 30% | Baseline |

### Nuclear Consensus (All Models)

All 20+ models vote. AEGIS-99 >=0.95 required. GPT-5.6 Sol Ultra coordinates 4 parallel subagents.

---

## Auto-Escalation Rules

| From | To | Trigger | Cost Impact |
|------|-----|---------|-------------|
| L1 | L2 | Task complexity > 0.7 OR time > 30s | +$0.01-0.05/call |
| L2 | L3 | Stakes = critical OR Ashandy says "L3" | +$0.10-0.50/call |
| L3 | Nuclear | **Ashandy says "go nuclear" ONLY** | +$5-20/call |

**De-escalation:** After task completes, auto-return to default tier (L2). No lingering in premium tiers.

---

## Changelog

| Date | Change |
|------|--------|
| 2026-06-06 | Initial model roster (v4.1) |
| 2026-06-12 | Nemotron 3 Ultra 550B replaces Super |
| 2026-06-12 | MiniMax M3 open-source replaces M2.7 |
| 2026-06-18 | GLM 5.2 replaces GLM 5.1 as coding lead |
| 2026-07-08 | DCC versions updated (UE 5.8, Blender 5.2.0, C4D 2026.3.2) |
| 2026-07-14 | 16-day → 30-day build timeline |
| 2026-07-22 | **3-Tier AEGIS-99 system implemented** |
| 2026-07-22 | GPT-5.6 Sol/Terra/Luna added |
| 2026-07-22 | Opus 5 added (Fable 5 fallback) to L3 Premium |
| 2026-07-22 | Kimi K3 added to L3 Premium |
| 2026-07-22 | Ornith-35B, Tencent Hy3, Poolside Laguna XS 2.1, Gemma 4 added to L1 |
| 2026-07-22 | Grok 4.5 added to L2 Standard |
| 2026-07-22 | Kimi K2.7 upgraded from K2.6 |
