---
tags: [architecture, supervisors, locked, claude, codex, opencode]
date-created: 2026-06-08
---

# Supervisor Configuration

> **Three supervisors review ALL code after AEGIS-99 consensus.**

## Supervisor 1: Claude Code

| Attribute | Value |
|-----------|-------|
| **Primary** | Opus 4.8 |
| **Secondary** | Opus 4.6 |
| **Tertiary** | Sonnet 4.6 |
| **EXTREME** | **Fable 5** (NEW -- Ashandy approval only) |

**Fable 5 activates when:**
- Task involves >10 files
- Architectural decisions with no obvious answer
- Module 68 (B4D Grillz) precision verification
- Security architecture review
- All lower models failed

**Responsibilities:** Production code, bugs, refactor, memory, security, DCC gate

## Supervisor 2: Codex

| Attribute | Value |
|-----------|-------|
| **Primary** | GPT-5.5 |
| **Extreme** | GPT-5.5 Pro (Ashandy approval only) |
| **Fallback** | GPT-5.4 |

**Responsibilities:** Validate AEGIS-99, code quality adversarial, cross-check, flag deadlock

## Supervisor 3: OpenCode

| Attribute | Value |
|-----------|-------|
| **Primary** | Qwen3.7-Max-Preview (fast) |
| **Secondary** | Nemotron 3 Ultra 550B (deep 1M context) |
| **Tertiary** | DeepSeek V4-Pro (code patterns) |

**Responsibilities:** Independent review, alternative implementation, edge cases, Lean 4 proof
