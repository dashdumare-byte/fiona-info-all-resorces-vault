---
tags: [memory, architecture, supabase, chroma, asi-evolve, locked]
date-created: 2026-06-06
source: FIONA_MEMORY_SYSTEM_LOCKED(1).txt + OBSIDIAN_SUPABASE_FIONA_ANALYSIS(1).txt
---

# Memory Architecture

> **4 components. Multi-modal. Semantic search. Self-learning taste engine.**
> Supabase + Chroma + Obsidian + ASI-Evolve | Skipped: Convex, Neon, Pinecone, Weaviate, Puter.js, Firebase

---

## Component Overview

| Component | Technology | Purpose | Layer |
|-----------|-----------|---------|-------|
| **Structured Data** | Supabase | Metadata, auth, real-time sync, pgvector | L2 |
| **Vector Search** | Chroma | Creative taste embeddings, multi-modal semantic search | L2 |
| **Personal Vault** | Obsidian | Ashandy's knowledge (this vault), creative direction | L1 (human) |
| **Taste Learning** | ASI-Evolve | Self-optimization, embedding tuning, preference learning | L3 |
| **File Storage** | Supabase Storage | Raw files (books, videos, images) CDN | L2 |

---

## What Makes It Special

### 1. Multi-Modal Memory
Most AI systems: text-only.
Fiona: text + visual + audio + structured.

| Type | Example | Stored In |
|------|---------|-----------|
| Text | Books, articles, notes | Supabase + Chroma |
| Visual | Mood boards, color palettes, inspiration | Chroma (CLIP embeddings) |
| Audio | Video transcripts, voice memos | Chroma (transcript + audio embeddings) |
| Structured | Module states, AEGIS scores, build logs | Supabase (PostgreSQL) |

### 2. Semantic Search (Not Keyword)
"Find me dark, moody, high-contrast visual references" -> finds by MEANING, not keywords.

### 3. Taste Learning (ASI-Evolve)
- Week 1: "dark moody" -> noir refs
- Week 4: ASI-Evolve notices you always pick high-contrast neon
- Week 8: "dark moody" -> cyberpunk-neon moody
- You correct: "Too cyberpunk" -> ASI-Evolve tunes back

### 4. Cross-Reference Intelligence
Psychology book + color theory book + your past note = SYNTHESIS, not retrieval.

---

## Capacity & Scaling

### Phase 1: Start (Months 1-3)
| Component | Tier | Capacity | Cost |
|-----------|------|----------|------|
| Supabase | Free | 500MB DB + 1GB storage | $0 |
| Chroma | Lightning.ai free | 5GB | $0 |
| **Total** | | **6.5GB** | **$0** |

### Phase 2: Growth (Months 4-12)
| Component | Tier | Capacity | Cost |
|-----------|------|----------|------|
| Supabase | Pro | 8GB DB + 100GB storage | $25/mo |
| Chroma | Lightning.ai paid | 50GB | $10-20/mo |
| **Total** | | **158GB** | **$35-45/mo** |

### Phase 3: Scale (Year 2+)
| Component | Tier | Capacity | Cost |
|-----------|------|----------|------|
| Supabase | Team OR self-hosted | 1TB+ | $599/mo OR self-hosted |
| Chroma | Dedicated | 100TB+ | $50-100/mo |
| **Total** | | **1TB+** | **$100-200/mo (self-hosted)** |

---

## Real-World Comparison

| System | Memory Type | Capacity | Multi-Modal | Self-Learning |
|--------|-------------|----------|-------------|---------------|
| ChatGPT | Text-only | ~128K context | No | No |
| Claude | Text-only | ~200K context | No | No |
| Midjourney | Image-only | ~100 style refs | Images only | No |
| **Fiona v1.7** | **Multi-modal** | **10GB-1TB+** | **Text+Image+Audio** | **ASI-Evolve** |

---

## Supabase Schema (Core Tables)

See [[MAES - Memory Authority Enforcement System]] for full schema with memory write log.

Key tables:
- `modules` — build state, AEGIS scores, git hashes
- `research_briefs` — per-model research with vector embeddings
- `aegis_votes` — consensus voting record
- `lessons` — error patterns, rules, frequency
- `memory_writes` — MAES audit trail

---

*See also: [[MAES - Memory Authority Enforcement System]], [[Creative Taste System]], [[Obsidian Supabase Analysis]]*
