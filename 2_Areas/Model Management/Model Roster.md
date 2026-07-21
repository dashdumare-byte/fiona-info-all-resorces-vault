---
tags: [models, roster, api-strings, locked, reference]
date-created: 2026-06-06
source: FIONA_v1.7_ALL_MODELS_ROSTER(1).txt
---

# Model Roster

> **Complete reference for all 20+ models in the FIONA ecosystem.**
> Last updated: 2026-06-08 (Nemotron 3 Ultra 550B + MiniMax M3 open-source upgrades applied)

---

## AEGIS-99 Consensus (Quality Gate)

| Model | String | Weight | Role |
|-------|--------|--------|------|
| Nemotron 3 Ultra 550B | `nvidia/nemotron-3-ultra-550b` | 20% | Architect Primary |
| GPT-5.5 | `openai/gpt-5.5` | 15% | Architect Co-Primary |
| DeepSeek V4-Pro | `deepseek-v4-pro` | 15% | Architect Co-Primary |
| D-Wave Leap | `d-wave-leap-api` | 15% | Quantum |
| MiniMax M3 | `minimax/minimax-m3` | 15% | Auditor 1 |
| Qwen3.7-Max-Preview | `qwen3.7-max-preview` | 10% | Auditor 2 |

---

## Critical Pool (9 Models — Critical Modules + DCC Adapters + Web App)

| Pass | Model | String | Context | Role |
|------|-------|--------|---------|------|
| 0-Extra | Claude Opus 4.8 | `claude-opus-4-8` | 1M/128k | Critical architecture, visual |
| 1 | GPT-5.5 | `openai/gpt-5.5` | 1.05M | Speed + adversarial |
| 2 | Qwen3.7-Max-Preview | `qwen3.7-max-preview` | 260K | Web/UI code |
| 3 | MiniMax M3 | `minimax/minimax-m3` | 256K | Multimodal + DCC |
| 4 | **GLM-5.2** | `z-ai/glm-5.2` | **1.05M** | **Coding brain (lead)** |
| 4b | GLM-5.1 | `z-ai/glm-5.1` | 192K | Coding brain (fallback) |
| 5 | Kimi K2.7 | `moonshotai/moonshotai/kimi-k2.7` | 256K | Cleanup + edge cases |
| 6 | DeepSeek V4-Pro | `deepseek-v4-pro` | 1M | Raw code volume |
| 7 | D-Wave Quantum | `d-wave-leap-api` | — | Strategy + optimize |
| 8 | GPT-5.5 Pro | `openai/gpt-5.5-pro` | 1.05M | EXTREME fallback only |

---

## Standard Pool (8 Models — Standard Modules)

| Pass | Model | String | Context | Role |
|------|-------|--------|---------|------|
| 0 | Claude Opus 4.6 | `claude-opus-4-6` | 1M/128k | Standard modules |
| 1 | GPT-5.5 | `openai/gpt-5.5` | 1.05M | Speed + adversarial |
| 2 | Qwen3.7-Max-Preview | `qwen3.7-max-preview` | 260K | Web/UI |
| 3 | MiniMax M3 | `minimax/minimax-m3` | 256K | Multimodal |
| 4 | **GLM-5.2** | `z-ai/glm-5.2` | **1.05M** | **Coding brain** |
| 4b | GLM-5.1 | `z-ai/glm-5.1` | 192K | Coding brain (fallback) |
| 5 | Kimi K2.7 | `moonshotai/moonshotai/kimi-k2.7` | 256K | Cleanup |
| 6 | DeepSeek V4-Pro | `deepseek-v4-pro` | 1M | Raw generation |
| 7 | D-Wave Quantum | `d-wave-leap-api` | — | Strategy |

---

## Supervisors (3)

| # | Tool | Models | Config | Role |
|---|------|--------|--------|------|
| 1 | Claude Code | Opus 4.8 / 4.6 + Sonnet | CLAUDE.md | Production code, bugs, refactor, memory, security, DCC gate |
| 2 | Codex | GPT-5.5 + plugin | AGENTS.md | Validate AEGIS-99, code quality, cross-check, flag deadlock |
| 3 | OpenCode | Qwen3.7 + Nemotron | opencode.json | Independent review, alternative impl, edge cases, Lean4 proof |

