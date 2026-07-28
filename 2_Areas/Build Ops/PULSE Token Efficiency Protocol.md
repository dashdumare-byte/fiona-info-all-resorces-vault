---
tags: [pulse, token, efficiency, budget, locked, 10-commandments]
date-created: 2026-07-22
source: PULSE-TOKEN-EFFICIENCY-COMPACTOR.md (uploaded files)
---

# PULSE — Token Efficiency Protocol

> **60-70% token reduction without quality loss.**
> **Full Integration (Option A) — 10 Commandments enforced.**
> **Critical for $250-300 budget survival.**

---

## The Problem

AI models are **token-wasteful by default**:
- 30% of output is preamble/recap filler
- Same files re-read 5-10x per session
- Full file reads when grep would suffice
- No context window budgeting
- Average read-to-output ratio: **5-10x** (target: <2.0)

On a **$250-300 budget**, this waste is the difference between completing all 69 modules and running out at module 40.

---

## The 10 Commandments (Hard Rules)

Violating any commandment triggers Module 64 (Self-Diagnostics) flag.

| # | Commandment | What It Means | Penalty |
|---|------------|---------------|---------|
| 1 | **No preamble** | Never output "Here's the solution...", "Let me explain...", or similar filler. Start with the answer. | Token waste flagged |
| 2 | **No recap** | Never summarize what was just done at the end of output. | Token waste flagged |
| 3 | **Structured over prose** | Use tables, JSON, bullet points. Avoid paragraphs when data is structured. | Format enforced |
| 4 | **Grep over cat** | Search for specific lines (`grep`, `sed`) instead of reading entire files. | Re-read flagged |
| 5 | **Never re-read** | Cache file contents after first read. Read once per session. | Re-read flagged |
| 6 | **Context window budget** | 15% system, 10% memory, 5% agents, 60% work, 10% buffer. Enforced by Orchestrator. | Overflow prevented |
| 7 | **Consolidate files** | When 3+ files share 50%+ code, merge into single file with config-driven variants. | Redundancy flagged |
| 8 | **Config-driven** | Use configuration files (JSON/YAML) instead of hardcoded values. | Hardcode flagged |
| 9 | **Lazy loading** | Only load modules when actually needed. No pre-loading entire system. | Waste flagged |
| 10 | **Measure weekly** | Track `read_to_output_ratio`. Target <2.0. Weekly audit in Module 64. | Accountability |

---

## Context Window Budget (Enforced)

```
Total context window (e.g., 128K tokens):
├─ 15% System prompt (19.2K) — Orchestrator, PULSE commandments, AEGIS-99 rules
├─ 10% Memory (12.8K) — L2 context, relevant vault sections
├─ 5%  Agents (6.4K) — Model roster, active model strings
├─ 60% Work (76.8K) — Actual task: code, documents, analysis
└─ 10% Buffer (12.8K) — Safety margin for overflow
```

**Orchestrator enforces this split.** If work section exceeds 60%, task is chunked or escalated to L3 (larger context).

---

## 7 Protocol Sections

### Section 1: Code Compaction (20-30% savings)

**Rules:**
- Dense not verbose: `x = a if c else b` not `if c: x = a else: x = b`
- Language-specific patterns: Python comprehensions, JS arrow functions
- Remove dead code immediately, don't leave commented-out blocks
- Single-letter variables only in tight scopes (loops, lambdas)

**Example:**
```python
# BEFORE (47 tokens)
def get_names(users):
    result = []
    for user in users:
        if user.is_active:
            result.append(user.name)
    return result

# AFTER (19 tokens)
def get_names(u): return [x.name for x in u if x.active]
```

### Section 2: Token-Efficient File Reading (15-20% savings)

**Rules:**
- `grep "pattern" file` not `cat file` (read specific lines)
- `head -20 file` not `cat file` (read first N lines)
- Cache file hash + content after first read
- Never read the same file twice in one session

**File read tracking:**
```python
file_cache = {}  # path -> (hash, content)

def read_file(path):
    current_hash = hash_file(path)
    if path in file_cache and file_cache[path][0] == current_hash:
        return file_cache[path][1]  # Cached, zero token cost
    content = actual_read(path)
    file_cache[path] = (current_hash, content)
    return content
```

### Section 3: Prompt/Output Compression (10-15% savings)

