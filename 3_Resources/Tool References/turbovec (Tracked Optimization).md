---
tags: [turbovec, vector-index, optimization, tracked, phase-2]
date-created: 2026-06-06
source: github.com/RyanCodrai/turbovec | MIT license | 5.4k stars
---

# turbovec (Tracked Optimization)

> **Status: TRACKED — Not integrated into build. Evaluate during Phase 2 scaling.**

---

## What It Is

Rust vector index with Python bindings. Built on Google's TurboQuant algorithm. Product Quantization (PQ) based approximate nearest neighbor (ANN). Alternative to FAISS — NOT a full vector database.

- **GitHub**: github.com/RyanCodrai/turbovec
- **License**: MIT (commercially permissive)
- **Stars**: 5.4k, actively maintained (last release: May 30, 2026)
- **PyPI**: `pip install turbovec`

---

## Key Specs

| Spec | Value |
|------|-------|
| **Compression** | 16x (1536-dim FP32: 6144 bytes -> 2-bit: 384 bytes) |
| **RAM reduction** | 7.75x (10M docs: 31GB -> 4GB) |
| **Speed vs FAISS** | 12-20% faster on ARM, match-or-beat on x86 |
| **No train step** | Online ingest — add vectors = indexed immediately |
| **Filtered search** | SIMD kernel with allowlist/bitmask |
| **Frameworks** | LangChain, LlamaIndex, Haystack, Agno integrations |
| **License** | MIT |

## How TurboQuant Works

1. Normalize vectors to unit directions on hypersphere
2. Random rotation -> coordinates follow predictable Beta distribution
3. Per-coordinate calibration (TQ+) -> fits shift/scale per coordinate
4. Lloyd-Max scalar quantization -> precomputed optimal buckets
5. Bit-pack -> tight integer packing (2-bit or 4-bit)
6. Length-renormalized scoring -> removes quantization bias

---

## Build vs Runtime

### NOT in 30-Day Build
| Our Stack | turbovec |
|-----------|----------|
| Chroma | Full vector DB: CRUD + metadata + multi-modal + filtering |
| turbovec | Just the index: similarity search only |

Chroma handles all vector needs for 69 modules. turbovec would need custom integration with no immediate benefit at build scale.

### YES for FIONA Runtime (Where It Shines)
Runtime is where turbovec becomes genuinely valuable:

| Runtime Scenario | Chroma Footprint | turbovec Footprint | Savings |
|-----------------|------------------|-------------------|---------|
| 10K client project embeddings | ~500MB | ~65MB | 7.7x |
| 100K creative taste vectors | ~5GB (Lightning.ai limit) | ~650MB | 7.7x |
| 500K visual reference embeddings | ~25GB (needs paid tier) | ~3.2GB | 7.7x |
| 1M multi-modal embeddings | ~50GB | ~6.4GB | 7.7x |

At runtime, embedding volume scales with:
- Client projects (each project = thousands of assets)
- Creative taste learning (every preference = stored vector)
- Visual reference library (every saved image = CLIP embedding)
- Audio transcript memory (every voice memo = text embedding)
- Cross-project pattern matching (AEGIS-99 historical votes)

**Chroma + turbovec hybrid for runtime**:
- Chroma handles: metadata, multi-modal storage, filtering, CRUD
- turbovec handles: high-volume ANN search for similarity queries
- Result: Chroma's API with turbovec's speed and compression

---

## When It Becomes Valuable (Phase 2)

---

## Integration Options (Future)

### Option 1: Chroma Backend Swap (Medium Effort)
Replace Chroma's internal HNSW index with turbovec PQ index. Chroma handles API; turbovec handles search. Needs custom Chroma integration.

### Option 2: Standalone ANN Component (Lower Effort)
Use turbovec directly for high-volume embedding stores (e.g., 500K+ visual references) while keeping Chroma for metadata-rich queries.

---

## Evaluation Trigger

**Evaluate during**: Day 15-16 performance tuning OR Month 2 runtime scaling

**Decision criteria**:
- [ ] Chroma memory usage > 3GB on Lightning.ai
- [ ] Similarity search latency > 100ms for common queries
- [ ] Need to store > 100K embeddings
- [ ] Custom integration effort < 1 day

---

*Tracked: 2026-06-06 | Status: Phase 2 candidate | Complexity: Medium | Cost: Free*
