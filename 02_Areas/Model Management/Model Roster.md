---
tags: [models, roster, api-strings, locked, reference]
date-created: 2026-06-08
---

# Model Roster

## AEGIS-99 Consensus

| Model | String | Weight | Role |
|-------|--------|--------|------|
| Nemotron 3 Ultra 550B | nvidia/nemotron-3-ultra-550b | 20% | Architect Primary |
| GPT-5.5 | openai/gpt-5.5 | 15% | Architect Co-Primary |
| DeepSeek V4-Pro | deepseek-v4-pro | 15% | Architect Co-Primary |
| D-Wave Leap | d-wave-leap-api | 15% | Quantum |
| MiniMax M3 | minimax/minimax-m3 | 15% | Auditor 1 |
| Qwen3.7-Max-Preview | qwen3.7-max-preview | 10% | Auditor 2 |

## Critical Pool
Opus 4.8 (visual/arch) | GPT-5.5 (adversarial) | Qwen3.7 (web/UI) | MiniMax M3 (multimodal, image+video) | GLM-5.1 (coding brain) | Kimi K2.6 (comprehensive) | DeepSeek V4-Pro (raw gen) | D-Wave Quantum (strategy) | GPT-5.5 Pro (extreme fallback)

## Key Upgrades
- Nemotron 3 Ultra 550B: Replaces Super. 300 t/s, open weights, #1 US open. Launched June 4, 2026.
- MiniMax M3 open-source: Native image+video, 1M ctx, MSA 9x/15x. Launched June 1, 2026.

## Claude Fable 5 (June 9, 2026) — EXTREME FALLBACK ONLY

| Attribute | Value |
|-----------|-------|
| **Released** | June 9, 2026 |
| **Class** | Mythos-class (above Opus) |
| **SWE-Bench Pro** | 80.3% (vs Opus 4.8's 69.2%) |
| **Context** | 1M tokens |
| **Cost** | $10/M input, $50/M output |
| **API String** | claude-fable-5 |

### Claude Smart Routing (UPDATED)
| Task Difficulty | Model |
|-----------------|-------|
| LOW | Sonnet 4.6 |
| HIGH | Opus 4.6 |
| EXTREME CRITICAL | Opus 4.8 |
| **BEYOND EXTREME** | **Fable 5** |

### Fable 5 Activation
- >10 files involved
- Multi-DCC pipeline
- AEGIS borderline 0.82-0.84
- Security T3+
- Client project >$5K
- Ashandy explicit request
- All other models failed

### Activation Protocol
Same as GPT-5.5 Pro: Ask Ashandy "Approve Fable 5?" → Yes/No/Explain