---

## Overseers (2 — 24/7)

| Agent | Platform | Role | Strictness |
|-------|----------|------|------------|
| Pi Agent | Lightning.ai | Terminal-native overseer | EXTREME |
| Goose | Lightning.ai | Desktop + terminal overseer | EXTREME |

Shared: 8 objectives, log to shared JSONL, escalate on 5th failure, report every 30min.

---

## Tier 1 Review (Free/Local)

| Model | String | Context | Role | GPU RAM |
|-------|--------|---------|------|---------|
| **Gemma 4 26B A4B MoE** | `gemma4:26b` (Ollama) | 256K | Syntax/PEP8/lint/basic logic | ~15.6GB (Q4_0) |

### Specs (Confirmed April 2, 2026 Release)
| Attribute | Value |
|-----------|-------|
| **Total params** | 25.2B |
| **Active params** | 3.8B (MoE — fast inference) |
| **Context window** | 256K tokens |
| **License** | Apache 2.0 (commercially permissive) |
| **LiveCodeBench v6** | 77.1% |
| **AIME 2026** | 88.3% |
| **GPQA Diamond** | 82.3% |
| **Multimodal** | Text + Image |

### Optional Upgrade: Gemma 4 31B Dense
| Attribute | Value |
|-----------|-------|
| **Total params** | 30.7B dense |
| **Context window** | 256K tokens |
| **LiveCodeBench v6** | 80.0% |
| **GPU RAM** | ~17.4GB (Q4_0) |
| **Use** | If 26B quality insufficient; ~3% better coding |

### Ollama Setup
```bash
ollama pull gemma4:26b
# Optional upgrade:
# ollama pull gemma4:31b
```

---

## Runtime Task Routing

### Simple Tasks (<2s)
| Model | String | Role |
|-------|--------|------|
| Kimi K2.7 | `moonshotai/moonshotai/kimi-k2.7` | Front-facing primary |
| MiniMax M3 | NIM endpoint | Front-facing dual |

### Standard Tasks (<10s)
Same as Simple + AEGIS-99 mandatory >=0.85

### Coding Tasks (<30s)
| Priority | Model | String | Role |
|----------|-------|--------|------|
| HIGHEST | **GLM-5.2** | `z-ai/glm-5.2` | **Coding lead** |
| HIGH | GLM-5.1 | `z-ai/glm-5.1` | Coding lead (fallback) |
| HIGH | Qwen3.7-Max | `qwen3.7-max-preview` | Web/UI |
| CRITICAL | Claude Opus 4.8 | `claude-opus-4-8` | Client-facing |
| PARALLEL | Kimi K2.7 | `moonshotai/moonshotai/kimi-k2.7` | Long-context |
| SPECIAL | Mistral-small | NIM endpoint | Logic/multimodal |
| PARALLEL | MiMo-V2-Pro | `xiaomi/mimo-v2-pro` | Coding brain |

### Critical Tasks (minutes/hours)
ALL 9 build models + all supervisors + quantum + overseers. AEGIS >=0.90.

---

## NVIDIA NIM Free Models (Runtime Only)

| Model | Endpoint | Runtime Role |
|-------|----------|--------------|
| Nemotron 3 Ultra 550B | NIM | AEGIS architect (NEW — replaces Super) |
| Nemotron 3 Super 120B | NIM | AEGIS fallback (deprecated, use Ultra) |
| MiniMax M3 | NIM | Multimodal |
| **GLM-5.2** | NIM | **Coding brain (lead)** |
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

| Model/Source | Key Needed | Where |
|-------------|------------|-------|
| GPT-5.5 / GPT-5.5 Pro | OpenRouter API key | openrouter.ai |
| Kimi K2.7 | OpenRouter or Moonshot API key | openrouter.ai / moonshot.cn |
| DeepSeek V4-Pro | OpenRouter API key | openrouter.ai |
| MiniMax M3 | OpenRouter API key OR self-hosted weights | openrouter.ai / local |
| Claude Opus 4.8 | Vertex AI project ID | cloud.google.com |
| Claude Opus 4.6 | Vertex AI (primary) / AWS Bedrock (fallback) | cloud.google.com |
| **GLM-5.2** (GLM-5.1 fallback) | Z.ai API key | z.ai |
| Qwen3.7-Max-Preview | Alibaba Cloud Model Studio | alibabacloud.com |
| Nemotron 3 Ultra 550B | NVIDIA NIM free dev key | build.nvidia.com |
| D-Wave Leap | D-Wave account (free LaunchPad) | dwavesys.com |
| Gemma 4 26B | Ollama (local) | ollama.ai |

