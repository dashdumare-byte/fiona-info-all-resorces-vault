---
tags: [memory, risk-6, maes, authority, write-protocol, closed, layer-2]
date-created: 2026-06-06
source: FIONA_R3_R6_RIGOROUS_CROSS_ANALYSIS.md + FIONA_MEMORY_SYSTEM_LOCKED(1).txt
---

# MAES: Memory Authority Enforcement System

> **Risk 6 CLOSED. Write protocol FSM preventing memory corruption, hallucinated state, and zombie entries.**
> 3-layer memory with authority hierarchy and formal verification state machine.

---

## The Problem (Risk 6)

Without a memory authority hierarchy:
- Multiple models could write conflicting state
- No way to distinguish "real" memory from hallucinated entries
- Zombie entries (stale state) accumulate
- Memory corruption cascades into wrong decisions

**Before MAES**: No write protocol. Any model could write anywhere.

**After MAES**: Formal FSM with 4 states, authority levels, and rollback capability.

---

## Memory Architecture (3 Layers)

| Layer | Technology | Purpose | Access |
|-------|-----------|---------|--------|
| **L1: Hot** | mem0 | Session state, working memory | All models (read/write per authority) |
| **L2: Structured** | Supabase + Chroma | Persistent data, embeddings, auth | Supervisors + designated models |
| **L3: Deep** | Auto Dream (ASI-Evolve) | Taste learning, long-term patterns | ASI-Evolve only (autonomous) |

### Components
| Component | Technology | Role |
|-----------|-----------|------|
| Supabase | PostgreSQL + pgvector + realtime | Structured data, metadata, auth, RLS |
| Chroma | Vector DB (self-hosted) | Creative taste embeddings, semantic search |
| Supabase Storage | CDN | Raw files (books, videos, images) |
| Obsidian | Local Markdown vault | Ashandy's personal knowledge (this vault) |
| ASI-Evolve | Self-hosted engine | Taste learning, embedding optimization |

---

## Write Protocol FSM

```
        +--------+    write request    +----------+
        |  IDLE  | ------------------> | WRITING  |
        +--------+                     +----------+
                                          |
                                          | write complete
                                          v
+-----------+   validation FAIL    +-----------+   validation PASS    +----------+
| ROLLED    | <------------------- | VALIDATING| ------------------> | COMMITTED|
|  BACK     |                      +-----------+                     +----------+
+-----------+                                                            |
     |                                                                   |
     +-------------------- retry from IDLE <-----------------------------+
```

### States

| State | Description | Who Can Trigger |
|-------|-------------|-----------------|
| **IDLE** | No write in progress | Any (read request) |
| **WRITING** | Write operation in progress | Authority >= module's write_level |
| **VALIDATING** | Lean 4 proof / cross-model verification in progress | Auto-transition from WRITING |
| **COMMITTED** | Write validated and persisted | Auto on validation PASS |
| **ROLLED_BACK** | Write failed validation, reverted | Auto on validation FAIL |

### Validation Rules
- **Standard modules**: 2-model cross-check
- **Critical modules**: 3-model + Lean 4 proof
- **Module 68**: Full 9-model + Leanstral + E2B sandbox
- **AEGIS-99 state changes**: All 6 AEGIS models must confirm

---

## Memory Authority Hierarchy

| Authority Level | Role | Write Scope |
|-----------------|------|-------------|
| **Level 5: Ashandy** | Human-in-the-loop | Override any write, emergency rollback, policy changes |
| **Level 4: Nemotron** | AEGIS Architect Primary | AEGIS score finalization, architectural state |
| **Level 3: Supervisors** | Claude Code, Codex, OpenCode | Module state transitions, review annotations |
| **Level 2: Build Pool** | **GLM-5.2**, GLM-5.1, GPT-5.5, Opus 4.6 | Standard module writes, code generation output |
| **Level 1: Research Pool** | Kimi K2.6, DeepSeek V4-Pro | Research briefs, preliminary findings |
| **Level 0: Overseers** | Pi, Goose | Log entries, health check data, error flags |

### Conflict Resolution
Higher authority always wins. Same authority: AEGIS-99 tie-breaker. Deadlock: F-GARP protocol.

---

## Write Protocol Rules

### Rule 1: Authority Check
Before any write: verify writer's authority >= module's required_write_level.

### Rule 2: State Validation
All writes go through VALIDATING state before COMMITTED.

### Rule 3: Rollback on Fail
Validation fail -> automatic ROLLED_BACK -> retry from IDLE with adjusted approach.

### Rule 4: Audit Trail
Every write logged: author, timestamp, authority level, validation result, rollback reason (if applicable).

### Rule 5: Ashandy Override
Level 5 can override any state, any time, with single command.

---

## Supabase Schema (Proposed)

```sql
-- Modules
CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT CHECK (type IN ('infrastructure', 'dcc_adapter', 'standard', 'critical')),
    status TEXT CHECK (status IN ('idle', 'writing', 'validating', 'committed', 'rolled_back')),
    aegis_score FLOAT CHECK (aegis_score >= 0 AND aegis_score <= 1),
    git_hash TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Research briefs with embeddings
CREATE TABLE research_briefs (
    id SERIAL PRIMARY KEY,
    module_id INT REFERENCES modules(id),
    model_name TEXT NOT NULL,
    content TEXT NOT NULL,
    embedding VECTOR(384),
    confidence FLOAT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- AEGIS votes
CREATE TABLE aegis_votes (
    id SERIAL PRIMARY KEY,
    module_id INT REFERENCES modules(id),
    model_name TEXT NOT NULL,
    score FLOAT NOT NULL,
    vote TEXT NOT NULL,
    timestamp TIMESTAMPTZ DEFAULT NOW()
);

-- Lessons learned
CREATE TABLE lessons (
    id SERIAL PRIMARY KEY,
    module_type TEXT,
    error_pattern TEXT,
    rule TEXT NOT NULL,
    frequency INT DEFAULT 1,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Memory write log (MAES audit trail)
CREATE TABLE memory_writes (
    id SERIAL PRIMARY KEY,
    module_id INT REFERENCES modules(id),
    author TEXT NOT NULL,
    authority_level INT CHECK (authority_level >= 0 AND authority_level <= 5),
    old_state TEXT,
    new_state TEXT,
    validation_result TEXT,
    rollback_reason TEXT,
    timestamp TIMESTAMPTZ DEFAULT NOW()
);
```

---

*Risk 6 Status: CLOSED | Resolved: 2026-05-25 | Research: Opus 4.7 + Gemini 3.5 + Kimi K2.6*
