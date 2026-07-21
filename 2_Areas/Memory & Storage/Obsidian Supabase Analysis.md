---
tags: [obsidian, supabase, analysis, comparison, locked]
date-created: 2026-06-06
source: OBSIDIAN_SUPABASE_FIONA_ANALYSIS(1).txt
---

# Obsidian Supabase Analysis

> **Why we chose this combo. What each does. What we skipped.**

---

## Final Decision

| Tool | Role | Status |
|------|------|--------|
| **Obsidian** | Ashandy's personal knowledge vault (this vault) | LOCKED |
| **Supabase** | Fiona's structured memory + RAG backend | LOCKED |
| **Chroma** | Vector embeddings, creative taste search | LOCKED |
| **ASI-Evolve** | Taste learning engine | LOCKED |

**Skipped**: Convex, Neon, Pinecone, Weaviate, Puter.js, Firebase

---

## Obsidian (This Vault)

### What It Is
- Local-first Markdown note-taking
- Plugin ecosystem (mcp-obsidian, Git sync, Mind Matrix)
- Graph view of connections
- Works offline
- Files are plain Markdown on filesystem

### For FIONA Build
**Pros**: Markdown perfect for architecture docs, local-first (no internet needed), graph view for dependencies, Git tracks well, mcp-obsidian for AI access
**Cons**: Not a database, no API without plugins, single-user focused

### For FIONA Runtime
**Pros**: Perfect for Ashandy's personal KB, client notes, creative ideas
**Cons**: Not suitable for Fiona's autonomous memory, no programmatic write

### Verdict: Ashandy's knowledge + AI query interface (via mcp-obsidian)

---

## Supabase

### What It Is
- Open-source Firebase alternative
- PostgreSQL + pgvector + realtime subscriptions
- Auth, storage, edge functions
- Row Level Security (RLS)
- Free tier: 500MB DB + 1GB storage

### For FIONA Build
**Pros**: Robust structured data, pgvector for semantic search, realtime for overseers, RLS for multi-agent, generous free tier
**Cons**: Requires schema design, SQL knowledge, pgvector scale untested

### For FIONA Runtime
**Pros**: Perfect long-term memory, vector search, realtime sync, auth
**Cons**: Costs scale, cloud dependency

### Verdict: Fiona's structured memory + RAG backend

---

## Why Not Alternatives

| Alternative | Why Skipped |
|-------------|-------------|
| **Puter.js** | Too simple, not enough control for multi-agent |
| **Convex** | Proprietary, less mature than Postgres |
| **Neon** | No auth, no storage, no realtime (need to build separately) |
| **Firebase** | NoSQL doesn't fit structured module data, no vector search |
| **Pinecone/Weaviate/Chroma alone** | Need separate DB for structured data |

---

## Supabase Schema

```sql
-- Core tables (see MAES for memory write log)
modules (id, name, type, status, aegis_score, git_hash, created_at)
research_briefs (id, module_id, model_name, content, embedding, confidence)
aegis_votes (id, module_id, model_name, score, vote, timestamp)
lessons (id, module_type, error_pattern, rule, frequency)
build_logs (id, module_id, step, status, timestamp, trace_id)
runtime_queries (id, query_text, embedding, response, task_complexity)
memory_writes (id, module_id, author, authority_level, old_state, new_state, validation_result, timestamp)
virus_incidents (id, tier, model_name, description, resolution, timestamp)
```

---

## Where Each Fits

| Use Case | Tool |
|----------|------|
| Ashandy's architecture notes | Obsidian (this vault) |
| Module build states | Supabase |
| AEGIS-99 scores | Supabase |
| Research brief embeddings | Supabase pgvector |
| Lessons learned | Supabase |
| Build logs | Langfuse |
| Runtime client queries | Supabase RAG |
| Creative inspiration | Obsidian + OpenMythos |

---

*See also: [[Memory Architecture]], [[MAES - Memory Authority Enforcement System]], [[Creative Taste System]]*
