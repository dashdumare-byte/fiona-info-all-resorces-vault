---
tags: [aegis-99, 3-tier, runtime, architecture, locked]
date-created: 2026-06-09
---

# AEGIS-99 3-Tier Runtime System

> **Same purpose across all tiers: multi-model consensus quality gate.**
> **Only the model pool changes based on task complexity.**
> **Purpose unchanged: ensure outputs are correct, valid, and thorough.**

---

## AEGIS-99 ROLES (Universal Across All Tiers)

| Role | Weight | Purpose |
|------|--------|---------|
| **Architect Primary** | 20% | Final decision-maker. Breaks ties. Sets technical direction. |
| **Architect Co-Primary** | 15% | Secondary decision. Supports primary, challenges when needed. |
| **Quantum/Strategy** | 15% | Pattern analysis, optimization suggestions, non-obvious insights. |
| **Auditor 1 (Deep)** | 15% | Adversarial review. Finds edge cases, bugs, vulnerabilities. |
| **Auditor 2 (Cross)** | 10% | Consistency review. Cross-checks findings, verifies alignment. |
| **Safety Margin** | 10% | Distributed reserve. Spread across all for robustness. |
| **Multimodal Check** | 10% | Visual/audio validation. Screenshots, video, audio review. |
| **Reasoning Check** | 5% | Math/logic verification. Formal logic, mathematical proofs. |

**Total: 100%**

---

## TIER 1: AEGIS-99 L1 -- FREE MODELS ONLY

> **Status: OPTIONAL -- activated when Ashandy says "use L1" for task/session**
> **Cost: $0 | Models: ALL FREE (NIM + OpenRouter + Ollama)**
> **Use case: Simple tasks (<2s), standard tasks (<10s), casual conversation**

### L1 Model Pool (2-3 per role, all FREE)

| Role | Primary | Secondary | Tertiary | Fallback Chain |
|------|---------|-----------|----------|----------------|
| **Architect Primary (20%)** | Nemotron 3 Ultra 550B (NIM) | Nemotron 3 Super 120B (OpenRouter) | Gemma 4 31B (NIM) | Llama 3.3 70B |
| **Architect Co-Primary (15%)** | GLM 5.1 (NIM) | Gemma 4 31B (NIM) | GLM 5.1 (OpenRouter) | DeepSeek R1 |
| **Auditor 1 Deep (15%)** | DeepSeek R1 (NIM) | GLM 5.1 (NIM) | MiniMax M2.5 (NIM) | DeepSeek V4 Flash |
| **Auditor 2 Cross (10%)** | DeepSeek V4 Flash (OpenRouter) | Gemma 4 26B (NIM) | Gemma 4 26B (Ollama local) | Qwen2.5 72B |
| **Quantum/Strategy (15%)** | Nemotron 3 Ultra 550B (NIM) | DeepSeek R1 (NIM) | GLM 5.1 (NIM) | Llama 3.3 70B |
| **Multimodal Check (10%)** | Kimi K2.5 (NIM) | Gemma 4 26B (NIM multimodal) | Gemma 4 26B (Ollama) | -- |
| **Reasoning Check (5%)** | DeepSeek R1 (NIM) | Phi-4 (Ollama) | -- | Llama 3.1 8B |
| **Safety Margin (10%)** | Llama 3.3 70B (NIM) | MiniMax M2.5 (NIM) | Llama 3.1 8B (Ollama) | -- |

### L1 ALL FREE MODELS STATUS

| Model | Source | Cost | Context | Best At |
|-------|--------|------|---------|---------|
| Nemotron 3 Ultra 550B | NIM | FREE | 1M | Architect, 300 t/s, #1 US |
| Nemotron 3 Super 120B | NIM/OpenRouter | FREE | 1M | Fallback architect |
| GLM 5.1 | NIM/OpenRouter | FREE | 200K | Co-architect, 8hr execution |
| Gemma 4 26B MoE | NIM/Ollama | FREE | 256K | Auditor, multimodal, fast |
| Gemma 4 31B Dense | NIM | FREE | 256K | Co-architect, #3 Arena AI |
| DeepSeek R1 | NIM | FREE | 200K | Reasoning, math, 671B MoE |
| DeepSeek V4 Flash | OpenRouter | FREE | 1M | Speed auditor, 1M context |
| Kimi K2.5 | NIM | FREE | 256K | Multimodal, 1T MoE |
| MiniMax M2.5 | NIM/OpenRouter | FREE | 200K | Multi-agent engineering |
| Llama 3.3 70B | NIM/OpenRouter | FREE | 128K | General fallback |
| Qwen2.5 72B | Ollama | FREE LOCAL | 128K | Web/UI verification |
| Llama 3.1 8B | Ollama | FREE LOCAL | 128K | Ultra-fast safety fallback |
| Phi-4 | Ollama | FREE LOCAL | 128K | Reasoning safety check |