**Rules:**
- No greeting: "I'll help you with that" → delete
- No closing: "Let me know if you need anything else" → delete
- No markdown headers when not needed
- Use abbreviations: "AEGIS" not "AEGIS-99 Consensus Engine" after first mention
- Tables over paragraphs for data
- JSON over prose for structured output

### Section 4: File/Architecture Compaction (10-15% savings)

**Rules:**
- When 3+ files share 50%+ code → merge into one file with config-driven behavior
- Extract shared logic to utilities, don't duplicate
- Template strings for repeated patterns
- One module per file, but sub-modules as functions within that file

### Section 5: Coding Patterns (5-10% savings)

**Rules:**
- Config-driven: `model_config = {"temp": 0.7}` not `temperature = 0.7` hardcoded
- Template strings: `f"{base}/{endpoint}"` not string concatenation
- Lazy loading: `import heavy_module` inside function, not at top
- Generator expressions over lists when possible

### Section 6: Measurement (Accountability)

**Tracked metrics:**
| Metric | Target | Measured By |
|--------|--------|-------------|
| `read_to_output_ratio` | <2.0 | Langfuse traces |
| `preamble_pct` | <2% | Output analysis |
| `re_read_count` | 0 | File cache hits/misses |
| `context_overflows` | 0 | Orchestrator logs |
| `token_savings_pct` | >50% | Weekly comparison |

**Weekly audit:** Module 64 (Self-Diagnostics) runs every Sunday after L3 embedding.

### Section 7: Quality Gate (Safety)

**Rule:** Compaction must NEVER reduce output quality.

Quality checks:
- All code must still pass tests
- All documents must still be readable
- All configurations must still be valid
- No information loss from compression

**If quality drops → rollback compaction for that file, flag in Module 64.**

---

## Integration Points

### 1. System Prompt (L1 Context)

The 10 Commandments are injected into every model's system prompt:
```
[PULSE PROTOCOL — ENFORCED]
1. No preamble. Start with answer.
2. No recap. End when done.
3. Structured over prose. Tables > paragraphs.
4. Grep over cat. Search, don't read full files.
5. Never re-read. Cache after first read.
6. Context budget: 15/10/5/60/10 enforced.
7. Consolidate redundant files.
8. Config-driven, not hardcoded.
9. Lazy loading only. See [[Tool Integration — Code Mode Architecture]] — 98.7% token reduction via lazy tool loading.
10. Target read:output ratio <2.0.
```

### 2. Orchestrator Enforcement

Orchestrator monitors context window split:
- Tracks token usage per section (system, memory, agents, work, buffer)
- If work exceeds 60% → chunks task or escalates to L3
- If re-read detected → flags in Module 64
- If preamble/recap detected → strips and warns

### 3. Module 64 (Self-Diagnostics) — Weekly Audit

Every Sunday:
```
1. Collect Langfuse traces from past week
2. Calculate read_to_output_ratio for each model
3. Count preamble/recap violations
4. Count re-read violations
5. Count context overflows
6. Generate PULSE compliance report
7. If ratio >2.0: escalate to Ashandy
```

### 4. Langfuse Integration

All PULSE metrics tracked in Langfuse traces:
- `input_tokens` vs `output_tokens` per call
- `file_reads` per session
- `cache_hits` vs `cache_misses`
- `preamble_detected` flag
- `context_overflow` flag

---

## Expected Savings

| Source | Savings |
|--------|---------|
| Code compaction | 20-30% |
| Token-efficient reading | 15-20% |
| Prompt/output compression | 10-15% |
| File/architecture compaction | 10-15% |
| Coding patterns | 5-10% |
| **Total** | **60-70%** |

On $250-300 budget:
- Without PULSE: ~$450-500 actual spend (over budget)
- With PULSE: ~$150-200 actual spend (under budget, $100-150 buffer)

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Full integration (Option A) approved |
| 2026-07-22 | 10 Commandments added to System Prompt |

---

## Key Distinctions

1. **PULSE is enforced, not suggested** — violations flag in Module 64.
2. **Quality gate is absolute** — never sacrifice quality for tokens.
3. **Context budget is hard** — 60% work max, no exceptions.
4. **Weekly measurement catches drift** — models slowly revert to verbose output.
5. **PULSE saves money for better uses** — saved tokens fund L3/Nuclear tasks.
