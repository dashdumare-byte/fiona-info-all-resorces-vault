---
tags: [architecture, supervisors, locked, claude, codex, opencode]
date-created: 2026-06-08
---
# Supervisor Configuration
> **Three supervisors review ALL code after AEGIS-99 consensus.**
## Supervisor 1: Claude Code
- Primary: Opus 4.8, Secondary: Opus 4.6, Tertiary: Sonnet 4.6
- Responsibilities: Production code, bugs, refactor, memory, security, DCC gate
## Supervisor 2: Codex
- Primary: GPT-5.5, Extreme: GPT-5.5 Pro (Ashandy approval), Fallback: GPT-5.4
- Responsibilities: Validate AEGIS-99, code quality adversarial, cross-check, flag deadlock
## Supervisor 3: OpenCode
- Primary: Qwen3.7-Max-Preview (fast), Secondary: Nemotron 3 Ultra 550B (deep 1M context), Tertiary: DeepSeek V4-Pro (code patterns)
- Responsibilities: Independent review, alternative implementation, edge cases, Lean 4 proof