### L1 Activation Protocol
- **Trigger**: Ashandy says "use L1" or "use L1 for this session"
- **Auto-escalation**: If L1 consensus <0.70 after 3 attempts -> auto-switch to L2
- **Cost**: $0
- **Threshold**: >=0.75 (lower than L2/L3 since models are less powerful)
- **Latency**: Fast (all free APIs, no rate limit concerns for simple tasks)

---

## TIER 2: AEGIS-99 L2 -- STANDARD + FREE SUPPORT

> **Status: AUTO-ACTIVATED for complex tasks (coding <30s, multi-step)**
> **Cost: ~$0.50-2.00 | Base: Locked AEGIS-99 v4.1 + FREE models as support**
> **Use case: Coding tasks, research, proposals, standard creative work**

### L2 Model Pool (Base + Free Support)

| Role | Base (Locked) | Free Support (NEW) | Free Fallback |
|------|--------------|-------------------|---------------|
| **Architect Primary (20%)** | Nemotron 3 Ultra 550B | -- | Nemotron Super 120B |
| **Architect Co-Primary (15%)** | GPT-5.5 | GLM 5.1 (handles easy sub-tasks) | Gemma 4 31B |
| **Auditor 1 Deep (15%)** | MiniMax M3 | DeepSeek R1 (reasoning verification) | GLM 5.1 |
| **Auditor 2 Cross (10%)** | Qwen3.7 | DeepSeek V4 Flash (speed checks) | Gemma 4 26B |
| **Quantum/Strategy (15%)** | D-Wave Leap | Nemotron Ultra (pattern analysis) | DeepSeek R1 |
| **Multimodal Check (10%)** | MiniMax M3 | Kimi K2.5 (multimodal cross-check) | Gemma 4 26B |
| **Reasoning Check (5%)** | -- | DeepSeek R1 (math/logic) | Phi-4 |
| **Safety Margin (10%)** | Distributed | Llama 3.3 70B (general safety) | MiniMax M2.5 |

### L2 Token Optimization Strategy
- **GPT-5.5 (Co-Primary)**: Works on DIFFICULT architectural decisions
- **GLM 5.1 (Free Support)**: Handles EASY sub-tasks within the same consensus round
  - Example: GPT-5.5 debates module architecture while GLM 5.1 validates syntax
- **DeepSeek R1 (Free Support)**: Handles reasoning/math verification
  - Example: When module involves calculations, R1 verifies while paid models focus on code
- **Result**: Paid tokens spent on HARD problems, free tokens handle EASY checks

### L2 Activation Protocol
- **Trigger**: Task complexity > simple/standard (auto-detected by Fiona)
- **Auto-escalation**: If L2 consensus <0.80 after 4 attempts -> prompt Ashandy for L3
- **Cost**: ~$0.50-2.00
- **Threshold**: >=0.85

---

## TIER 3: AEGIS-99 L3 -- PREMIUM + L2 POOL + FREE MODELS

> **Status: ASHANDY-ACTIVATED ONLY -- "use L3" or pre-approved for session**
> **Cost: $5-50 | Base: Premium models + FULL L2 pool + ALL free models**
> **Use case: Critical tasks, multi-day projects, Module 68-grade work**

### L3 Model Pool (Premium + L2 + Free)

| Role | Premium (NEW) | L2 Base | Free Support |
|------|--------------|---------|--------------|
| **Architect Primary (20%)** | **Claude Opus 4.8** | Nemotron 3 Ultra | Nemotron Super 120B |
| **Architect Co-Primary (15%)** | **Claude Fable 5** | GPT-5.5 | GLM 5.1 |
| **Auditor 1 Deep (15%)** | **GPT-5.5 Pro** | MiniMax M3 | DeepSeek R1 |
| **Auditor 2 Cross (10%)** | **Fable 5 (secondary)** | Qwen3.7 | DeepSeek V4 Flash |
| **Quantum/Strategy (15%)** | D-Wave Leap | -- | Nemotron Ultra |
| **Multimodal Check (10%)** | **Fable 5 (vision)** | MiniMax M3 | Kimi K2.5 |
| **Reasoning Check (5%)** | **Fable 5 (first-principles)** | -- | DeepSeek R1 |
| **Safety Margin (10%)** | Distributed | Distributed | Llama 3.3 70B |

