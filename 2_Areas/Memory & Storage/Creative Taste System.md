---
tags: [memory, taste, asi-evolve, chroma, multi-modal, locked]
date-created: 2026-06-06
source: FIONA_CREATIVE_TASTE_STORAGE(1).txt
---

# Creative Taste System

> **How Fiona learns Ashandy's creative preferences and evolves with them.**
> Supabase + Chroma + ASI-Evolve. Multi-modal. Self-learning.

---

## The Concept

Most AI systems are static — they don't learn your evolving taste.

Fiona's taste system:
1. **Learns** from every choice you make
2. **Evolves** as your preferences change
3. **Synthesizes** across unrelated sources (psychology book + color theory)
4. **Cites sources** for every recommendation

---

## Example: Psychology Book + Color Theory Book

### Input
1. "The Psychology of Visual Perception" (PDF, 400 pages)
2. "Color Theory for Cinematographers" (PDF, 250 pages)

### Query
"Set up a scene that makes the audience feel subconscious anxiety without them knowing why."

### Fiona's Process

**Step 1: Chroma Semantic Search**
- "subconscious anxiety visual triggers" -> Psychology Ch.7: "Peripheral vision detects asymmetry before conscious awareness, triggering amygdala"
- "anxiety color palette cinematography" -> Color theory Ch.4: "Desaturated red (RGB 180,40,40) in peripheral vision increases cortisol 12%"
- "subconscious fear lighting" -> Your past note: "Client X wanted 'unease without horror' — used high contrast + desaturated warm tones"
- "anxiety cinematography reference" -> Your saved image (3 months ago): Screenshot from "Enemy" (2013) — CLIP embedding: "desaturated red, asymmetrical framing, high contrast shadows"

**Step 2: Synthesis (AEGIS-99 + ASI-Evolve)**
- Psychology: Asymmetry -> amygdala trigger
- Color theory: Desaturated red -> cortisol increase
- Your taste: High contrast + desaturated warm (from past projects)
- Visual ref: "Enemy" screenshot matches all three
- ASI-Evolve: "Ashandy's taste confirms — he picks this combo often"

**Step 3: Creative Direction Output**
- Specific lighting setup (key/fill/backlight with RGB values)
- Composition rules (asymmetrical environment)
- Color grade (desaturated 30%, lifted blacks, red channel pulled to orange-red)
- CITED SOURCES: "Psychology source: Chapter 7, 'Peripheral Asymmetry Detection'"

---

## How Taste Learning Works (ASI-Evolve)

### Week 1
- Query: "dark moody"
- Returns: noir references (default)
- You select: high-contrast neon noir

### Week 4
- ASI-Evolve notices pattern: you prefer neon elements over pure darkness
- Embedding space adjusted: "dark moody" now closer to "cyberpunk" cluster

### Week 8
- Query: "dark moody"
- Returns: cyberpunk-neon moody (learned)
- You correct: "Too cyberpunk, pull back"

### Week 9
- ASI-Evolve tunes: midpoint between noir and cyberpunk found
- Query: "dark moody" -> "neon-infused noir with restrained palette"

### Key: NEVER STATIC

---

## Technical Implementation

### Multi-Modal Embeddings
| Type | Model | Dimensions | Storage |
|------|-------|------------|---------|
| Text | sentence-transformers/all-MiniLM-L6-v2 | 384 | Chroma |
| Image | CLIP ViT-B/32 | 512 | Chroma |
| Audio | Whisper transcript -> text embedding | 384 | Chroma |

### Taste Vector
- Aggregate of all positive selections
- Updated after each user feedback
- Used to re-rank search results

### Source Citations
Every recommendation includes:
- Book title + chapter
- Page number (if available)
- Your past project reference
- Confidence score

---

## ASI-Evolve Deep Dive (Autonomous Scientific Optimization)

> **arXiv:2603.29640 (March 31, 2026) | SII-GAIR researchers**
> **FIONA's "secret sauce" — the self-improving layer that makes the system genuinely autonomous long-term.**

### The Learn-Design-Experiment-Analyze Cycle

```
LEARN  → Ingest knowledge, papers, code patterns, failure logs
  |
DESIGN → Propose new architectures, data pipelines, algorithmic improvements
  |
EXPERIMENT → Run controlled experiments to test proposals
  |
ANALYZE → Evaluate results, update knowledge base, iterate
```

### Build-Time Value

