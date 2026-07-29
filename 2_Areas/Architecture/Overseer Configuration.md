---
tags: [architecture, overseers, pi, goose, monitoring, 24-7, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 5
---

# Overseer Configuration

> **Pi Agent + Goose: Dual 24/7 monitoring system. Light on simple tasks, full active on critical.**

---

## Dual System Overview

| Agent | Platform | Type | Strictness |
|-------|----------|------|------------|
| **Pi Agent** | Lightning.ai | Terminal-native | EXTREME |
| **Goose** | Lightning.ai | Desktop + terminal | EXTREME |

### Shared Objectives (8)
1. Monitor all module builds
2. Execute health checks
3. Run tests on code changes
4. Flag errors and anomalies
5. Attempt auto-fixes for known patterns (via [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture|Cursor trap door]] — all models in sandboxes)
6. Escalate on 5th failure to Ashandy
7. Log all activity to shared JSONL
8. Report status every 30 minutes

### OpenClaw Cron Automation (Build Phase)
```bash
openclaw cron add --cron "0 8 * * *" --message \
  "Read MEMORY.md, identify next unbuilt module, run Nemotron deep research pass, write to memory/YYYY-MM-DD.md"
```

**What OpenClaw does:**
- Daily 8AM: Reads current build state from MEMORY.md
- Identifies next module in dependency order
- Triggers Nemotron 3 Ultra 550B research pass
- Stores results in dated memory files
- Signals Orchestrator when research is complete

**Status:** Active during build phase (Days 1-30). Disabled post-build.
**See also:** [[Cron Automation — Build & Runtime Schedules]]

---

## Task-Level Monitoring

### Simple Tasks (Runtime)
| Attribute | Setting |
|-----------|---------|
| Monitoring | LIGHT only |
| Actions | Log only, no intervention |
| Cost | Near-zero (local compute) |
| Escalation | Only on critical error |

### Standard Tasks (Runtime)
| Attribute | Setting |
|-----------|---------|
| Monitoring | MODERATE |
| Actions | Log + basic health checks |
| Cost | Minimal |
| Escalation | On 3rd failure |

### Coding Tasks (Runtime)
| Attribute | Setting |
|-----------|---------|
| Monitoring | ACTIVE |
| Actions | Log + test execution + error flagging |
| Cost | Moderate |
| Escalation | On 2nd failure |

### Critical Tasks (Build + Runtime)
| Attribute | Setting |
|-----------|---------|
| Monitoring | FULL ACTIVE |
| Actions | Log + test + fix attempts + pause on critical + escalate |
| Cost | Higher (justified by criticality) |
| Escalation | On 1st critical failure or 5th retry |

---

## Ashandy Overrides

| Command | Effect |
|---------|--------|
| "Activate full overseers for this task" | Both Pi + Goose go full mode |
| "Deactivate overseers" | Light monitoring only (NOT recommended) |
| "Use Pi only" | Single overseer: Pi Agent |
| "Use Goose only" | Single overseer: Goose |

---

## Communication Protocol

- Both overseers write to **shared JSONL log**
- Pi Agent: Terminal-native commands, shell execution
- Goose: Desktop integration, can spawn subagents
- Conflict resolution: Escalate to Ashandy (no autonomous override of each other)
- Heartbeat: Every 30 minutes status report

---

## Escalation Chain

```
Module fails
    |
    v
Overseer attempts auto-fix (if known pattern)
    |
    v
Retry count >= 5?
    |
    +-- NO --> Continue monitoring
    |
    +-- YES --> ESCALATE to Ashandy
                + Notify via configured alert (Slack/Discord/email)
                + Include: module name, error log, retry count, fix attempts
                + PAUSE build (for critical modules)
```

---

*See also: [[Supervisor Configuration]], [[Task Routing]], [[F-GARP - Deadlock Recovery]]*
