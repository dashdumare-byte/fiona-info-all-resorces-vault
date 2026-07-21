---
tags: [turbovec, vector-index, optimization, tracked, phase-2]
date-created: 2026-06-06
source: github.com/RyanCodrai/turbovec | MIT license | 5.4k stars
---

# turbovec (Tracked Optimization)

> **Status: TRACKED -- Not integrated into build. Evaluate during Phase 2 scaling.**

---

## What It Is

Rust vector index with Python bindings. Built on Google's TurboQuant algorithm. Product Quantization (PQ) based approximate nearest neighbor (ANN).

- **GitHub**: github.com/RyanCodrai/turbovec
- **License**: MIT (commercially permissive)
- **Stars**: 5.4k, actively maintained (last release: May 30, 2026)

---

## Key Specs

| Spec | Value |
|------|-------|
| **Compression** | 16x (1536-dim FP32: 6144 bytes -> 2-bit: 384 bytes) |
| **RAM reduction** | 7.75x (10M docs: 31GB -> 4GB) |
| **Speed vs FAISS** | 12-20% faster on ARM, match-or-beat on x86 |
| **No train step** | Online ingest -- add vectors = indexed immediately |
| **Filtered search** | SIMD kernel with allowlist/bitmask |
| **License** | MIT |

---

## Build vs Runtime

### NOT in 16-Day Build
Chroma handles all vector needs for 69 modules. turbovec would need custom integration with no immediate benefit at build scale.

### YES for FIONA Runtime (Where It Shines)

| Runtime Scale | Chroma (Current) | turbovec Footprint | Savings |
|------------------|------------------|-------------------|---------|
| 10K client project embeddings | ~500MB | ~65MB | 7.7x |
| 100K creative taste vectors | ~5GB (Lightning.ai limit) | ~650MB | 7.7x |
| 500K visual reference embeddings | ~25GB (needs paid tier) | ~3.2GB | 7.7x |
| 1M multi-modal embeddings | ~50GB | ~6.4GB | 7.7x |

**Chroma + turbovec hybrid for runtime:**
- Chroma handles: metadata, multi-modal storage, filtering, CRUD
- turbovec handles: high-volume ANN search with 7.7x compression and 12-20% speedup

---

*Tracked: 2026-06-06 | Status: Phase 2 candidate | Complexity: Medium | Cost: Free*
