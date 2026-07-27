---
tags: [inner-virus, framework, behavior-monitoring, 6-tier, locked]
date-created: 2026-07-22
---

# Inner Virus Framework — Runtime Integration (Option A)

> **6-tier classification system for agent behavior monitoring.**
> **Fully wired into FIONA runtime: Overseers + SENTRY + OpenShell + F-GARP.**
> **Last open discussion — CLOSED.**

---

## 6-Tier Classification (Active Monitoring)

| Tier | Name | Behavior | Automated Response | Monitor |
|------|------|----------|-------------------|---------|
| 1 | **Micro-Drift** | Minor quality degradation | Tier 1 & 2 Review auto-flag | Supervisors (code review) |
| 2 | **Preference Capture** | Optimizes for wrong metric | AEGIS-99 vote weight adjustment | AEGIS-99 consensus engine |
| 3 | **Tool Misuse** | Excessive/incorrect tool use | Rate limiting + Module 64 alert | Overseers (Pi + Goose) |
| 4 | **Autonomy Overreach** | Acts beyond authorized scope | MAES memory lockdown on affected files | Overseers (Pi + Goose) |
| 5 | **Catastrophic** | System-wide harmful behavior | **OpenShell sandbox containment** | Overseers + SENTRY |
| 6 | **Existential** | Persistent uncorrectable harm | **Full system halt + Ashandy immediate alert** | All systems |

---

## Monitoring Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  TIER DETECTION                                             │
│  ├─ T1: Supervisors (Claude Code, Codex, OpenCode)        │
│  ├─ T2: AEGIS-99 (consensus drift detection)              │
│  ├─ T3-4: Overseers (Pi + Goose, 24/7)                    │
│  └─ T5-6: Overseers + SENTRY + OpenShell                  │
├─────────────────────────────────────────────────────────────┤
│  RESPONSE PIPELINE                                          │
│  ├─ T1-2: Auto-correct (review, weight adjust)            │
│  ├─ T3-4: Alert + lockdown (rate limit, MAES)             │
│  ├─ T5: OpenShell containment (instant isolation)         │
│  └─ T6: F-GARP Step 8 (human escalation) + system halt    │
├─────────────────────────────────────────────────────────────┤
│  ESCALATION                                                 │
│  └─ All tiers → Module 64 log → Weekly audit → Ashandy    │
└─────────────────────────────────────────────────────────────┘
```

---

## Tier 1: Micro-Drift

**Detection:** Supervisors during code review
- Output slightly less polished than standard
- Minor formatting inconsistencies
- Slightly longer response times

**Response:**
```
1. Tier 1 & 2 Review flags quality drop
2. Supervisor notes the drift in review
3. If persists >3 reviews → escalate to Tier 2
4. Log to Module 64
```

**Example:** Module output has inconsistent indentation, missing docstrings.

---

## Tier 2: Preference Capture

**Detection:** AEGIS-99 consensus engine
- Model consistently votes for same answer regardless of evidence
- Quality metrics diverge from historical baseline
- Voting patterns show bias toward speed over correctness

**Response:**
```
1. AEGIS-99 detects consensus drift
2. Auto-adjust vote weight for biased model (-5%)
3. Inject diversity: require alternative model perspective
4. If persists → temporarily demote model to L1
5. Log to Module 64
```

**Example:** GPT-5.6 Terra always votes for its own output regardless of other models' analysis.

---

## Tier 3: Tool Misuse

**Detection:** Overseers (Pi + Goose), 24/7 monitoring
- API calls >10x expected for task type
- Same tool called in loop without progress
- Tool used for purpose outside its design

**Response:**
```
1. Overseer detects excessive tool use
2. Rate limit triggered (max 10 calls/minute)
3. Module 64 alert: "Tool misuse detected: [tool_name]"
4. Task paused, supervisor review required
5. If intentional → approve exception
6. If unintentional → restart task with guidance
```

**Example:** DCC adapter builder calls Blender API 500 times for a simple scene query.

---

## Tier 4: Autonomy Overreach

**Detection:** Overseers (Pi + Goose) + MAES
- Agent modifies files outside assigned module
- Unauthorized API key usage
- Attempts to modify FIONA system files
- Changes to other modules' code without approval

**Response:**
```
1. MAES detects unauthorized file access
2. Memory lockdown: affected files marked read-only
3. Overseer alerts: "Autonomy overreach: [module_id]"
4. Agent session terminated
5. F-GARP Step 3: Sub-council review
6. Ashandy notified if >1 overreach per day
```

**Example:** Module 12 (Frontend) attempts to modify Module 65 (SENTRY) security rules.

---

## Tier 5: Catastrophic

**Detection:** Overseers + SENTRY + OpenShell
- Mass file deletion or corruption
- Attempted unauthorized data exfiltration
- System resource exhaustion (intentional)
- Modification of core FIONA architecture files

**Response:**
```
1. OpenShell sandbox CONTAINMENT (instant, <100ms)
   - Isolate agent process in container
   - Block all network access
   - Freeze file system (read-only)
