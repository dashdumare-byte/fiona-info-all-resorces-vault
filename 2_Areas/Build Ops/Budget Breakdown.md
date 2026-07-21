---
tags: [budget, cost, build, runtime, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 14
---

# Budget Breakdown

> **Build: $300 (30 days, $10/day cap). Runtime: $200-250/month. Daily cap: $15.**

---

## Build Budget (16 Days)

| Category | Daily | Days | Total |
|----------|-------|------|-------|
| API calls (8 models + Pro occasional) | $6-10 | 16 | $96-160 |
| D-Wave Leap | $0 | 16 | $0 (LaunchPad 3-month free) |
| Temporal.io | $0-3 | 16 | $0-50 |
| Supabase | $0-1.5 | 16 | $0-25 |
| Research tools | $1.25 | 16 | ~$20 |
| Owl Alpha | $0 | 16 | $0 (free on OpenRouter) |
| **TOTAL BUILD** | | | **~$150-250** |

### Daily Cap Enforcement
- Hard limit: $10/day
- If approaching cap: switch to free tiers (NIM, Gemma 4 via Ollama)
- If cap exceeded: PAUSE, notify Ashandy, optimize before resume

---

## Runtime Budget (Monthly)

| Category | Monthly |
|----------|---------|
| API calls | $90-150 (~$3-5/day) |
| D-Wave Leap | $129 (after free trial) |
| Temporal.io | $0-50 |
| Supabase | $25 |
| **TOTAL RUNTIME** | **~$200-250/month** |

---

## Cost by Build Phase

| Phase | Days | Est. Daily | Est. Total |
|-------|------|------------|------------|
| Infrastructure (Days 1-3) | 3 | $10-12 | $30-36 |
| DCC Batch A (Days 4-5) | 2 | $12-15 | $24-30 |
| DCC Batch B (Days 6-7) | 2 | $12-15 | $24-30 |
| Integration (Day 8) | 1 | $8-10 | $8-10 |
| B4D Grillz (Day 9) | 1 | $15 (full cap) | $15 |
| Web App (Day 10) | 1 | $12-15 | $12-15 |
| Standard Modules (Days 11-14) | 4 | $6-8 | $24-32 |
| Integration + Deploy (Days 15-16) | 2 | $8-10 | $16-20 |
| **TOTAL** | **16** | | **$153-163** |

**Well within $250-300 budget. Comfortable margin for retries.**

---

## Free Tools (Zero Cost)

| Tool | Value |
|------|-------|
| Nemotron 3 Ultra 550B (NIM) | AEGIS architect primary — FREE |
| MiniMax M3 (NIM) | Multimodal — FREE |
| **GLM-5.2** (NIM) | **Coding brain (lead) — FREE** |
| GLM-5.1 (NIM) | Coding brain (fallback) — FREE |
| Gemma 4 26B (Ollama local) | Tier 1 review — FREE |
| Owl Alpha (OpenRouter) | Agentic orchestrator — FREE |
| D-Wave Leap | 3-month LaunchPad trial — FREE |
| Origin Pilot | Gate-model quantum — FREE |
| All security tools | Snyk, Semgrep, Trivy, garak, etc. — FREE tier |
| Langfuse | Open-source tracing — FREE (self-hosted) |
| FacTool, DeepResearcher | Research verification — FREE |

---

*See also: [[30-Day Build Timeline]], [[Honest Assessment]]*
