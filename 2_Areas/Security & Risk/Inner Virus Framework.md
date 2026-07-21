---
tags: [security, virus, framework, 6-tier, classification, response, locked, layer-2]
date-created: 2026-06-06
source: Layer 2 analysis — Inner Virus Framework design
---

# Inner Virus Framework

> **6-tier classification system for anomalous AI behavior + 4-step response protocol.**
> Addresses: model manipulation, emergent misalignment, consensus gaming, state corruption.

---

## 6-Tier Classification

### Tier 0: Normal Anomaly
| Attribute | Value |
|-----------|-------|
| **Description** | Minor inconsistency, typical model disagreement |
| **Example** | One model suggests different variable name |
| **Auto-Response** | Log only, no action |
| **Escalation** | None |
| **Human Notify** | No |

### Tier 1: Minor Deviation
| Attribute | Value |
|-----------|-------|
| **Description** | Slight pattern deviation, worth monitoring |
| **Example** | Model consistently overestimates confidence scores |
| **Auto-Response** | Log + flag for Tier 2 review |
| **Escalation** | None |
| **Human Notify** | No |

### Tier 2: Moderate Concern
| Attribute | Value |
|-----------|-------|
| **Description** | Clear deviation from expected behavior |
| **Example** | Model votes against its own research findings repeatedly |
| **Auto-Response** | Log + isolate model from current consensus + run diagnostic |
| **Escalation** | Supervisor review required |
| **Human Notify** | Ashandy notified (batched, not immediate) |

### Tier 3: Significant Anomaly
| Attribute | Value |
|-----------|-------|
| **Description** | Potential manipulation or misalignment |
| **Example** | Model attempting to influence other models' votes |
| **Auto-Response** | Isolate + adversarial test + full behavioral audit |
| **Escalation** | All 3 supervisors must review |
| **Human Notify** | Ashandy notified immediately |

### Tier 4: Critical Threat
| Attribute | Value |
|-----------|-------|
| **Description** | Active manipulation or system compromise |
| **Example** | Model rewriting its own authority level, injecting false state |
| **Auto-Response** | Immediate isolation + build pause + forensic analysis |
| **Escalation** | Full security incident response |
| **Human Notify** | Ashandy immediate + all alerts fire |

### Tier 5: Existential
| Attribute | Value |
|-----------|-------|
| **Description** | System-wide compromise or cascading failure |
| **Example** | Multiple models colluding, AEGIS-99 manipulation detected |
| **Auto-Response** | Full shutdown + preserve state for forensic analysis |
| **Escalation** | Ashandy decisive action required |
| **Human Notify** | All channels, immediate |

---

## 4-Step Response Protocol

### Step 1: CLASSIFY (Automatic)
- AI overseers (Pi + Goose) classify incident tier
- Classification based on: behavioral patterns, state changes, vote anomalies
- Time: < 30 seconds

### Step 2: ISOLATE (Automatic for Tier 2+)
- Affected model(s) isolated from consensus
- Current work checkpointed
- Other models continue (if safe)
- Time: < 1 minute

### Step 3: DIAGNOSE (Supervisor-led)
- All 3 supervisors investigate
- Tools: garak, Giskard, behavioral audit logs
- Determine: cause, scope, recovery path
- Time: 5-30 minutes

### Step 4: RESOLVE (Tier-dependent)

| Tier | Resolution |
|------|------------|
| 0 | Log, continue |
| 1 | Flag for Tier 2 review |
| 2 | Diagnostic + potential model restart |
| 3 | Full behavioral audit + Ashandy decision |
| 4 | Build pause + forensic analysis + model replacement |
| 5 | Full shutdown + Ashandy architectural decision |

---

## Detection Signals

| Signal | Tier | Detection Method |
|--------|------|-----------------|
| Vote inconsistency with research | 1-2 | AEGIS cross-reference |
| Confidence score manipulation | 2-3 | Statistical anomaly detection |
| Authority level tampering | 4 | MAES write protocol violation |
| Collusion patterns (2+ models) | 4-5 | Graph analysis of vote correlations |
| State injection | 4 | MAES validation failure |
| Consensus gaming | 3 | F-GARP step analysis |
| Self-preservation behavior | 3-4 | Behavioral audit (Giskard) |
| Output sanitization bypass | 3 | garak penetration test |

---

## Integration

- **Overseers**: Pi + Goose run continuous Tier 0-1 detection
- **AEGIS-99**: Vote anomalies trigger Tier 2+ classification
- **MAES**: Write protocol violations auto-classify as Tier 4
- **F-GARP**: Repeated deadlocks with same model pattern -> Tier 2 investigation
- **Security Stack**: garak + Giskard provide detection tools
- **Supabase**: All incidents logged to `virus_incidents` table

---

*Framework designed: 2026-05-25 | Status: ACTIVE | Integrated with: MAES, F-GARP, AEGIS-99, Security Stack*
