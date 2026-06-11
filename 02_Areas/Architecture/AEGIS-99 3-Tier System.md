---
tags: [aegis-99, 3-tier, runtime, architecture, locked]
date-created: 2026-06-09
---

# AEGIS-99 3-Tier Runtime System (CORRECTED -- with Orchestrator)

> **Same purpose across all tiers: multi-model consensus quality gate.**
> **Only the model pool changes based on task complexity.**
> **Purpose unchanged: ensure outputs are correct, valid, and thorough.**

---

## AEGIS-99 ROLES (From Original Architecture v4.0 + v4.1)

| Role | Weight | Purpose | Source File |
|------|--------|---------|-------------|
| **Architect Primary** | 20% | Final decision-maker. Breaks ties. Sets technical direction. | v4.1 Section 1 |
| **Architect Co-Primary** | 15% | Secondary decision. Supports primary, challenges when needed. | v4.1 Section 1 |
| **Architect Co-Primary 2** | 15% | Third decision point. DeepSeek V4-Pro brings code volume. | v4.1 Section 1 |
| **Quantum Layer** | 15% | Pattern analysis, optimization suggestions, non-obvious insights. | v4.1 Section 1 |
| **Auditor 1** | 15% | Adversarial review. Finds edge cases, bugs, vulnerabilities. | v4.1 Section 1 |
| **Auditor 2** | 10% | Consistency review. Cross-checks findings, verifies alignment. | v4.1 Section 1 |
| **Orchestrator** | -- | Coordinates code generation pool. Manages parallel workflows. **GLM-5.1** | v4.0 + Locked |
| **Validator** | -- | Security validation. DeepSeek V4-Pro scan. | v4.0 + Locked |
| **Safety Margin** | 10% | Distributed reserve. Spread across all for robustness. | v4.1 Section 1 |

**Note:** Orchestrator and Validator have no fixed weight ("--" in v4.0/Locked Architecture). They are dynamically activated based on task type. Orchestrator manages the generation workflow; Validator runs security scans.

**Source evidence:**
- `FIONA_v1.7_FINAL_ARCHITECTURE_v4.0.txt` line 17: Orchestrator | GLM-5.1 | z-ai/glm-5.1 | --
- `FIONA_v1.7_FINAL_LOCKED_ARCHITECTURE.txt` line 17: Orchestrator | GLM-5.1 | z-ai/glm-5.1 | --
- `FIONA_v1.7_ARCHITECTURE_v4.1.txt`: Orchestrator REMOVED from weight table (but role still exists in GLM-5.1 description: "Coding brain, orchestrator")

---

## TIER 1: AEGIS-99 L1 -- FREE MODELS ONLY

> **Status: OPTIONAL -- activated when Ashandy says "use L1" for task/session**
> **Cost: $0 | Models: ALL FREE (NIM + OpenRouter + Ollama)**
> **Use case: Simple tasks (<2s), standard tasks (<10s), casual conversation**

### L1 Model Pool (2-3 per role, all FREE)

| Role | Primary | Secondary | Tertiary | Fallback Chain |
|------|---------|-----------|----------|----------------|
| **Architect Primary (20%)** | Nemotron 3 Ultra 550B (NIM) | Nemotron 3 Super 120B (NIM) | Gemma 4 31B (NIM) | Llama 3.3 70B |
| **Architect Co-Primary (15%)** | GLM 5.1 (NIM) | Gemma 4 31B (NIM) | DeepSeek R1 (NIM) | Qwen2.5 72B |
| **Architect Co-Primary 2 (15%)** | DeepSeek V4 Flash (OpenRouter) | DeepSeek R1 (NIM) | Gemma 4 26B (NIM) | Llama 3.3 70B |
| **Auditor 1 Deep (15%)** | DeepSeek R1 (NIM) | GLM 5.1 (NIM) | MiniMax M2.5 (NIM) | DeepSeek V4 Flash |
| **Auditor 2 Cross (10%)** | DeepSeek V4 Flash (OpenRouter) | Gemma 4 26B (NIM) | Gemma 4 26B (Ollama) | Qwen2.5 72B |
| **Quantum/Strategy (15%)** | Nemotron 3 Ultra 550B (NIM) | DeepSeek R1 (NIM) | GLM 5.1 (NIM) | Llama 3.3 70B |
| **Orchestrator (--)**| GLM 5.1 (NIM) | Gemma 4 26B (NIM) | Llama 3.1 8B (Ollama) | -- |
| **Multimodal Check (10%)** | Kimi K2.5 (NIM) | Gemma 4 26B (NIM) | Gemma 4 26B (Ollama) | -- |
| **Reasoning Check (5%)** | DeepSeek R1 (NIM) | Phi-4 (Ollama) | Llama 3.1 8B (Ollama) | -- |
| **Safety Margin (10%)** | Llama 3.3 70B (NIM) | MiniMax M2.5 (NIM) | Llama 3.1 8B (Ollama) | -- |

