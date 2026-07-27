---
tags: [architecture, routing, runtime, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt Section 8
---

# Task Routing

> **Four complexity levels. Right models, right supervision, right cost for every task.**

---

## Level 1: Simple (<2s)

| Attribute | Value |
|-----------|-------|
| **Models** | L1: MiniMax M3 + Gemma 4 + Ornith-35B | L2: + Kimi K2.7 + GPT-5.6 Terra + GLM-5.2 | L3: + Opus 5 + Kimi K3 (Fable 5 fallback) |
| **AEGIS-99** | Optional |
| **Research** | Minimal (Kimi fast scan) |
| **Supervisors** | None |
| **Overseers** | Light monitoring |
| **Quantum** | Not involved |
| **Examples** | Email, weather, quick lookups |

---

## Level 2: Standard (<10s)

| Attribute | Value |
|-----------|-------|
| **Models** | L1 models -> AEGIS-99 (L1 weights) | L2 models -> AEGIS-99 (L2 weights) | L3 models -> AEGIS-99 (L3 weights) |
| **AEGIS-99** | Mandatory >=0.85 |
| **Research** | Standard (2-model) |
| **Supervisors** | None |
| **Overseers** | Moderate monitoring |
| **Quantum** | Not involved |
| **Examples** | Research, proposals, social media |

---

## Level 3: Coding (<30s)

| Attribute | Value |
|-----------|-------|
| **Models** | Fiona Coding Brain (6-9 models, task-dependent) |
| **AEGIS-99** | Mandatory >=0.85 |
| **Research** | Universal (selected models) |
| **Supervisors** | Codex (GPT-5.6 Terra) adversarial review |
| **Overseers** | Active monitoring |
| **Smart Routing** | Claude + OpenAI cascades active |
| **Quantum** | Not involved |
| **Examples** | Python scripts, React components, debugging |

### Default Coding Brain
**GLM-5.2** (lead) + GLM-5.1 (fallback) + Qwen3.7 + Kimi K2.7 + Mistral-small + MiMo-V2-Pro

### Difficult Coding Brain (+ added)
+ Claude Opus 4.8 + GPT-5.6 Terra

### Extreme Coding Brain (+ added)
+ DeepSeek V4-Pro + MiniMax M3

---

## Level 4: Critical (Minutes to Hours)

| Attribute | Value |
|-----------|-------|
| **Models** | Full 9-Model Pool (including quantum) |
| **AEGIS-99** | Mandatory >=0.90 |
| **Research** | Universal (all 8 models + cross-verify) |
| **Supervisors** | ALL 3 (with smart routing) |
| **Overseers** | FULL active (can pause/escalate) |
| **Formal Verification** | Leanstral (if math) |
| **Cursor Gate** | Mandatory |
| **Smart Routing** | ALL cascades active |
| **Quantum** | FULL strategy + optimization |
| **GPT-5.6 Sol** | Available on Ashandy approval |
| **Examples** | UE5 environment, dental grillz, freight algo, full music video |

---

## Visual Decision Tree

```
Task Received
    |
    +---> Quick lookup / simple ----> Level 1: Kimi + MiniMax (no AEGIS)
    |                                  Cost: ~$0.01
    |
    +---> Research / proposal ------> Level 2: + AEGIS-99 >=0.85
    |                                  Cost: ~$0.10
    |
    +---> Code generation ----------> Level 3: Coding Brain + Codex
    |                                  Cost: ~$0.50-2.00
    |
    +---> Complex production -------> Level 4: Full pool + everything
                                       Cost: ~$5-50+
```

---

*See also: [[Smart Routing]], [[Model Roster]], [[Supervisor Configuration]]*
