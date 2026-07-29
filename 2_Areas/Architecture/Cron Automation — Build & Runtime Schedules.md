---
tags: [automation, cron, scheduling, build, runtime, nemotron, openclaw]
date-created: 2026-07-28
source: NEW_RESEARCH_TOOLS_ANALYSIS(1).txt (Items 2-3)
---

# Cron Automation — Build & Runtime Schedules

> **Automated tasks that run on schedule during build and runtime phases. All crons are managed via OpenClaw and logged to shared JSONL.**

---

## Build Phase Crons (Days 1-30)

| Time (UTC) | Task | Tool | Cost | Output |
|------------|------|------|------|--------|
| **08:00 Daily** | Deep research on next unbuilt module | Nemotron 3 Ultra 550B + OpenClaw | $0 (L1 free) | `memory/YYYY-MM-DD.md` research brief |
| **09:00 Daily** | Dependency vulnerability scan | Snyk + Trivy | $0 (free tier) | Security report JSON |
| **12:00 Daily** | DCC adapter smoke test (all 7) | Cursor Composer 2.5 (Standard mode) | ~$0.50 | Headless launch verification log |
| **18:00 Daily** | Build progress report to Ashandy | Pi Agent | $0 (local) | Status email/Slack message |
| **20:00 Daily** | AEGIS-99 score trend analysis | Nemotron 3 Ultra 550B | $0 (L1 free) | Trend graph + anomaly flags |
| **23:00 Daily** | Overnight mode entry | Pi Agent + Goose | $0 (local) | Mega Cycle overnight activation |
| **Sunday 02:00** | Weekly self-evolution (`/evolve`) | All 3 supervisors | ~$2.00 | Updated feedback memories |

## Runtime Crons (Post-Build, Ongoing)

| Time (UTC) | Task | Tool | Cost | Output |
|------------|------|------|------|--------|
| **Every 60s** | Mega Cycle heartbeat check | Pi Agent + Goose | $0 (local) | Cycle log entries |
| **Every 30min** | Status report | Pi Agent | $0 (local) | JSONL log entries |
| **08:00 Daily** | Market research (B4D Grillz trends) | Nemotron 3 Ultra 550B | $0 (L1 free) | Market brief |
| **09:00 Daily** | Dependency vulnerability scan | Snyk + Trivy | $0 (free tier) | Security report |
| **10:00 Daily** | Creative taste sync (Obsidian → Chroma) | Harrier Embedding 0.6B | ~$0.10 | Updated taste embeddings |
| **12:00 Daily** | DCC adapter compatibility check | Cursor Composer 2.5 | ~$0.50 | DCC version drift alerts |
| **Sunday 02:00** | Weekly deep embedding (Harrier 27B Q4) | Harrier 27B Q4 | ~$5.00 | Deep taste vector refresh |
| **Sunday 03:00** | Weekly self-evolution (`/evolve`) | All 3 supervisors | ~$2.00 | Updated feedback memories |

---

## OpenClaw Management

```bash
# List all active crons
openclaw cron list

# Add a new cron
openclaw cron add --cron "0 8 * * *" --message "[task description]"

# Remove a cron
openclaw cron remove --id [cron-id]

# View cron logs
openclaw cron logs --id [cron-id] --last 24h
```

## Cron Safety Rules

1. **All crons log to shared JSONL** — `/fiona/logs/cron-activity.jsonl`
2. **Escalation on 3 consecutive failures** — Notify Ashandy via Slack
3. **Budget caps** — Each cron has max daily spend; exceeded = auto-pause
4. **Build phase crons auto-disable** after Day 30 (except security scans)
5. **Runtime crons auto-enable** on Day 31
6. **Manual override** — Ashandy can pause/resume any cron via `/cron pause [id]`

---

## Related Files
- [[Overseer Configuration]] — Pi Agent + Goose execute cron monitoring
- [[Mega Cycle System Integration]] — 60s heartbeat is a runtime cron
- [[Universal Research Mandate]] — Nemotron 8AM research cron
- [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]] — DCC smoke tests run in sandboxes