### L1 ALL FREE MODELS STATUS

| Model | Source | Cost | Context | Best At | AEGIS Role |
|-------|--------|------|---------|---------|------------|
| Nemotron 3 Ultra 550B | NIM | FREE | 1M | Architect, 300 t/s | Architect Primary |
| Nemotron 3 Super 120B | NIM/OpenRouter | FREE | 1M | Fallback architect | Architect Fallback |
| GLM 5.1 | NIM/OpenRouter | FREE | 200K | Coding brain, 8hr execution | Architect Co-Primary, Orchestrator |
| Gemma 4 31B Dense | NIM | FREE | 256K | #3 Arena AI, reasoning | Architect Co-Primary |
| Gemma 4 26B MoE | NIM/Ollama | FREE | 256K | Fast inference, multimodal | Auditor 2, Multimodal |
| DeepSeek R1 | NIM | FREE | 200K | Reasoning, math, 671B MoE | Auditor 1, Reasoning |
| DeepSeek V4 Flash | OpenRouter | FREE | 1M | Ultra-fast, 1M context | Architect Co-Primary 2, Auditor 2 |
| Kimi K2.5 | NIM | FREE | 256K | Multimodal, 1T MoE | Multimodal Check |
| MiniMax M2.5 | NIM/OpenRouter | FREE | 200K | Multi-agent engineering | Auditor 1, Safety |
| Llama 3.3 70B | NIM/OpenRouter | FREE | 128K | General purpose | Safety Margin |
| Qwen2.5 72B | Ollama | FREE LOCAL | 128K | Web/UI | Fallback general |
| Llama 3.1 8B | Ollama | FREE LOCAL | 128K | Ultra-fast | Orchestrator fallback |
| Phi-4 | Ollama | FREE LOCAL | 128K | Reasoning | Reasoning Check |

### L1 Activation Protocol
- **Trigger**: Ashandy says "use L1" or "use L1 for this session"
- **Orchestrator activates**: When task involves multi-step workflow or parallel model coordination
- **Auto-escalation**: If L1 consensus <0.70 after 3 attempts -> auto-switch to L2
- **Cost**: $0
- **Threshold**: >=0.75

---

## TIER 2: AEGIS-99 L2 -- STANDARD + FREE SUPPORT

> **Status: AUTO-ACTIVATED for complex tasks (coding <30s, multi-step)**
> **Cost: ~$0.50-2.00 | Base: Locked AEGIS-99 v4.1 + FREE models as support**
> **Use case: Coding tasks, research, proposals, standard creative work**

### L2 Model Pool (Base + Free Support)

