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

*See also: [[Memory Architecture]], [[MAES - Memory Authority Enforcement System]]*
