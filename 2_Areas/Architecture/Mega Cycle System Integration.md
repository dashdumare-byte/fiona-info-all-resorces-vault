---
tags: [mega-cycle, autonomous, loop, feedback, memories, locked]
date-created: 2026-07-22
source: mega-cycle-system (uploaded files)
---

# Mega Cycle System — Full Integration (Option A)

> **60-second autonomous agent loop with 21 feedback memories.**
> **Prevents drift to micro-patches, silent skipping, and diagnostic failure.**
> **Integration: Option A (Full) — Approved**

---

## What It Is

The Mega Cycle System is a production-hardened autonomous agent loop pattern. It forces AI agents to:
- **Think before acting** (diagnostic-first discipline)
- **Escalate appropriately** (6-rung depth ladder)
- **Ship or admit failure** (must-ship protocol)
- **Learn from every cycle** (self-evolution)

**Proven:** 50+ tasks per cycle, battle-tested in production environments.

---

## 4 Slash Commands

| Command | When Used | FIONA Integration |
|---------|-----------|-------------------|
| `/mega-cycle` | Start of every autonomous session | Overnight mode entry point |
| `/depth-check` | Before committing any module | Pre-commit quality gate |
| `/evolve` | Weekly (Sunday) | Sovereign Protocol self-improvement |
| `/schedule-task` | When deferring work | Task queue for future cycles |

---

## 6-Rung Depth Ladder

Every fix must explicitly declare its depth:

| Rung | Name | When Appropriate | Example |
|------|------|-----------------|---------|
| 1 | **Surface fix** | Quick patch, time-critical | Hotfix for client demo |
| 2 | **Diagnostic + fix** | Unknown cause, investigate | Debug failing test |
| 3 | **Root cause** | Recurring issue, understand why | Refactor after 3rd similar bug |
| 4 | **Structural refactor** | Pattern across codebase | Extract repeated logic to shared module |
| 5 | **System audit** | Multiple subsystems affected | Review all DCC adapters for same flaw |
| 6 | **Foundation rebuild** | Core architecture insufficient | Replace entire routing system |

**Rule:** If stuck at same rung for >3 cycles, escalate to next rung automatically.

---

## 21 Feedback Memories (Integrated into L2 Context)

### Category 1: Core Loop Discipline (5 memories)

| # | Memory | FIONA Application |
|---|--------|-------------------|
| 1 | **Wakeup cadence** — Agent wakes every 60s to check progress | Overnight autonomous mode heartbeat |
| 2 | **Continuous awareness** — Agent maintains running state log | Module 64 (Self-Diagnostics) state tracking |
| 3 | **Must-ship** — Every cycle must produce a deliverable or explicit failure | Pre-commit gate: code or documented reason |
| 4 | **Self-evolve** — Agent improves its own process each cycle | Weekly `/evolve` run, updates this document |
| 5 | **Action law** — Every action must have observable consequence | All module outputs must be testable/verifiable |
| 5b | **Trap door** — Continuous auto-fix loop: detect → sandbox fix → verify → deliver | [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]]: overseers detect, all models fix in sandboxes, referee loop enforces |

### Category 2: Diagnosis Discipline (3 memories)

| # | Memory | FIONA Application |
|---|--------|-------------------|
| 6 | **Diagnostic-first** — Diagnose before remediate, always | F-GARP Step 1: evidence before action |
| 7 | **Compounds** — Small unchecked errors compound exponentially | Tier 1 & 2 Review catches micro-drift |
| 8 | **Root-cause-before-remediate** — Never fix symptoms alone | 6-rung depth ladder enforces this |

### Category 3: Anti-Patterns (3 memories)

| # | Memory | FIONA Application |
|---|--------|-------------------|
| 9 | **Silent-skip pattern** — Agent pretends to complete task | Pre-commit depth-check catches this |
| 10 | **Speculative-write** — Agent guesses fix without verification | OpenShell sandbox requires verification |
| 11 | **Incremental-save** — Agent saves partial work as complete | Atomic write discipline: all-or-nothing commits |

### Category 4: Infrastructure (4 memories)

| # | Memory | FIONA Application |
|---|--------|-------------------|
| 12 | **Atomic writes** — Shared state changes are atomic | Supabase transactions for all state changes |
| 13 | **Pressure gates** — Skip heavy tasks when RAM >90% | SENTRY resource monitoring |
| 14 | **Failure-cache tiering** — Cache failure modes to avoid repetition | Chroma failure pattern storage |
| 15 | **Exit-code discipline** — Every script returns meaningful exit code | All module scripts return 0/1/2/3 |

### Category 5: Infrastructure Extended (4 more)