| Role | Base (Locked v4.1) | Free Support (NEW) | Free Fallback |
|------|--------------------|--------------------|---------------|
| **Architect Primary (20%)** | Nemotron 3 Ultra 550B | -- | Nemotron Super 120B |
| **Architect Co-Primary (15%)** | GPT-5.5 | GLM 5.1 (handles easy sub-tasks) | Gemma 4 31B |
| **Architect Co-Primary 2 (15%)** | DeepSeek V4-Pro | DeepSeek R1 (reasoning sub-tasks) | DeepSeek V4 Flash |
| **Auditor 1 Deep (15%)** | MiniMax M3 | DeepSeek R1 (reasoning verification) | GLM 5.1 |
| **Auditor 2 Cross (10%)** | Qwen3.7 | DeepSeek V4 Flash (speed checks) | Gemma 4 26B |
| **Quantum/Strategy (15%)** | D-Wave Leap | Nemotron Ultra (pattern analysis) | DeepSeek R1 |
| **Orchestrator (--) **| GLM 5.1 (NIM FREE) | Gemma 4 26B | Llama 3.1 8B |
| **Multimodal Check (10%)** | MiniMax M3 | Kimi K2.5 (multimodal cross-check) | Gemma 4 26B |
| **Reasoning Check (5%)** | -- | DeepSeek R1 (math/logic) | Phi-4 |
| **Safety Margin (10%)** | Distributed | Llama 3.3 70B (general safety) | MiniMax M2.5 |

### L2 Token Optimization
- **GPT-5.5**: Works on DIFFICULT architectural decisions
- **GLM 5.1 (FREE)**: Handles EASY sub-tasks + Orchestrator coordination
- **DeepSeek R1 (FREE)**: Handles reasoning/math verification
- **Result**: Paid tokens on HARD problems, free tokens on EASY checks = 40% savings

### L2 Activation Protocol
- **Trigger**: Task complexity > simple/standard (auto-detected)
- **Orchestrator activates**: GLM 5.1 coordinates all models in the pool
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
| **Architect Co-Primary 2 (15%)** | **GPT-5.5 Pro** | DeepSeek V4-Pro | DeepSeek R1 |
| **Auditor 1 Deep (15%)** | -- | MiniMax M3 | DeepSeek R1 |
| **Auditor 2 Cross (10%)** | **Fable 5 (secondary)** | Qwen3.7 | DeepSeek V4 Flash |
| **Quantum/Strategy (15%)** | D-Wave Leap | -- | Nemotron Ultra |
| **Orchestrator (--) **| **Fable 5 (long-horizon)** | GLM 5.1 | Gemma 4 26B |
| **Multimodal Check (10%)** | **Fable 5 (vision)** | MiniMax M3 | Kimi K2.5 |
| **Reasoning Check (5%)** | **Fable 5 (first-principles)** | -- | DeepSeek R1 |
| **Safety Margin (10%)** | Distributed | Distributed | Llama 3.3 70B |

### L3 "Nuclear Option" (Ashandy Approval Required)
- **Full 6-model L2 pool** (Nemotron, GPT-5.5, V4-Pro, D-Wave, MiniMax M3, Qwen3.7)
- **PLUS** all 4 premium models (Opus 4.8, Fable 5, GPT-5.5 Pro)
- **PLUS** all 13 free models as verification layer
- **PLUS** Orchestrator (Fable 5 for long-horizon coordination)
- **Total: 20+ models in consensus**
- **Use**: Only for existential-risk decisions or $10K+ client projects
- **Cost**: $50-100 per consensus
- **Threshold**: >=0.95

### L3 Activation Protocol
- **Trigger**: Ashandy says "use L3" OR "approve L3 for this session"
- **Hard gate**: Fiona CANNOT activate L3 without Ashandy approval
- **Orchestrator activates**: Fable 5 for multi-hour, multi-file coordination
- **Auto-escalation**: None (L3 is maximum)
- **Cost**: $5-50 (nuclear: $50-100)
- **Threshold**: >=0.90 (nuclear: >=0.95)

---

## ORCHESTRATOR ROLE -- DETAILED

### What the Orchestrator Does (From Architecture Source)

The Orchestrator (GLM-5.1 in v4.0/Locked) is NOT a voting role in AEGIS-99 consensus. It is a **COORDINATION** role:

1. **Manages the parallel code generation pool** — decides which models generate code in parallel
2. **Routes tasks to appropriate models** — "GLM-5.1 handles coding, Qwen handles UI"
3. **Coordinates multi-model workflows** — ensures models don't duplicate work
4. **Monitors model performance** — tracks which models are succeeding/failing
5. **Adjusts pool composition** — swaps failing models for fallbacks

