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

### When Activated
- All coding tasks (automatic)
- Critical tasks (Opus 4.8 forced)
- Standard tasks (Opus 4.8 auto-selected)
- Repetitive tasks (Sonnet auto-selected)

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
