---
tags: [review, tier-1, tier-2, quality, 20-hour-cycle, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 6
---

# Tier 1 & 2 Review

> **Two-layer quality assurance. Tier 1: free, every build day. Tier 2: frontier models, every 20 hours.**

---

## Tier 1 (Free/Local — After Every Build Day)

### Tools
| Tool | Purpose |
|------|---------|
| **Aider** | Terminal-based AI pair programming |
| **Ollama** | Local model runner |
| **Gemma 4 26B A4B MoE** | Syntax/PEP8/basic logic cleanup |
| **Pylint** | Lint checking (>=8.0 threshold) |
| **mypy** | Type checking |
| **bandit** | Security vulnerability scanning |
| **radon** | Code complexity analysis |
| **pytest** | Unit test execution |

### Specs (Confirmed)
- **Model**: Gemma 4 26B A4B MoE (released April 2, 2026)
- **Context**: 256K tokens
- **LiveCodeBench**: 77.1%
- **License**: Apache 2.0
- **VRAM**: ~15.6GB with Q4_0 quantization
- Optional upgrade: 31B Dense (80.0% LiveCodeBench, ~17.4GB)

### Cost
- **FREE** — all local or free tier
- Runs on Lightning.ai hardware

### When
- After every build day
- ~4 hours of automated grinding
- Does NOT block build progression (runs in parallel)

### Scope
- All code generated that day
- Syntax, style, basic logic, security scan
- Test execution (if tests exist)

---

## Tier 2 (Paid/Frontier — Every 20 Hours)

### Models
| Model | Role |
|-------|------|
| **DeepSeek V4-Pro** | Deep code pattern + community fix analysis |
| **GLM-5.2** | **Deep architectural review (primary)** |
| GLM-5.1 | Deep architectural review (fallback) |
| **AEGIS-99** | Full consensus re-review of all day's work |
| **Leanstral** | Formal proof verification |
| **Nemotron 3 Ultra 550B** | 1M context batch review of all day's work |

### Schedule
```
Cron: 0 */20 * * *
```
Every 20 hours via OpenClaw cron.

### Cost
- ~$3-8 per cycle
- ~$10-15 total across 16-day build

### Scope
- ALL code from the past 20 hours
- Architectural review (not just syntax)
- Community fix cross-reference
- Formal proof re-verification
- 1M context holistic review (Nemotron)

---

## Comparison

| Attribute | Tier 1 | Tier 2 |
|-----------|--------|--------|
| **Cost** | Free | ~$3-8/cycle |
| **Frequency** | Every build day | Every 20 hours |
| **Models** | Gemma 4 (local) | V4-Pro, **GLM-5.2**, GLM-5.1, Nemotron, Leanstral |
| **Focus** | Syntax, style, basic logic | Architecture, patterns, proofs |
| **Blocking** | No | No |
| **Timeout** | 4 hours | 20-hour cycle |

---

## Integration with Build Flow

- **Step 6 [Reserved]**: Tier 1 triggers here
- **Post-Step 8**: Tier 2 runs on shipped modules
- **Lessons learned**: Both tiers feed into lessons.md
- **Supabase**: All review results logged

---

*See also: [[Build Flow]], [[Cursor Hard Gate]], [[Model Roster]]*