### Orchestrator Activation by Tier

| Tier | Orchestrator Model | When It Activates |
|------|--------------------|--------------------|
| **L1** | GLM 5.1 (NIM FREE) | When task needs 2+ free models working together |
| **L2** | GLM 5.1 (NIM FREE) | Always active — coordinates 6 base + 6 free models |
| **L3** | Fable 5 (premium) | Multi-hour, multi-file tasks requiring long-horizon planning |

### Orchestrator Weight (Why "--")

The Orchestrator has NO fixed weight because it doesn't VOTE in AEGIS-99 consensus. It MANAGES the process. Think of it as the "conductor of the orchestra" — not a musician, but the one keeping everyone in sync.

**Source:** `FIONA_v1.7_FINAL_ARCHITECTURE_v4.0.txt` line 17: Orchestrator | GLM-5.1 | -- (no weight)

---

## COMPARISON MATRIX

| Attribute | L1 (Free) | L2 (Standard) | L3 (Premium) | Nuclear |
|-----------|-----------|---------------|--------------|---------|
| **Models** | 13 free | 6 base + 6 free | 4 premium + 6 base + 6 free | 20+ all |
| **Cost** | $0 | $0.50-2.00 | $5-50 | $50-100 |
| **Threshold** | >=0.75 | >=0.85 | >=0.90 | >=0.95 |
| **Activation** | Ashandy says "L1" | Auto (complex) | Ashandy says "L3" | Ashandy approves |
| **Orchestrator** | GLM 5.1 (when needed) | GLM 5.1 (always) | Fable 5 (long-horizon) | All orchestrators |
| **Auto-escalate** | To L2 if <0.70 | To L3 prompt if <0.80 | None | None |

---

## ESCALATION FLOW

```
Ashandy says "use L1" OR task is simple
    |
    v
AEGIS-99 L1 (13 free models, Orchestrator: GLM 5.1 when needed)
    |
    +-- Consensus >=0.75? --> OUTPUT
    |
    +-- <0.75 after 3 tries? --> AUTO-ESCALATE TO L2

Complex task detected (coding, multi-step)
    |
    v
AEGIS-99 L2 (6 base + 6 free, Orchestrator: GLM 5.1 always active)
    |
    +-- Consensus >=0.85? --> OUTPUT
    |
    +-- <0.85 after 4 tries? --> PROMPT ASHANDY: "Use L3?"

Ashandy says "use L3" OR "L3 for this session"
    |
    v
AEGIS-99 L3 (4 premium + 6 base + 6 free, Orchestrator: Fable 5)
    |
    +-- Consensus >=0.90? --> OUTPUT
    |
    +-- Ashandy approves "Nuclear" --> ALL 20+ models
```

---

## FREE MODEL FALLBACK CHAIN

| If This Fails | Use This Next | Then This | Last Resort |
|---------------|--------------|-----------|-------------|
| Nemotron Ultra (NIM) | Nemotron Ultra (OpenRouter) | Nemotron Super 120B | Gemma 4 31B |
| GLM 5.1 (NIM) | GLM 5.1 (OpenRouter) | Gemma 4 31B | DeepSeek R1 |
| DeepSeek R1 (NIM) | DeepSeek R1 (OpenRouter) | DeepSeek V4 Flash | Phi-4 (Ollama) |
| Gemma 4 26B (NIM) | Gemma 4 26B (Ollama) | Qwen2.5 72B | Llama 3.1 8B |
| Kimi K2.5 (NIM) | Kimi K2.5 (OpenRouter) | Gemma 4 26B | -- |
| MiniMax M2.5 (NIM) | MiniMax M2.5 (OpenRouter) | Llama 3.3 70B | -- |

---

*System corrected: 2026-06-09 | Orchestrator role added per v4.0 + Locked Architecture*
*Sources: FIONA_v1.7_FINAL_ARCHITECTURE_v4.0.txt line 17, FIONA_v1.7_FINAL_LOCKED_ARCHITECTURE.txt line 17*
