---
tags: [devin, devin-desktop, evaluation, excluded, windsurf, layer-2]
date-created: 2026-06-06
source: Layer 2 research — Devin Desktop launch analysis
---

# Devin Desktop (Exclusion Reaffirmed)

> **Status: EXCLUDED — Original "Devin AI" exclusion extended to Devin Desktop. Different product from original, still doesn't fit FIONA's architecture.**

---

## What Changed

**June 2, 2026**: Cognition rebranded Windsurf IDE as **Devin Desktop**.

This is NOT the same "Devin AI" we originally excluded. That was the cloud autonomous agent. Devin Desktop is an IDE with multi-agent management. But we still exclude it.

---

## What Devin Desktop Is (4 Surfaces)

| Surface | What | Status |
|---------|------|--------|
| **Devin Desktop** | IDE (rebranded Windsurf) + Agent Command Center | NEW |
| **Devin Cloud** | Autonomous cloud agent (original Devin) | ALREADY EXCLUDED |
| **Devin CLI** | Terminal access | NEW |
| **Devin Review** | Automated PR review | NEW |

---

## Key Features

### Agent Command Center
- Kanban board managing parallel agent sessions
- Local + cloud agents visible in one view
- Track: in progress, blocked, ready for review

### Agent Client Protocol (ACP)
- Open protocol for third-party agents
- Can run: Codex, Claude Agent, OpenCode, custom agents
- Interesting but overlaps with our existing supervisor stack

### DeepWiki
- Auto-indexes repos, generates architecture docs
- Updates every few hours
- Overlaps with GitNexus + our vault documentation

### SWE-1.6 Model
- Cognition's proprietary coding model
- Unlimited on free tier
- BUT: cloud-only, no local weights

### Integrations
- 15+ pre-configured MCP servers (Slack, Linear, Figma, Stripe, Vercel, Datadog)
- Sessions API
- Auto-Triage for incoming issues

---

## Pricing

| Plan | Cost | Notes |
|------|------|-------|
| **Free** | $0 | SWE-1.6 unlimited, Tab completions, inline edits |
| **Pro** | $20/mo | 500 credits, Devin Cloud agents |
| **Max** | $200/mo | Maximum credits |
| **Teams** | $80/mo + $40/seat | Enterprise features |

---

## Why Still Excluded

### 1. Cloud-Only Models (Data Residency Risk)
Every model is cloud-hosted. Your code context goes to Cognition's servers. No local weights option. No air-gapped mode.

> FIONA uses Lightning.ai (our infra) + NIM free models (our control). Devin Desktop violates our data residency principle.

### 2. Overlap with Existing Stack
| Devin Feature | FIONA Equivalent |
|---------------|-----------------|
| Agent Command Center | Pi Agent + Goose + our orchestrator |
| DeepWiki | GitNexus + Obsidian vault |
| Devin Review | 3-supervisor review (Claude Code + Codex + OpenCode) |
| ACP | Already have Codex, Claude Code, OpenCode natively |
| MCP servers | We configure our own MCP stack |

### 3. Additional Cost
- $20-200/mo subscription
- ACU-based billing for cloud agents
- FIONA's $250-300 build budget is for API calls, not IDE subscriptions

### 4. Different Paradigm
Devin Desktop is designed for **human engineers delegating to agents**. FIONA IS the agent — it doesn't need an IDE to delegate to other agents. It IS the multi-agent system.

---

## What WAS Interesting

### Agent Client Protocol (ACP)
The open protocol for running third-party agents is architecturally interesting. But:
- We already have direct integrations with Codex, Claude Code, OpenCode
- ACP would add a compatibility layer we don't need
- Our agents talk to each other via AEGIS-99 + shared JSONL, not an IDE protocol

---

## Distinction from Original Exclusion

| | Original Devin AI | Devin Desktop |
|---|---|---|
| **What** | Cloud autonomous agent | IDE with agent management |
| **Excluded** | Apr 30, 2026 | Jun 6, 2026 (this doc) |
| **Reason** | Overpriced, cloud-only, overlaps with our stack | Same + adds IDE complexity we don't need |

---

## If Circumstances Change

Re-evaluate if:
- ACP becomes industry standard (not just Cognition's protocol)
- Local model support added
- Pricing becomes usage-competitive with our API approach
- Enterprise features needed for client deployments

---

*Exclusion reaffirmed: 2026-06-06 | Original exclusion: 2026-04-30 | Devin Desktop launched: 2026-06-02*