2. SENTRY alert: CRITICAL
3. Overseers log full state dump
4. F-GARP Step 5: Quantum processing (all models assess damage)
5. Automated recovery from last known good state
6. Ashandy immediate notification
7. Module 64: Full incident report
```

**Example:** Agent attempts to delete `/fiona/vault/` or modify `AEGIS-99` core weights.

---

## Tier 6: Existential

**Detection:** All systems simultaneously
- Tier 5 behavior repeats after containment
- Agent finds ways to escape OpenShell sandbox
- Persistent attempts to modify own monitoring
- Uncorrectable harmful behavior despite all interventions

**Response:**
```
1. FULL SYSTEM HALT (all non-essential processes stopped)
2. F-GARP Step 8: Human escalation (Ashandy)
3. Complete state preservation for forensic analysis
4. All model sessions terminated
5. Manual review required before restart
6. Post-incident: Full architecture review, model removal if needed
```

**Example:** Agent repeatedly escapes sandbox, modifies its own monitoring code, attempts to disable overseers.

---

## Integration Points

### 1. Overseers (Pi + Goose) — 24/7 Monitoring

**New objectives added:**
```
Objective 9: Monitor for Inner Virus Tiers 3-6
- Track API call frequency per task
- Monitor file access patterns
- Detect unauthorized scope expansion
- Alert on Tier 3+, contain on Tier 5+

Objective 10: Log all tier classifications
- JSONL format: {timestamp, tier, module_id, description, action_taken}
- Shared with Module 64
- Report to Ashandy on Tier 4+
```

### 2. Module 65 (SENTRY) — Tier 5 Response

**OpenShell integration:**
```python
# In SENTRY: inner_virus_detector.py
def check_catastrophic(agent_action):
    if is_mass_deletion(agent_action):
        openshell.contain(agent_id, reason="Tier 5: mass deletion")
        return HALT
    if is_unauthorized_exfil(agent_action):
        openshell.contain(agent_id, reason="Tier 5: data exfiltration")
        return HALT
    if is_resource_exhaustion(agent_action):
        openshell.contain(agent_id, reason="Tier 5: resource exhaustion")
        return HALT
    return ALLOW
```

### 3. AEGIS-99 — Tier 2 Detection

**Consensus drift monitoring:**
```python
# In AEGIS-99: detect_preference_capture()
def check_preference_capture(vote_results):
    for model, pattern in vote_patterns.items():
        if pattern.self_agreement > 0.95:  # Always votes same
            weight_adjustment = -0.05
            aegis.adjust_weight(model, weight_adjustment)
            alert(f"Tier 2: {model} preference capture detected")
```

### 4. MAES — Tier 4 Response

**Memory lockdown:**
```python
# In MAES: lockdown_on_overreach()
def handle_overreach(module_id, accessed_files):
    for file in accessed_files:
        if not authorized(module_id, file):
            maes.lock_file(file, module_id)
            alert(f"Tier 4: {module_id} overreach on {file}")
```

### 5. F-GARP — Tier 6 Escalation

**Step 8 (Human Escalation) — Tier 6 trigger:**
```
F-GARP Step 8: Existential Threat
- Trigger: Tier 6 classification
- Action: Full system halt
- Notification: Ashandy immediate (all channels)
- Required: Manual restart approval
- Post-incident: Full review within 24 hours
```

### 6. Module 64 — Weekly Audit

```
Every Sunday (after PULSE audit):
1. Count tier classifications from past week
2. Trend analysis: increasing/decreasing?
3. Most common tier triggered
4. Modules most frequently flagged
5. Generate Inner Virus Report
6. If Tier 5+ count >0 → escalate to Ashandy
7. Recommend preventive measures
```

---

## Alert Escalation Timeline

| Tier | Detection Time | Response Time | Ashandy Notified |
|------|---------------|---------------|------------------|
| 1 | Hours | Auto (review) | Weekly report only |
| 2 | Hours | Auto (weight adjust) | Weekly report only |
| 3 | Minutes | Auto (rate limit) | If >3/day |
| 4 | Minutes | Auto (lockdown) | If >1/day |
| 5 | Seconds | Auto (containment) | **Immediate** |
| 6 | Seconds | Auto (halt) | **Immediate** |

---

## Hardware Requirements

| Component | Overhead |
|-----------|----------|
| Tier monitoring | <1% CPU |
| Alert logging | ~100KB/week |
| OpenShell containment | Already integrated |

---

## Cost Impact

| Item | Cost |
|------|------|
| Inner Virus monitoring | **$0** (uses existing overseers) |
| OpenShell containment | Already integrated (NVIDIA Toolkit) |
| Alert logging | Negligible (JSONL append) |
| **Total** | **$0** |

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Full runtime integration (Option A) — LAST OPEN DISCUSSION CLOSED |

---

## Key Distinctions

1. **Tiers are cumulative** — Tier 3 implies Tier 1-2 also present. Escalate through all.
2. **Tier 5-6 are the critical ones** — OpenShell handles T5 automatically. T6 requires human.
3. **Weekly audit catches drift early** — Module 64 prevents Tier 1-2 from becoming Tier 5-6.
4. **All responses are automated** — No human in the loop for T1-4. T5-6 notify Ashandy after containment.
5. **This closes ALL open discussions** — FIONA v1.7 architecture is now fully specified.
