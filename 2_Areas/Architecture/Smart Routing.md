---
tags: [architecture, routing, supervisors, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 3
---

# Smart Routing

> **Three cascaded routing systems that automatically assign the right model to the right task.**

---

## Claude Smart Routing (Build + Runtime)

| Task Difficulty | Model | Role |
|-----------------|-------|------|
| **EXTREME CRITICAL** | Claude Opus 4.8 | Deep architectural planning, complex debugging 10+ files, final review, visual design |
| **HIGH** | Claude Opus 4.6 | High-level logic, module structure, integration patterns, standard debugging |
| **LOW** | Claude Sonnet 4.6 | Code generation, data formatting, boilerplate, unit tests, simple fixes |

### Auto-Assignment Rules
- If task involves >5 files → Opus 4.8
- If task involves architectural decisions → Opus 4.8
- If task is standard module implementation → Opus 4.6
- If task is repetitive/formatting → Sonnet 4.6
- **Ashandy override**: "Use Opus 4.8 for this" or "Use Sonnet for this"

---

## OpenAI Smart Routing (Build + Runtime)

| Task Difficulty | Model | Role |
|-----------------|-------|------|
| **EXTREME CRITICAL** | GPT-5.5 Pro (openai/gpt-5.5-pro) | Deep architectural planning, complex debugging, final review |
| **HIGH** | GPT-5.5 (openai/gpt-5.5) | Feature implementation, complex refactoring, technical documentation |
| **LOW** | GPT-5.4 (openai/gpt-5.4) | Repetitive coding, unit tests, boilerplate, formatting, simple bugs |

### GPT-5.5 Pro Activation Protocol
1. Fiona detects task difficulty exceeds GPT-5.5 capability
2. Fiona asks Ashandy: "This task requires GPT-5.5 Pro. Approve? (Yes/No/Explain)"
3. Ashandy approves → Switch to GPT-5.5 Pro for this task
4. Task completes → Auto-switch back to GPT-5.5
5. OR: Ashandy pre-approves: "For all critical tasks today, use Pro"

---

## OpenCode Smart Routing (3-Model Cascade)

| Task Difficulty | Models | Role |
|-----------------|--------|------|
| **EXTREME CRITICAL** | ALL 3: Nemotron + V4-Pro + Qwen3.7 | Nemotron: 1M context deep review. V4-Pro: Code pattern analysis. Qwen3.7: Web/UI validation |
| **HIGH** | Nemotron + Qwen3.7 | Nemotron: Deep review. Qwen3.7: Alternative implementation |
| **LOW** | Qwen3.7 only | Fast independent review |

### Auto-Assignment Rules
- If AEGIS-99 score < 0.80 → All 3 models
- If AEGIS-99 score 0.80-0.90 → Nemotron + Qwen3.7
- If AEGIS-99 score > 0.90 → Qwen3.7 only
- **Ashandy override**: "Use all 3 for this" or "Use Nemotron only"

---

## Routing Decision Flow

```
Task Received
    |
    v
Analyze difficulty + scope
    |
    +---> <2s, simple -----------> Kimi K2.7 + MiniMax M3 (no supervisors)
    |
    +---> <10s, standard --------> 8-model pool + AEGIS-99 >=0.85
    |
    +---> <30s, coding ----------> Coding Brain (6 models) + Codex review
    |                                + Claude cascade assigns Opus/Sonnet
    |                                + OpenAI cascade assigns GPT-5.5/5.4
    |
    +---> minutes/hours, critical -> 9-model pool + all supervisors + overseers
                                     + ALL cascades active
                                     + Quantum involved
                                     + AEGIS >=0.90
```

---

*See also: [[Model Roster]], [[Supervisor Configuration]], [[Task Routing]]*
