---
tags: [architecture, workflow, temporal, orchestration, durable-execution, tracked]
date-created: 2026-07-28
source: NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 16 + NEW_STUFF_FROM_CORRECTED_ANALYSIS(1).txt
---

# Temporal.io — Workflow Orchestration

> **Durable workflow orchestration for FIONA's 30-day build and runtime. Survives crashes, retries failures, maintains state across sessions.**

---

## What Temporal.io Is

Temporal is an open-source durable execution platform. It guarantees that workflows complete — even if the underlying infrastructure crashes, restarts, or experiences network partitions.

**Key concept:** Workflows are code that can survive process restarts. If a workflow is running and the server crashes, Temporal resumes it exactly where it left off.

---

## FIONA Use Cases

### Build Phase (Days 1-30)

| Workflow | What It Orchestrates | Why Temporal Helps |
|----------|---------------------|-------------------|
| **30-Day Build Pipeline** | Sequences all 69 modules in dependency order | Crash during Day 12 → resumes at exact module on restart |
| **DCC Adapter Deployment** | 7 DCC adapters with interdependencies | Ensures Blender before DaVinci pipeline test, etc. |
| **AEGIS-99 Consensus** | Multi-model parallel research → consensus → gate | If 1 model fails, retry that model only, not all 8 |
| **Overnight Research** | Nemotron 8AM cron + DeepResearcher + brief compilation | Survives overnight server maintenance |

### Runtime (Post-Build)

| Workflow | What It Orchestrates | Why Temporal Helps |
|----------|---------------------|-------------------|
| **Client Project Pipeline** | Intake → creative → review → delivery | Client project survives weeks with pauses/reviews |
| **Mega Cycle System** | 60s heartbeat across 21 feedback memories | If overseer crashes, cycle resumes without data loss |
| **Trap Door Auto-Fix** | Detect → sandbox fix → verify → deliver | Retry failed fixes with exponential backoff |
| **Weekly Self-Evolution** (`/evolve`) | Review → identify patterns → update memories | Long-running analysis survives interruptions |

---

## How It Works

```
Traditional Cron/Script:
  Script runs → crashes at Step 7 → restart from beginning → Steps 1-6 re-run (waste)

Temporal Workflow:
  Workflow runs → crashes at Step 7 → Temporal resumes at Step 7 → Steps 1-6 already completed
```

**Durable execution means:**
- Every step result is persisted before moving to next step
- Workflow state is checkpointed automatically
- Activities (external calls) are retried with configurable backoff
- Workflows can sleep for hours/days and resume exactly on time

---

## Integration with FIONA Architecture

```
Ashandy / Client Request
    |
    v
Temporal Workflow (orchestrates)
    |
    +---> AEGIS-99 Consensus (activity)
    +---> DCC Adapter Launch (activity, retry x3)
    +---> Creative Generation (activity)
    +---> Client Review Gate (sleep 2 days, then resume)
    +---> Delivery (activity)
    |
    v
Workflow Complete
```

### Activity Retry Policy

| Activity Type | Initial Interval | Max Attempts | Backoff |
|--------------|-------------------|--------------|---------|
| AEGIS-99 consensus | 5s | 3 | 2x exponential |
| DCC headless launch | 10s | 5 | 2x exponential |
| Research (Tavily/Brave) | 5s | 3 | 1.5x exponential |
| Creative generation | 10s | 3 | 2x exponential |
| Client delivery | 30s | 10 | Linear (+30s) |

---

## Cost

| Phase | Cost | Notes |
|-------|------|-------|
| Build | $0-3/mo | Self-hosted on Lightning.ai (free compute) |
| Runtime | $0-50/mo | Cloud or self-hosted depending on volume |
| **Total** | **$0-50/mo** | Already in budget breakdown |

**Self-hosted option:** Temporal server runs as a Docker container on Lightning.ai (free). No additional cost for build phase.

---

## Implementation

### Build Phase Setup

```bash
# Start Temporal server (Docker)
docker run --rm -it -p 7233:7233 temporalio/server:latest

# Define workflow types
- BuildModuleWorkflow: Orchestrates single module build
- DCCAdapterWorkflow: Orchestrates DCC adapter + smoke test
- ResearchWorkflow: Orchestrates 8-model research + consensus
- DailyBuildWorkflow: Parent workflow that sequences all daily tasks
```

### Runtime Setup

```bash
# Connect to Temporal Cloud (or keep self-hosted)
# Workflows run indefinitely
- ClientProjectWorkflow: End-to-end client project
- MegaCycleWorkflow: Continuous 60s heartbeat
- TrapDoorWorkflow: Continuous auto-fix loop
- WeeklyEvolutionWorkflow: Sunday `/evolve` trigger
```

---

## Why Not Just Cron?

| Feature | Cron | Temporal |
|---------|------|----------|
| Survives crashes | ❌ No | ✅ Yes |
| Retries failed steps | ❌ No | ✅ Configurable |
| State persistence | ❌ No | ✅ Automatic |
| Sleep for days | ❌ No | ✅ Yes |
| Visual workflow history | ❌ No | ✅ Web UI |
| Child workflows | ❌ No | ✅ Yes |

**Cron is for simple scheduled tasks. Temporal is for complex, long-running, failure-prone workflows that MUST complete.**

---

## Status

| Phase | Status |
|-------|--------|
| Build | **Track.** Not on critical path. Can be added Day 10+ if needed. |
| Runtime | **HIGH value.** Activate post-build for client project reliability. |
| Current | In Budget Breakdown ($0-50/mo). Architecture documented here. |

---

## Related Files
- [[Budget Breakdown]] — Temporal.io cost: $0-50/mo
- [[Build Flow]] — Temporal orchestrates the 8 steps
- [[Mega Cycle System Integration]] — Temporal backs the 60s heartbeat
- [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]] — Temporal orchestrates trap door retries
- [[Cron Automation — Build & Runtime Schedules]] — Temporal complements cron (cron = simple, Temporal = complex)
