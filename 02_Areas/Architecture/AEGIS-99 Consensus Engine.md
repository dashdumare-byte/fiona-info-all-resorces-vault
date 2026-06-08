---
tags: [architecture, aegis-99, consensus, quality-gate, locked]
date-created: 2026-06-08
---

# AEGIS-99 Consensus Engine

> Threshold: >=0.85 standard | >=0.90 critical | >=0.95 Module 68

## Final Weights (v4.1 — LOCKED)

| Role | Model | String | Weight |
|------|-------|--------|--------|
| Architect Primary | Nemotron 3 Ultra 550B | nvidia/nemotron-3-ultra-550b | 20% |
| Architect Co-Primary | GPT-5.5 | openai/gpt-5.5 | 15% |
| Architect Co-Primary | DeepSeek V4-Pro | deepseek-v4-pro | 15% |
| Quantum Layer | D-Wave Leap | d-wave-leap-api | 15% |
| Auditor 1 | MiniMax M3 | minimax/minimax-m3 | 15% |
| Auditor 2 | Qwen3.7-Max-Preview | qwen3.7-max-preview | 10% |
| Safety Margin | Distributed across all | — | 10% |

## Key Upgrades
- Nemotron 3 Ultra 550B (June 4, 2026): 550B/55B active MoE, 300+ t/s, Intelligence Index 48 (#1 US open), OpenMDW 1.1 license, open weights on Hugging Face
- MiniMax M3 open-source (June 1, 2026): Native image+video input, 1M context, MSA 9x/15x speed
