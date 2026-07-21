---
tags: [review, tier-1, tier-2, quality, 20-hour-cycle, locked]
date-created: 2026-06-08
---

# Tier 1 & 2 Review

> **Two-layer quality assurance. Tier 1: free, every build day. Tier 2: frontier models, every 20 hours.**

## Tier 1 (Free/Local -- After Every Build Day)

| Tool | Purpose |
|------|---------|
| **Gemma 4 26B A4B MoE** | Syntax/PEP8/basic logic cleanup |
| **Pylint** | Lint checking (>=8.0 threshold) |
| **mypy** | Type checking |
| **bandit** | Security vulnerability scanning |

### Specs (Confirmed)
- **Model**: Gemma 4 26B A4B MoE (released April 2, 2026)
- **Context**: 256K tokens
- **LiveCodeBench**: 77.1%
- **License**: Apache 2.0
- **VRAM**: ~15.6GB with Q4_0 quantization

### Cost: FREE

## Tier 2 (Paid/Frontier -- Every 20 Hours)

| Model | Role |
|-------|------|
| **Nemotron 3 Ultra 550B** | 1M context batch review of all day's work |
| **DeepSeek V4-Pro** | Deep code pattern + community fix analysis |
| **GLM-5.1** | Deep architectural review |
| **AEGIS-99** | Full consensus re-review |

### Cost: ~$3-8 per cycle
