---
tags: [embedding, harrier, 3-tier, memory, vector-search, locked]
date-created: 2026-07-22
---

# Harrier — 3-Tier Embedding System

> **Replaces single-model embedding with tiered system optimized for speed/quality tradeoffs.**
> **L3 Deep runs weekly (Sunday 3 AM) AND on-demand via Ashandy command.**
> Last updated: 2026-07-22

---

## Architecture Overview

| Tier | Model | Size | Speed | Vector Dim | Hardware | When Used |
|------|-------|------|-------|-----------|----------|-----------|
| **L1 Inline** | **GTE-Small** | 270M | **<1ms** per query | 384 | CPU only | Real-time AEGIS-99 routing, every chat response |
| **L2 Batch** | **BGE-Large** | 0.6B | **~10ms** per query | 1024 | Optional GPU | Document ingestion, hourly vault sync |
| **L3 Deep** | **NV-Embed-v2 Q4** | 27B Q4 | **~200ms** per query | 4096 | GPU (14GB VRAM) | Weekly re-embedding + on-demand via Ashandy command |

---

## Tier 1: Inline (270M) — Real-Time

**Model:** `thenlper/gte-small` or `BAAI/bge-small-en-v1.5`
**Speed:** <1ms per query on CPU
**Vector dimension:** 384
**Storage:** Chroma (in-memory for hot queries)

### When It Runs
- Every AEGIS-99 model routing decision
- Every chat response retrieval
- Real-time similarity checks during conversations
- Quick vault lookups (< 100 documents)

### Why This Model
- GTE-Small is optimized for retrieval speed
- 384-dim vectors are compact — fast cosine similarity
- Runs on CPU with zero latency impact
- Good enough for routing decisions where exact semantic nuance isn't critical

### Integration Points
- **AEGIS-99:** L1 embeddings for fast tier selection (L1/L2/L3)
- **Smart Routing:** Real-time task-to-model matching
- **Chat responses:** Quick context retrieval

---

## Tier 2: Batch (0.6B) — Standard Processing

**Model:** `BAAI/bge-large-en-v1.5`
**Speed:** ~10ms per query (GPU), ~50ms (CPU)
**Vector dimension:** 1024
**Storage:** Chroma (persistent collection)

### When It Runs
- Hourly document processing (Obsidian sync)
- New module ingestion during build
- Standard research document indexing
- Vault-wide similarity searches (100-10,000 documents)

### Why This Model
- BGE-Large is the gold standard for general retrieval
- 1024-dim vectors capture significantly more nuance than 384
- Handles longer documents better (up to 512 tokens)
- Batch processing means 10ms latency is acceptable

### Integration Points
- **Memory Architecture:** Primary document store in Chroma
- **Research Mandate:** Document similarity during research
- **Build Flow:** Module indexing as modules are completed
- **Obsidian Sync:** Hourly vault embedding update

---

## Tier 3: Deep (27B Q4) — Semantic Understanding

**Model:** `nvidia/NV-Embed-v2` (Q4 quantized via GPTQ/AWQ)
**Speed:** ~200ms per query (GPU)
**Vector dimension:** 4096
**Storage:** Supabase pgvector (persistent, searchable)

### When It Runs
- **Weekly:** Every Sunday 3:00 AM — full vault re-embedding
- **On-demand:** When Ashandy says "run deep embedding" or "re-embed vault"
- **Post-major-change:** After significant architecture updates

### Why This Model
- NV-Embed-v2 is the strongest open embedding model available
- 4096-dim vectors capture deep semantic relationships
- Q4 quantization reduces from ~54GB to ~14GB VRAM
- Catches nuance that 270M/0.6B models completely miss

### Weekly Auto-Run Schedule
```
Sunday 3:00 AM:
1. Stop all non-critical FIONA processes
2. Load NV-Embed-v2 Q4 into GPU memory
3. Re-embed all vault documents (full 69-module index)
4. Update Supabase pgvector table
5. Run AEGIS-99 consistency check on new embeddings
6. Log quality metrics (cosine similarity distribution)
7. Resume normal operations
```

### On-Demand Trigger
- Ashandy says: "run deep embedding" or "re-embed vault" or "Harrier L3"
- FIONA auto-detects major architecture changes (>10 files modified)
- Post-model-roster updates (new models added)