| Task | What ASI-Evolve Does |
|------|---------------------|
| DCC adapter optimization | Discovers better API patterns for Houdini, UE5, Blender headless modes |
| AEGIS-99 tuning | Auto-tunes scoring weights based on module pass/fail data |
| Model selection | Optimizes parallel gen pool model selection per module type |
| Leanstral proofs | Auto-discovers better proof patterns for Module 68 math |

### Runtime Value (Primary)

| Task | What ASI-Evolve Does |
|------|---------------------|
| Output quality | Continuously optimizes FIONA's output based on client feedback |
| Creative parameters | Auto-tunes parameters for music video production |
| B4D Grillz | Discovers better dental geometry patterns from production data |
| Body Language Shipping | Optimizes freight logistics algorithms |
| Self-improvement | Gets better every week without human touching code |

### Implementation

```
Phase: Post-build (Week 2+) — NOT on critical path
Location: Separate process on Lightning.ai or cheap VPS
Input: AEGIS-99 pass/fail logs, client feedback scores, DCC adapter metrics, Leanstral proof complexity
Output: Proposed adjustments (human reviews → approves/rejects)
Cost: Minimal (mostly compute, not API calls)
```

### Human-in-the-Loop

ASI-Evolve is **propose-only** — it never changes FIONA directly:
1. ASI-Evolve analyzes logs and proposes changes
2. Proposal sent to Ashandy with confidence score + expected impact
3. Ashandy approves or rejects
4. If approved, FIONA implements via standard build flow

---

## OpenMythos (770M Creative Narrative Generator)

> **Open-source PyTorch | Looped Transformers for non-deterministic narrative generation**
> **The "creative seasoning" layer — prevents robotic output.**

### What It Is

OpenMythos is a 770M-parameter open-source reconstruction of a speculative creative AI architecture using **Looped Transformers**. Instead of scaling parameters (bigger = better), it scales **recursively** — allowing the model to "think longer" about creative decisions.

This produces **non-deterministic, emergent narrative logic** — exactly what you want for creative output that doesn't feel "robotic."

### Key Specs

| Spec | Value |
|------|-------|
| Parameters | 770M (1B variant available) |
| Architecture | Looped Transformers (recursive depth, not width) |
| License | Open-source (PyTorch) |
| Speed | FAST on Lightning.ai, runs locally too |
| Cost | FREE (self-hosted) |

### How It Works

```
Standard LLM creative output:
  Prompt → Single pass → Output (deterministic, predictable)

OpenMythos creative output:
  Prompt → Loop 1 → Loop 2 → Loop 3 → ... → Loop N → Output
                ↑________recursive refinement_________↓
  
  Each loop adds narrative depth, emotional resonance, non-linear storytelling
  Loop count varies: simple concepts = 2-3 loops, complex narratives = 5-8 loops
```

### FIONA Integration

```
When FIONA generates creative content:
  Music video pitch → Route through OpenMythos → "Creative seasoning" applied
  DJ visual concept → Route through OpenMythos → Narrative depth added
  Grillz design presentation → Route through OpenMythos → Emotional resonance
  Client-facing output → Route through OpenMythos → Prevents "robotic" feel
  
  → Output then goes through AEGIS-99 for quality/consensus check
```

### Use Cases

| Content Type | What OpenMythos Adds |
|-------------|---------------------|
| Music video concepts | Narrative arcs, emotional beats, visual metaphors |
| DJ visuals | Thematic coherence, crowd-energy storytelling |
| B4D Grillz presentations | Artisan narrative, luxury storytelling |
| Client pitches | Compelling narratives, not just feature lists |
| Creative briefs | Rich, layered inspiration (not sterile descriptions) |

### Build vs Runtime

| Phase | Value | Status |
|-------|-------|--------|
| Build | LOW — not needed for module building | Skip |
| Runtime | **HIGH** — transforms "AI-generated" into "AI-created" | **Activate Day 1 of runtime** |

### Deployment

```bash
# Deploy as microservice on Lightning.ai (lightweight, 770M)
docker run -p 8000:8000 openmythos:latest

# FIONA calls it via HTTP API
curl -X POST http://localhost:8000/generate \
  -H "Content-Type: application/json" \
  -d '{"prompt": "music video concept: dark moody neon", "loops": 5}'
```

---

*See also: [[Memory Architecture]], [[MAES - Memory Authority Enforcement System]], [[AI Types Catalog]]*