### L3 "Nuclear Option" (Ashandy Approval Required)
- **Full 6-model L2 pool** (Nemotron, GPT-5.5, V4-Pro, D-Wave, MiniMax M3, Qwen3.7)
- **PLUS** all 4 premium models (Opus 4.8, Fable 5, GPT-5.5 Pro)
- **PLUS** all 13 free models as verification layer
- **Total: 20+ models in consensus**
- **Use**: Only for existential-risk decisions or $10K+ client projects
- **Cost**: $50-100 per consensus
- **Threshold**: >=0.95

### L3 Activation Protocol
- **Trigger**: Ashandy says "use L3" OR "approve L3 for this session"
- **Hard gate**: Fiona CANNOT activate L3 without Ashandy approval
- **Auto-escalation**: None (L3 is maximum)
- **Cost**: $5-50 (nuclear option: $50-100)
- **Threshold**: >=0.90 (>=0.95 for nuclear option)

---

## COMPARISON MATRIX

| Attribute | L1 (Free) | L2 (Standard) | L3 (Premium) | Nuclear |
|-----------|-----------|---------------|--------------|---------|
| **Models** | 13 free | 6 base + 6 free | 4 premium + 6 base + 6 free | 20+ all |
| **Cost** | $0 | $0.50-2.00 | $5-50 | $50-100 |
| **Threshold** | >=0.75 | >=0.85 | >=0.90 | >=0.95 |
| **Activation** | Ashandy says "L1" | Auto (complex tasks) | Ashandy says "L3" | Ashandy approves |
| **Auto-escalate** | To L2 if <0.70 | To L3 prompt if <0.80 | None | None |
| **Best for** | Simple chat | Coding, research | Critical builds | Existential risk |

---

## TOKEN OPTIMIZATION ACROSS TIERS

| Tier | Paid Models Do | Free Models Do | Result |
|------|---------------|----------------|--------|
| **L1** | Nothing (all free) | Everything | $0 cost |
| **L2** | Hard architecture, complex code | Syntax checks, math verification, cross-checks | 40% token savings |
| **L3** | First-principles reasoning, deep analysis | Pattern matching, basic verification, safety net | 30% token savings |
| **Nuclear** | Core decisions | Full verification layer | Maximum consensus |

---

## ESCALATION FLOW

```
Ashandy says "use L1" OR task is simple
    |
    v
AEGIS-99 L1 (13 free models)
    |
    +-- Consensus >=0.75? --> OUTPUT
    |
    +-- <0.75 after 3 tries? --> AUTO-ESCALATE TO L2

Complex task detected (coding, multi-step)
    |
    v
AEGIS-99 L2 (6 base + 6 free)
    |
    +-- Consensus >=0.85? --> OUTPUT
    |
    +-- <0.85 after 4 tries? --> PROMPT ASHANDY: "Use L3?"

Ashandy says "use L3" OR "L3 for this session"
    |
    v
AEGIS-99 L3 (4 premium + 6 base + 6 free)
    |
    +-- Consensus >=0.90? --> OUTPUT
    |
    +-- Ashandy approves "Nuclear" --> ALL 20+ models
```

---

## FREE MODEL FALLBACK CHAIN (If Primary Fails)

| If This Fails | Use This Next | Then This | Last Resort |
|---------------|--------------|-----------|-------------|
| Nemotron Ultra (NIM) | Nemotron Ultra (OpenRouter) | Nemotron Super 120B | Gemma 4 31B |
| GLM 5.1 (NIM) | GLM 5.1 (OpenRouter) | Gemma 4 31B | DeepSeek R1 |
| DeepSeek R1 (NIM) | DeepSeek R1 (OpenRouter) | DeepSeek V4 Flash | Phi-4 (Ollama) |
| Gemma 4 26B (NIM) | Gemma 4 26B (Ollama) | Qwen2.5 72B | Llama 3.1 8B |
| Kimi K2.5 (NIM) | Kimi K2.5 (OpenRouter) | Gemma 4 26B | -- |
| MiniMax M2.5 (NIM) | MiniMax M2.5 (OpenRouter) | Llama 3.3 70B | -- |

---

*System designed: 2026-06-09 | Status: PROPOSED -- awaiting Ashandy approval*