### Integration Points
- **Memory Architecture:** Deep semantic index in Supabase
- **Build Flow:** Weekly quality assurance check
- **Module 64 (Self-Diagnostics):** Embedding drift detection
- **Research Mandate:** Deep research synthesis

---

## Hardware Requirements

| Tier | Minimum | Recommended | Lightning.ai |
|------|---------|-------------|--------------|
| L1 Inline | Any CPU | Same | Always available |
| L2 Batch | 4GB RAM | GPU (T4) | Free tier GPU |
| L3 Deep | GPU 14GB VRAM | A100 40GB | Free tier A100 |

**L3 runs on Lightning.ai free tier overnight (Sunday 3 AM).** No additional cost.

---

## Storage Architecture

```
┌─────────────────────────────────────────────────────────┐
│  L1 Inline (GTE-Small, 384-dim)                         │
│  └── Chroma in-memory hot cache                          │
│  └── ~100 most recent queries + responses                │
├─────────────────────────────────────────────────────────┤
│  L2 Batch (BGE-Large, 1024-dim)                         │
│  └── Chroma persistent collection                        │
│  └── All vault documents + module code                   │
├─────────────────────────────────────────────────────────┤
│  L3 Deep (NV-Embed-v2, 4096-dim)                        │
│  └── Supabase pgvector                                   │
│  └── Full vault + deep semantic relationships            │
└─────────────────────────────────────────────────────────┘
```

---

## Quality Comparison

| Task | L1 (270M) | L2 (0.6B) | L3 (27B) | Winner |
|------|-----------|-----------|----------|--------|
| Fast routing | ✅ <1ms | ⚠️ 10ms | ❌ 200ms | **L1** |
| Document retrieval | ⚠️ Okay | ✅ Good | ✅ Best | **L2/L3** |
| Semantic similarity | ❌ Weak | ✅ Good | ✅ Excellent | **L3** |
| Long document handling | ❌ 256 tok | ✅ 512 tok | ✅ 8192 tok | **L3** |
| Cross-lingual | ❌ English only | ✅ Multilingual | ✅ Multilingual | **L2/L3** |
| VRAM usage | 0 | 0-2GB | 14GB | **L1** |

---

## Implementation Notes

### Installation
```bash
# L1 Inline
pip install sentence-transformers
# Model: thenlper/gte-small

# L2 Batch
# Model: BAAI/bge-large-en-v1.5 (same library)

# L3 Deep
pip install transformers accelerate optimum[onnxruntime]
# Model: nvidia/NV-Embed-v2 (Q4 via AutoGPTQ)
# Requires: GPU with 14GB+ VRAM
```

### Chroma Configuration
```python
import chromadb

chroma_client = chromadb.PersistentClient(path="./chroma_db")

# L1 collection (hot cache)
l1_collection = chroma_client.get_or_create_collection("harrier_l1_inline")

# L2 collection (persistent)
l2_collection = chroma_client.get_or_create_collection("harrier_l2_batch")
```

### Supabase pgvector (L3)
```sql
-- Enable pgvector
CREATE EXTENSION IF NOT EXISTS vector;

-- L3 deep embeddings table
CREATE TABLE harrier_l3_deep (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    document_id TEXT NOT NULL,
    content TEXT,
    embedding vector(4096),
    model_version TEXT DEFAULT 'nv-embed-v2-q4',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create index for fast similarity search
CREATE INDEX ON harrier_l3_deep USING ivfflat (embedding vector_cosine_ops);
```

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Initial 3-Tier Harrier Embedding System |
| 2026-07-22 | L3 Deep: Weekly (Sunday 3 AM) + on-demand via Ashandy command |

---

## Key Distinctions

1. **L1 is NOT a replacement for L2/L3** — it's a speed-optimized cache for real-time decisions.
2. **L2 is the workhorse** — handles 90% of embedding tasks during normal operation.
3. **L3 is for quality assurance** — weekly deep re-embedding catches drift that L2 misses.
4. **All three tiers coexist** — not a progression. Each serves a different latency/quality need.
5. **L3 weekly auto-run** happens Sunday 3 AM. **L3 on-demand** requires Ashandy explicit command.
