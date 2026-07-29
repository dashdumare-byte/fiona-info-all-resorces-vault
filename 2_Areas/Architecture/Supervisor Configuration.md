---
tags: [architecture, supervisors, locked, claude, codex, opencode]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 4
---

# Supervisor Configuration

> **Three supervisors review ALL code after AEGIS-99 consensus. Each has a distinct role and model cascade.**

---

## Supervisor 1: Claude Code

| Attribute | Value |
|-----------|-------|
| **Primary** | Opus 5 |
| **Secondary** | Opus 4.8 |
| **Tertiary** | Sonnet 4.8 |
| **Config File** | CLAUDE.md (vault-as-supervisor replaces static file) |
| **Smart Routing** | Automatic by task difficulty |

### Responsibilities
- Production code quality
- Bug detection and fixes
- Refactoring recommendations
- Memory system integrity
- Security review
- DCC gate validation
- Visual design review

### Claude Code Subagents (Item 6 — 4 specialized subagents)
| Subagent | Role | Trigger |
|----------|------|---------|
| `dcc-researcher` | Researches DCC APIs before adapter generation | DCC adapter build |
| `security-reviewer` | Security review on each completed module | Post-module build |
| `code-reviewer` | Code quality review | Post-AEGIS consensus |
| `aegis-auditor` | Dedicated AEGIS-99 auditing subagent | AEGIS score < 0.90 |

### Claude Code Hooks (Item 7 — 3 event-driven hooks)
| Hook | Event | Action |
|------|-------|--------|
| Auto-format | Every file write | Runs formatter before save |
| Block-production-files | PreToolUse | Prevents accidental overwrites of production files |
| Git commit | Post-successful-build | Auto-commits with AEGIS-99 score in message |

### CLAUDE.md Required Additions (GitNexus Integration)

These MUST be present in CLAUDE.md for every build session:

**Graph Indexes (MCP-backed):**
```markdown
## Graph Indexes
- Full dependency graph: `.gitnexus/` (LadybugDB via MCP)
- Structural code map: `.code-review-graph/` (SQLite via MCP)
- Re-index interval: Every 15 minutes during active development
```

**Change Safety Rules:**
```markdown
## Change Safety Rules
- BEFORE any code change: Check blast radius via `npx gitnexus blast-radius --files "[path]"`
- NEVER modify a function without checking its dependents first
- If dependency chain is 3+ levels deep: Use plan mode first (document strategy)
- If dependency chain is 5+ levels deep: Escalate to Ashandy
- Prefer `codegraph_explore` or graph MCP tools over `grep` for navigation
```

**Session Start Checklist:**
```markdown
## Session Start (MANDATORY)
- [ ] Run: `npx gitnexus query "what changed since last session"`
- [ ] Check blast radius of planned changes
- [ ] Load `primers/primer_claude.md`
- [ ] Read `MEMORY.md` current state
- [ ] Begin work with full context
```

### When Activated
- All coding tasks (automatic)
- Critical tasks (Opus 5 forced)
- Standard tasks (Opus 4.8 auto-selected)
- Repetitive tasks (Sonnet 4.8 auto-selected)
- Trap door auto-fixes (all 3 supervisors + Cursor Composer participate — see [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]])

---

## Supervisor 2: Codex

| Attribute | Value |
|-----------|-------|
| **Primary** | GPT-5.6 Terra |
| **Extreme** | GPT-5.6 Sol (Ashandy approval only) |
| **Fallback** | GPT-5.6 Luna |
| **Config File** | AGENTS.md (vault-as-supervisor replaces static file) |
| **Plugin** | codex-plugin-cc |

### Responsibilities
- Validate AEGIS-99 scores (detect manipulation)
- Code quality adversarial review
- Cross-check Nemotron decisions
- Flag council deadlock
- Security vulnerability detection
- Logic bomb detection

### When Activated
- After AEGIS-99 on all code
- Adversarial research before review
- Cross-checks other supervisors' findings

---

## Supervisor 3: OpenCode

| Attribute | Value |
|-----------|-------|
| **Primary** | Qwen3.7-Max-Preview (fast independent review) |
| **Secondary** | Nemotron 3 Ultra 550B (deep 1M context review) |
| **Tertiary** | DeepSeek V4-Pro (code pattern analysis) |
| **Config File** | opencode.json (vault-as-supervisor replaces static file) |
| **Smart Routing** | By AEGIS-99 score |

### Responsibilities
- Independent review (not influenced by other supervisors)
- Alternative implementation suggestions
- Edge case detection
- Lean 4 proof verification
- Mathematical validation

### When Activated
- AEGIS < 0.80: All 3 models engage
- AEGIS 0.80-0.90: Nemotron + Qwen3.7
- AEGIS > 0.90: Qwen3.7 only
- Ashandy can force "all 3" mode

---

## Supervisor Review Flow

```
Code Generated (Step 3)
    |
    v
AEGIS-99 Consensus (Step 4) --> PASS?
    |                            |
    | NO --> Red flag, rework    v YES
    |                            |
    v                            v
    |                    Supervisor 1: Claude Code
    |                            |
    |                            v
    |                    Supervisor 2: Codex
    |                            |
    |                            v
    |                    Supervisor 3: OpenCode
    |                            |
    |                            v
    |                    All 3 PASS?
    |                            |
    +-------------------- NO --> Rework
                                 |
                                 v YES
                           Cursor Hard Gate (Step 8)
```

---

## Vault-as-Supervisor Note

Static config files (CLAUDE.md, AGENTS.md, opencode.json) are **deprecated** in favor of this vault. The mcp-obsidian bridge allows supervisors to query vault content in real-time. This eliminates config drift and ensures all supervisors reference the same current architecture state.

---

*See also: [[Smart Routing]], [[Overseer Configuration]], [[F-GARP - Deadlock Recovery]]*