---

## Key Distinctions (Prevent Mix-Ups)

1. **MiniMax M3 vs M2.5**: M3 = build + runtime critical. M2.5 = runtime front-facing NIM fallback.
2. **Claude Opus 4.8 vs 4.6**: 4.8 = critical modules + supervisor. 4.6 = standard modules.
3. **Kimi K2.7**: Build cleanup (Pass 5) + runtime simple/standard front-facing + long-context coding.
4. **GLM-5.2 vs GLM-5.1 vs GLM-5 NIM**: GLM-5.2 = build + runtime coding lead (1.05M context). GLM-5.1 = coding fallback (192K). GLM-5 NIM = runtime NIM fallback only.
5. **Quantum**: D-Wave = PRIMARY (annealing, optimization). Origin = SECONDARY (gate-model, backup).
6. **Supervisors vs Overseers**: Supervisors (3) review code AFTER AEGIS-99. Overseers (2) monitor 24/7.
7. **GPT-5.5 Pro**: EXTREME fallback only (~5% usage). Ashandy approval required.

---

---

## Major Model Upgrades (June 2026)

### Nemotron 3 Ultra 550B (June 4, 2026) — UPGRADE APPLIED

| Spec | Nemotron 3 Super (OLD) | Nemotron 3 Ultra (NEW) |
|------|----------------------|----------------------|
| Parameters | 120B | **550B (55B active MoE)** |
| Context | 1M | **1M** |
| Speed | ~100 t/s | **300+ t/s** |
| Intelligence Index | 36 | **48 (#1 US open)** |
| License | Nemotron Open | **OpenMDW 1.1 (Linux Foundation)** |
| Weights | Open | **Fully open on Hugging Face** |
| Training data | Partial | **Published (2.5T tokens)** |
| Architecture | Transformer | **Hybrid Mamba-Attention + LatentMoE + MTP** |
| Cost | FREE on NIM | **FREE on NIM** |

**FIONA Impact**: Replaces Super as AEGIS-99 architect primary (20% weight). Same weight, dramatically more capable. 300 t/s means faster consensus rounds. Agentic optimization = better multi-step reasoning. Open weights = future self-hosting option.

**API String**: `nvidia/nemotron-3-ultra-550b` (NIM)
**Also available**: OpenRouter, Hugging Face, ModelScope
**Action**: Test string on NIM during merge session. Update all references from Super to Ultra.

### MiniMax M3 Open Source (June 1, 2026) — UPGRADE APPLIED

| Spec | Previous M2.7 | MiniMax M3 (Now Open) |
|------|--------------|----------------------|
| Architecture | Standard | **MiniMax Sparse Attention (MSA)** |
| Context | 256K | **1M tokens** |
| Multimodal | No | **Native text + image + video** |
| Open weights | No | **YES (published ~10 days post-launch)** |
| SWE-Bench Pro | ~45% | **59.0%** |
| Terminal-Bench | ~50% | **66.0%** |
| Speed at 1M | Baseline | **9x prefill, 15x decode** |
| Cost | OpenRouter API | **API: $0.30/M in, $1.20/M out OR self-host: $0** |
| License | Proprietary | **Open weights (commercial conditions apply)** |

**FIONA Impact**: M3 was already locked in at 15% auditor weight. Open-source changes the economics. Self-hosting option for zero inference cost. Native multimodal enables image/video input for research Pass 3.

**API String**: `minimax/minimax-m3` (OpenRouter — unchanged)
**Self-host option**: Weights on Hugging Face → vLLM/SGLang on Lightning.ai
**Action**: Keep OpenRouter for build. Evaluate self-hosting Day 15-16 or runtime.

---

*See also: [[AEGIS-99 Consensus Engine]], [[Smart Routing]], [[Supervisor Configuration]], [[Overseer Configuration]], [[Universal Research Mandate]]*
