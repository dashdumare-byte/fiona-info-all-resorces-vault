---
tags: [workflow, session, protocol, gitnexus, build, critical]
date-created: 2026-07-28
source: NEW_RESEARCH_TOOLS_ANALYSIS(1).txt Item 9
---

# Session Start Protocol

> **Every FIONA build session MUST follow this 5-step protocol before any work begins.** Ensures full context awareness, prevents breaking changes, and maintains continuity across sessions.

---

## The 5 Steps

### Step 1: GitNexus — What Changed Since Last Session?

```bash
npx gitnexus query "what changed since last session"
```

**What this does:**
- Scans git history since last session timestamp
- Identifies all files modified, added, deleted
- Shows dependency graph changes
- Highlights modules with recent changes

**Output format:**
```markdown
## Changes Since [Last Session Date]

### Modified Modules
- Module 12 (Frontend Factory): 3 files changed
- Module 27 (Blender Adapter): 1 file changed

### New Files
- src/auth/token_refresh.py
- tests/blender/test_headless.py

### Dependency Graph Changes
- Module 12 → Module 15 (new link)
- Module 27 blast radius: 2 downstream modules

### Recommendations
- Review Module 12 changes before touching Module 15
- Blender adapter tests need attention (1 failure)
```

**Cost:** Free (local compute)
**Time:** ~10 seconds

---

### Step 2: Blast Radius Check

Before modifying ANY code, check what depends on it:

```bash
# Check blast radius of planned changes
npx gitnexus blast-radius --files "src/auth/token_refresh.py"

# Or use graph MCP tools
npx gitnexus graph --query "dependents of src/auth/token_refresh"
```

**Rules:**
- **1-2 level dependency chain:** Safe to proceed with standard review
- **3+ level dependency chain:** MUST use plan mode first (document change strategy)
- **5+ level dependency chain:** Escalate to Ashandy before proceeding

**Never modify a function without checking its dependents first.**

---

### Step 3: Load Supervisor Primer

Each supervisor has a primer file that loads project-specific context:

```bash
# Load Claude Code primer (production code quality, security)
cat primers/primer_claude.md

# Load Codex primer (adversarial review, cross-checking)
cat primers/primer_codex.md

# Load OpenCode primer (independent review, edge cases)
cat primers/primer_opencode.md
```

**Primer contents:**
- Current project priorities
- Known issues from previous sessions
- Module dependency map
- AEGIS-99 threshold status
- Budget remaining ($X of $300)

---

### Step 4: Read MEMORY.md Current State

```bash
cat MEMORY.md
```

**What to check:**
- Current build day (Day X of 30)
- Last completed module
- Next module in queue
- Any escalated issues
- Budget spend so far ($X of $300)
- AEGIS-99 scores trend

**MEMORY.md template:**
```markdown
# FIONA Build State

## Current Status
- Day: 12 of 30
- Last completed: Module 27 (Blender Adapter)
- Next: Module 28 (DaVinci Resolve Adapter)
- Budget: $127 of $300 spent

## Active Issues
- [ ] Module 25: 2 tests failing (escalated to Ashandy)
- [ ] DCC Batch A: ComfyUI MCP needs rebuild

## AEGIS-99 Trend
- Last 5 modules: 0.91, 0.88, 0.92, 0.90, 0.93
- Average: 0.908 (above 0.90 threshold)

## Today's Plan
- Morning: DaVinci Resolve adapter (M28)
- Afternoon: DCC Batch A integration test
```

---

### Step 5: Begin Work With Full Context

Only after Steps 1-4 are complete:

```
✅ GitNexus: Know what changed
✅ Blast radius: Know impact of planned changes
✅ Primers: Supervisor-specific context loaded
✅ MEMORY.md: Current project state understood
→ BEGIN WORK
```

---

## GitNexus Infrastructure

### Required Directory Structure

```
FionaVault/
├── .gitnexus/                  # Codebase knowledge graph (LadybugDB via MCP)
│   ├── graph.json              # Full dependency graph
│   ├── module-index.json       # Module → files mapping
│   └── change-log.jsonl        # Per-session change log
│
├── .code-review-graph/         # Structural map (SQLite via MCP)
│   ├── review.db               # SQLite database of code structure
│   └── api-surface.json        # Public API endpoints
│
├── primers/                    # Supervisor primer files
│   ├── primer_claude.md
│   ├── primer_codex.md
│   └── primer_opencode.md
│
└── MEMORY.md                   # Current build state
```

### GitNexus MCP Commands

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `npx gitnexus query "what changed"` | Session start | Every session (Step 1) |
| `npx gitnexus blast-radius --files "X"` | Impact analysis | Before any change (Step 2) |
| `npx gitnexus graph --query "dependents of X"` | Dependency lookup | Blast radius check (Step 2) |
| `npx gitnexus re-index` | Refresh graph | After major refactor |
| `npx gitnexus codegraph_explore --module X` | Explore module structure | Deep dives |

**Graph re-index:** Every 15 minutes during active development (see [[Cron Automation — Build & Runtime Schedules]])

---

## Why This Protocol Matters

| Without Protocol | With Protocol |
|-----------------|---------------|
| Work on stale context | Always know what changed |
| Break downstream modules | Blast radius prevents surprises |
| Supervisors lack context | Primers ensure consistency |
| Lose track of build state | MEMORY.md = single source of truth |
| 3+ level changes break things | Plan mode catches risks early |

---

## Integration with Build Flow

This protocol is **Step 0** of the [[Build Flow]]:

```
Step 0: SESSION START PROTOCOL (this file)
    |
    v
Step 1: Research (if needed)
    |
    v
Step 2: Architecture Review
    |
    v
... (rest of Build Flow)
```

---

## Related Files
- [[Build Flow]] — 8 steps from research to Cursor gate
- [[Supervisor Configuration]] — Primer files per supervisor
- [[Cron Automation — Build & Runtime Schedules]] — GitNexus re-index every 15min
- [[Mega Cycle System Integration]] — MEMORY.md is read every 60s cycle
- [[Tool Integration — Code Mode Architecture]] — GitNexus queries use lazy-loaded MCP
