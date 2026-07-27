---
tags: [research, weights, voting, aegis-99, locked]
date-created: 2026-06-06
source: FIONA_v1.7_MERGE_BUILD_PLAN(1).txt + FIONA_v1.7_ARCHITECTURE_v4.1.txt
---

# Research Vote Weights

> **Higher-weight models have more say in what research gets used. Evidence-driven blending into MASTER BRIEF.**

---

## Research Consensus Weights

| Model | Research Weight | Reason |
|-------|----------------|--------|
| **Claude Opus 4.8** | 25% | Visual/debugging research depth |
| **GPT-5.6 Terra** | 25% | Adversarial research depth |
| **DeepSeek V4-Pro** | 20% | Code pattern research depth |
| **GLM-5.2** | **15%** | **Coding accuracy, library versions (lead)** |
| GLM-5.1 | 5% | Coding accuracy, library versions (fallback) |
| **Kimi K2.7** | 10% | Comprehensive multi-step scan |
| **Qwen3.7** | 3% | Web/UI specifics |
| **MiniMax M3** | 1% | Multimodal details |
| **Claude Opus 4.8** | 1% | Architecture patterns |

**Total: 100%**

---

## How Research Blending Works

### Example: Blender 5.2.0 LTS Adapter Research

| Model | Finding | Weight | Contribution |
|-------|---------|--------|--------------|
| Opus 4.8 | Visual API bug in headless mode (screenshot proof) | 25% | Visual validation |
| GPT-5.6 Terra | Security vulnerability in bpy autoexec | 25% | Security flag |
| V4-Pro | Community fix #47 on GitHub for same bug | 20% | Solution path |
| **GLM-5.2** | Python syntax confirmed, PEP8 compliant approach | **15%** | **Code quality (lead)** |
| GLM-5.1 | Python syntax confirmed, PEP8 compliant approach | 5% | Code quality (fallback) |
| Kimi K2.7 | Full bpy documentation context, version matrix | 10% | Documentation |
| Others | Minor details, edge cases | 5% | Supplementary |

### MASTER BRIEF = Blended output
- Highest-weight findings prioritized
- Visual bug (Opus 25%) + Security fix (GPT-5.6 Terra 25%) = top priority
- Community fix (V4-Pro 20%) = implementation path
- Code approach (**GLM-5.2 15%**, GLM-5.1 5%) = syntax standard
- Documentation (Kimi 10%) = context reference

---

## Weight Rationale

### Why Opus 4.8 and GPT-5.6 Terra at 25% each?
- Opus 4.8: Only model doing visual research (screenshots, UI workflows)
- GPT-5.6 Terra: Primary model for adversarial research (what breaks, edge cases)
- These are UNIQUE capabilities — no other model covers these angles

### Why V4-Pro at 20%?
- GitHub + Stack Overflow pattern matching is critical for implementation
- Community fixes often superior to documentation
- Code volume generator = sees more patterns

### Why GLM-5.2 at 15% (GLM-5.1 at 5% fallback)?
- Coding brain = knows what WILL work in production
- Library version accuracy prevents dependency hell
- PEP8 compliance = maintainable code

### Why Kimi at only 10%?
- Kimi is the GENERALIST — breadth, not depth
- Already doing pre-adapter research (separate from consensus)
- 10% = enough to ensure nothing major is missed

### Why others at 1-3%?
- Specialists for narrow domains
- Web/UI (Qwen), multimodal (MiniMax), architecture (Opus 4.8)
- Supplementary, not primary

---

## Weight Adjustment

Weights are **LOCKED** for build. Post-build, ASI-Evolve can analyze:
- Which models' research correlated with successful modules?
- Which models frequently flagged issues others missed?
- Adjust weights for v1.8 based on empirical performance

**Current weights based on**: Model capabilities + architecture role + research specialty uniqueness

---

*See also: [[Universal Research Mandate]], [[AEGIS-99 Consensus Engine]]*
