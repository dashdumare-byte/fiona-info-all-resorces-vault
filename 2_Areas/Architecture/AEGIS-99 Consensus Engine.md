---
tags: [architecture, aegis-99, consensus, quality-gate, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 1
---

# AEGIS-99 Consensus Engine

> **The quality gate that nothing passes without multi-model agreement.**
> Threshold: >=0.85 standard | >=0.90 critical | >=0.95 Module 68 / Security self-validation

---

## Final Weights (v4.1 — LOCKED)

| Role | Model | String / Endpoint | Weight |
|------|-------|-------------------|--------|
| Architect Primary | Nemotron 3 Ultra 550B | `nvidia/nemotron-3-ultra-550b` | 20% |
| Architect Co-Primary | GPT-5.6 Terra | `openai/gpt-5.6-terra` | 15% |
| Architect Co-Primary | DeepSeek V4-Pro | `deepseek-v4-pro` | 15% |
| Auditor 1 | MiniMax M3 | `minimax/minimax-m3` | 15% |
| Auditor 2 | Qwen3.7-Max-Preview | `qwen3.7-max-preview` | 10% |
| Safety Margin | Distributed across all | — | 10% |

**Total: 100%**

**Note:** MiniMax upgraded from M2.7 → M3 (June 2026). Qwen upgraded from 3.6 → 3.7 (May 2026).

---

## Scoring Thresholds

| Module Type | Threshold | Models Required | Research Consensus |
|-------------|-----------|-----------------|-------------------|
| Standard | >=0.85 | 8-model pool | >=0.90 |
| Critical | >=0.90 | 9-model pool | >=0.90 |
| Module 68 (B4D Grillz) | >=0.95 | 9-model + quantum audit | >=0.95 |
| Security self-validation | >=0.95 | 9-model + quantum audit | >=0.95 |
| Research phase | >=0.90 | Research vote weighted | >=0.90 |

---

## How It Works

### Code Generation Flow
1. All models in pool generate code independently
2. Each model submits its output + confidence score
3. AEGIS-99 weights each vote by the table above
4. Weighted average calculated
5. If score >= threshold → PASS, proceed to supervisors
6. If score < threshold → FAIL, red-flag, human review

### Research Consensus Flow
1. All 8 models research independently (see [[Universal Research Mandate]])
2. Each submits research brief with confidence
3. Research vote weights applied (see [[Research Vote Weights]])
4. If research consensus >=0.90 → compile MASTER BRIEF
5. If research consensus <0.90 → redo research, FacTool verification

---

## Research Vote Weights

| Model | Research Weight | Reason |
|-------|----------------|--------|
| Claude Opus 4.8 | 25% | Visual/debugging research |
| GPT-5.6 Terra | 25% | Adversarial depth |
| DeepSeek V4-Pro | 20% | Code pattern depth |
| **GLM-5.2** | 15% | **Coding accuracy (lead)** |
| GLM-5.1 | 5% | Coding accuracy (fallback) |
| Kimi K2.7 | 10% | Comprehensive scan |
| Qwen3.7 | 3% | Web/UI specifics |
| MiniMax M3 | 1% | Multimodal |
| Claude Opus 4.6 | 1% | Architecture |

---

## What Happens on FAIL

| Score Range | Action |
|-------------|--------|
| 0.80-0.84 | Re-run generation with adjusted prompts, cross-verification active |
| 0.70-0.79 | Full re-research, FacTool verification, expanded model pool |
| 0.60-0.69 | Ashandy notified, manual review required, cannot auto-proceed |
| <0.60 | Build PAUSED, escalate to Ashandy, investigate model failure |

---

## Integration Points

- **Step 4 of Build Flow**: AEGIS-99 gates all generated code
- **Step 0 (Research)**: AEGIS-99 scores research quality before generation
- **Tier 2 Review**: AEGIS-99 re-reviews all day's work every 20 hours
- **Runtime**: AEGIS-99 mandatory on all critical task outputs
- **Cursor Hard Gate**: Zero tests + zero lint + AEGIS PASS required

---

## Model-Specific Notes

- **Nemotron 3 Ultra 550B**: #1 US open-weight (Intelligence Index 48). 550B/55B active MoE. 300+ t/s. FREE on NIM. 1M context. Open weights on Hugging Face. Launched June 4, 2026. Replaces Nemotron 3 Super.
- **GPT-5.6 Terra**: OpenAI flagship, confirmed live on OpenRouter. Adversarial specialist.
- **DeepSeek V4-Pro**: 93.5% LiveCodeBench, 1.6T params, 1M context.
- **MiniMax M3**: Multimodal specialist (native image+video). MSA architecture. 1M context. 9x prefill/15x decode. Open-source weights June 1, 2026. Upgraded from M2.7 June 2026.
- **Qwen3.7-Max-Preview**: Web/UI specialist. Upgraded from 3.6 May 2026.

---

*See also: [[Model Roster]], [[Universal Research Mandate]], [[Build Flow]]*