| # | Memory | FIONA Application |
|---|--------|-------------------|
| 16 | **Enrichment two-stage** — Enrich data in two passes, not one | Research Mandate: scan then synthesize |
| 17 | **Exit-code signal discipline** — Use signals for inter-process communication | Overseer (Pi + Goose) signal protocol |
| 18 | **Cycle min duration** — Minimum 60s per cycle, no rushing | Build timeline enforces this |
| 19 | **Wakeup cadence (refined)** — Exponential backoff on repeated failures | F-GARP exponential backoff |

### Category 6: Operator Authority (1 memory + 2 bonus)

| # | Memory | FIONA Application |
|---|--------|-------------------|
| 20 | **Stop-asking-forever** — Agent never asks user unless explicitly instructed | Sovereign Protocol: autonomous by default |
| 21 | **To-operator template** — Structured handoff when human needed | F-GARP Step 8: human escalation format |

---

## Integration Points

### 1. Overnight Autonomous Mode (`/mega-cycle`)

```
Every 60 seconds:
1. Check current task progress
2. Run /depth-check on last action
3. If depth < required: escalate on 6-rung ladder
4. Execute next action
5. Log result to failure-cache
6. If RAM >90%: trigger pressure gate (defer heavy tasks)
7. Repeat
```

### 1b. Nemotron 8AM Research Cron (Build Phase)

```
Daily at 8:00 AM:
1. Nemotron 3 Ultra 550B reads MEMORY.md current state
2. Scans memory/modules/ for build progress
3. Identifies next unbuilt module in dependency order
4. Runs deep research pass on that module:
   - Library versions, API changes, breaking changes
   - Similar implementations in FIONA's existing modules
   - Security considerations
   - DCC integration requirements (if applicable)
5. Writes research brief to memory/YYYY-MM-DD.md
6. Signals Orchestrator: "Research complete for Module X"
```

**Trigger:** Cron (`0 8 * * *`) during build phase (Days 1-30)
**Cost:** ~$0.50/day (Nemotron L1 free via NIM credits)
**Output:** Daily research briefs pre-loaded before work begins

### 2. Pre-Commit Quality Gate (`/depth-check`)

Before any module commit:
```
1. Run 6-rung depth check on all changes
2. Verify no silent-skip patterns
3. Confirm atomic writes (all files committed together)
4. Check exit codes from all test scripts
5. Only then: allow commit
```

### 3. Weekly Self-Evolution (`/evolve`)

Every Sunday (after L3 deep embedding):
```
1. Review all cycle logs from past week
2. Identify recurring failure patterns
3. Update feedback memories based on new learnings
4. Adjust depth ladder thresholds if needed
5. Log evolution changes to this document
```

### 4. Sovereign Protocol Enhancement

The 21 feedback memories become part of FIONA's **L2 Context Memory**:
- Loaded into every model's context window at session start
- Read-only — models can reference but not modify
- Updated only via `/evolve` command (Ashandy approval)

---

## Hardware Requirements

| Component | Requirement |
|-----------|-------------|
| Cycle timer | 60s interval, minimal CPU |
| State log | Append-only JSONL, ~1KB/cycle |
| Failure cache | Chroma collection, ~10MB total |
| Depth check | CPU-only, <100ms |

**Total overhead:** <1% CPU, ~10MB storage

---

## Cost Impact

| Item | Cost |
|------|------|
| Mega Cycle System | **$0** (open-source pattern) |
| State logging | Negligible (JSONL append) |
| Failure cache storage | ~10MB in Chroma |
| **Total** | **$0** |

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Full integration (Option A) approved |
| 2026-07-22 | 21 feedback memories mapped to FIONA modules |

---

## Key Distinctions

1. **Mega Cycle is NOT a replacement for F-GARP** — it complements it. F-GARP handles deadlocks. Mega Cycle prevents drift.
2. **21 memories are read-only** — models reference them but cannot modify. Only `/evolve` updates them.
3. **6-rung ladder is mandatory** — every fix must declare its rung. No undeclared surface fixes.
4. **60s cycle is minimum** — not maximum. Complex tasks can take multiple cycles.
5. **Pressure gates protect Lightning.ai** — RAM >90% means defer, not crash.

---

## Related Files
- [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]] — Trap door = Memory #5b (continuous auto-fix)
- [[Loop Engineering — Master Framework]] — 6 building blocks that power the Mega Cycle
- [[F-GARP - Deadlock Recovery]] — Complements Mega Cycle (handles deadlocks vs drift)
- [[PULSE Token Efficiency Protocol]] — Makes 60s cycles affordable
- [[AEGIS-99 Consensus Engine]] — The gate that validates every cycle's output
- [[Overseer Configuration]] — Pi + Goose execute the 60s wakeup cadence
