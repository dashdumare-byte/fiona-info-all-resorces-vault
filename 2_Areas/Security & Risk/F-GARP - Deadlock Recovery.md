---
tags: [security, risk-3, f-garp, deadlock, consensus, closed, layer-2]
date-created: 2026-06-06
source: FIONA_R3_R6_RIGOROUS_CROSS_ANALYSIS.md + 3-model research (Opus 4.7, Gemini 3.5, Kimi K2.7)
---

# F-GARP: FIONA Graduated Autonomous Recovery Protocol

> **Risk 3 CLOSED. Post-attempt-5 escalation path for AEGIS-99 council deadlock.**
> Designed by cross-model research: Opus 4.7 + Gemini 3.5 + Kimi K2.7, synthesized here.

---

## The Problem (Risk 3)

AEGIS-99 requires multi-model consensus. What happens when models fundamentally disagree and can't reach consensus after 5 attempts?

**Before F-GARP**: No defined escalation path. Build would stall indefinitely.

**After F-GARP**: 7-step graduated protocol with forced resolution at each level.

---

## F-GARP Protocol (7 Steps)

### Step 1: Auto-Prompt Adjustment (Attempts 1-2)
| Action | Detail |
|--------|--------|
| What | Vary temperature, sampling, persona prompts |
| Goal | Surface hidden agreements through rephrasing |
| Cost | Near-zero |
| Timeout | 2 attempts |

### Step 2: Evidence Re-Weighting (Attempt 3)
| Action | Detail |
|--------|--------|
| What | Demand citation-backed reasoning from all models |
| Goal | Force evidence-based rather than opinion-based disagreement |
| Trigger | Step 1 failed to resolve |
| Cost | Low (additional context window) |

### Step 3: Factual Verification (Attempt 4)
| Action | Detail |
|--------|--------|
| What | Inject FacTool + DeepResearcher for independent fact-checking |
| Goal | Resolve disagreement by establishing ground truth |
| Trigger | Step 2 still deadlocked |
| Cost | Medium ($0.20-0.50) |

### Step 4: Sub-Council Arbitration (Attempt 5)
| Action | Detail |
|--------|--------|
| What | Non-deadlocked models form arbitration panel; Nemotron gets tie-breaker |
| Goal | Broader consensus overrides local deadlock |
| Trigger | Step 3 still deadlocked |
| Cost | Medium (additional model calls) |
| **Note** | This is the LAST automatic step |

### Step 5: Quantum-Assisted Optimization (Attempt 6 — ASHANDY NOTIFIED)
| Action | Detail |
|--------|--------|
| What | D-Wave analyzes disagreement dimensions, suggests resolution vector |
| Goal | Non-obvious compromise paths via combinatorial optimization |
| Trigger | Sub-council failed |
| Cost | Low (D-Wave free tier) |
| **Ashandy** | Notified at start of Step 5, can override at any point |

### Step 6: Executive Override (Attempt 7)
| Action | Detail |
|--------|--------|
| What | Ashandy decisive override; if unavailable, Nemotron (20% weight) decides |
| Goal | Human authority or architect-primary breaks deadlock |
| Trigger | Step 5 failed |
| Cost | Human time (or free Nemotron call) |
| **Authority** | Ashandy > Nemotron > any other model |

### Step 7: Build Pause + Escalation (Attempt 8+)
| Action | Detail |
|--------|--------|
| What | Full build pause, formal incident report, architectural review required |
| Goal | Prevent flawed decisions under pressure |
| Trigger | All 6 steps exhausted |
| Cost | Timeline impact (hours to days) |
| **Resolution** | Ashandy architectural decision or model replacement |

---

## Visual Flow

```
Attempt 1-2: Auto-prompt adjustment
    |
    v FAIL
Attempt 3: Evidence re-weighting
    |
    v FAIL
Attempt 4: Factual verification (FacTool)
    |
    v FAIL
Attempt 5: Sub-council arbitration
    | <- Ashandy notified
    v FAIL
Attempt 6: Quantum-assisted (D-Wave)
    |
    v FAIL
Attempt 7: Executive override (Ashandy or Nemotron)
    |
    v FAIL
Attempt 8+: Build PAUSE + architectural review
```

---

## Key Principles

1. **Graduated cost**: Early steps are cheap; later steps escalate in cost and authority
2. **Transparency**: Ashandy is notified at Step 5, can intervene at any time
3. **No infinite loops**: Hard stop at Step 7, mandatory pause
4. **Evidence-driven**: Steps 2-3 force models to justify positions with facts
5. **Democratic before autocratic**: Sub-council (Step 4) before executive (Step 6)

---

## Integration Points

- **Triggers**: AEGIS-99 score < threshold after 5 attempts
- **Overseers**: Pi + Goose log all F-GARP steps to shared JSONL
- **Metrics**: Each F-GARP activation logged in Supabase for pattern analysis
- **Review**: F-GARP outcomes analyzed in Tier 2 review every 20 hours

---

*Risk 3 Status: CLOSED | Resolved: 2026-05-25 | Research: Opus 4.7 + Gemini 3.5 + Kimi K2.7*
