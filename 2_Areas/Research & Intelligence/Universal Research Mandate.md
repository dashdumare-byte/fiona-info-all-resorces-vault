---
tags: [research, mandate, universal, 8-models, locked]
date-created: 2026-06-06
source: FIONA_v1.7_UNIVERSAL_RESEARCH_MANDATE(1).txt
---

# Universal Research Mandate

> **ALL 8 models research independently before generating. Cross-verify against 2+ models. AEGIS-99 Research Consensus >=0.90 required.**

---

## The Problem It Solves

**Before**: Only Kimi + Nemotron researched. Other 6 models generated from stale training data + briefs they didn't write.

**Risks**: Hallucinated research briefs propagated to all models. Zero cross-verification. Single points of failure.

**After**: All 8 models research independently, cross-verify, FacTool verifies, AEGIS-99 scores research quality.

---

## Research Phase Flow

```
Module assigned
    |
    v
ALL 8 models research independently (parallel, 30-60min)
    |
    v
ALL 8 models cross-verify each other's findings
    |
    v
FacTool verifies factual claims
    |
    v
AEGIS-99 Research Consensus >=0.90?
    |
    +-- YES --> MASTER BRIEF compiled --> Code generation begins
    |
    +-- NO --> Redo research, Ashandy notified
```

---

## Model Research Focus

| Model | Research Focus | Primary Tools |
|-------|---------------|---------------|
| **Claude Opus 4.8** | Visual/debugging — screenshots, UI workflows, visual error patterns | Context7, Firecrawl |
| **Claude Opus 4.6** | Architecture — module structure, dependency chains, integration | GitNexus, pyan3 |
| **GPT-5.5** | Adversarial — what breaks, edge cases, security vulnerabilities | Tavily, Brave Search |
| **Qwen3.7** | Web/UI — frontend patterns, React/Vue components, responsive | Firecrawl, Markdownify |
| **MiniMax M3** | Multimodal — image/video/audio APIs, texture, materials. **Native image+video input** (open-source M3) enables visual research: screenshots, UI workflows, reference images | Exa, Brave Search |
| **GLM-5.2** | **Deep coding — Python/C++ patterns, library versions, PEP8 (lead)** | Context7, GitHub MCP |
| GLM-5.1 | Deep coding — Python/C++ patterns (fallback) | Context7, GitHub MCP |
| **Kimi K2.6** | Comprehensive — multi-step browse, web search, code interpreter | Tavily, Firecrawl |
| **DeepSeek V4-Pro** | Code patterns — GitHub repos, Stack Overflow, community fixes | GitHub MCP, Exa |

---

## Cross-Verification Rules

| Agreement Level | Confidence | Action |
|-----------------|------------|--------|
| 3+ models agree | HIGH | Use in generation |
| 2 agree, 1 disagrees | MEDIUM | Flag for Ashandy |
| All disagree | LOW | DeepResearcher investigates |
| Hallucination detected | CRITICAL | FacTool verifies, AEGIS-99 scores |

---

## Research Output Format (Standardized)

Every model MUST produce:

```markdown
#[MODULE NAME] Research Brief — [Model Name] — [Date]

## 1. API OVERVIEW (Context7 validated)
## 2. RECENT CHANGES (Tavily/Brave validated)
## 3. COMMON PATTERNS (GitHub MCP / Exa validated)
## 4. BEST PRACTICES (Semantic Scholar / Consensus validated)
## 5. KNOWN ISSUES (Exa / Brave validated)
## 6. INTEGRATION POINTS (GitNexus validated)
## 7. SECURITY CONSIDERATIONS (GPT-5.5 adversarial scan)
## 8. VISUAL/DEBUGGING NOTES (Opus 4.8 only)
## 9. RESEARCH CONFIDENCE SCORE (1-10)
## 10. CROSS-VERIFICATION NOTES (agreements/disagreements/flags)
```

---

## Cost Model

| Module Type | Research Cost | Models |
|-------------|--------------|--------|
| Standard | ~$1.50 | 4-model pool (Opus 4.6, GPT-5.5, **GLM-5.2**, GLM-5.1, Kimi) |
| Critical | ~$3.90 | 8-model full pool |
| Module 68 | ~$5.00+ | 8-model + Axplorer + Leanstral |

### Total Research Budget
- 50 standard x $1.50 = $75
- 19 critical x $3.90 = $74
- **Total: ~$149 (within $250-300 budget)**

---

## Time Per Module

| Phase | Time |
|-------|------|
| Independent research | 30-60 min (parallel across 8 models) |
| Cross-verification | 15-30 min |
| FacTool verification | 10-15 min |
| AEGIS consensus | 5-10 min |
| **Total overhead** | **~60-115 min per module** |
| **Daily average** | **4-8 hours research** |

---

*See also: [[Research Vote Weights]], [[AEGIS-99 Consensus Engine]], [[Build Flow]]*
