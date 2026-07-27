---
tags: [build, critical-modules, 8-slots, module-68, module-69, locked]
date-created: 2026-06-06
source: FIONA_v1.7_CRITICAL_MODULES_LOCKED(1).txt
---

# Critical Modules — 8 Slots

> **These 8 modules get the FULL L3 Premium pool (19 models), all 3 supervisors, full overseers, and highest AEGIS thresholds.**

---

## Slot 1: Module 1 — UTM (Universal Task Manager)

| Attribute | Value |
|-----------|-------|
| **Function** | Task decomposition, DAG management, dependency resolution |
| **Why Critical** | Every other module depends on this for task routing |
| **DCC** | None (infrastructure) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.90 |
| **Build Day** | Day 1 |

---

## Slot 2: Module 11 — Orchestrator (Master Coordinator)

| Attribute | Value |
|-----------|-------|
| **Function** | Master coordinator for all 69 modules, load balancing, failover |
| **Why Critical** | If orchestrator fails, entire system stops |
| **DCC** | None (infrastructure) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.90 |
| **Build Day** | Day 1 |

---

## Slot 3: AEGIS-99 (Consensus Validation Engine)

| Attribute | Value |
|-----------|-------|
| **Function** | Mandatory gate on every output, multi-model consensus scoring |
| **Why Critical** | This IS the quality gate — if it fails, nothing ships |
| **DCC** | None (validation) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.95 (self-validation with quantum audit) |
| **Build Day** | Day 1 |

---

## Slot 4: Security (Content Filtering + Prompt Injection Protection)

| Attribute | Value |
|-----------|-------|
| **Function** | Input/output sanitization, prompt injection detection, content policy |
| **Why Critical** | One injection attack = compromised entire system |
| **DCC** | None (security) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.95 |
| **Build Day** | Day 1 |
| **Research Focus** | Latest attack vectors, OWASP LLM Top 10, adversarial prompting |

---

## Slot 5: Memory Manager (Long-term Memory, mem0 + EverMemOS)

| Attribute | Value |
|-----------|-------|
| **Function** | Persistent memory across sessions, context retention, hierarchy |
| **Why Critical** | Without memory, Fiona can't learn or maintain state |
| **DCC** | None (memory) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.90 |
| **Build Day** | Day 1 |
| **Research Focus** | Vector databases, memory architectures, context window optimization |

---

## Slot 6: DCC Adapters Batch A (4 adapters)

| Module | DCC Tool | Version | Build Day |
|--------|----------|---------|-----------|
| M26 | ComfyUI | latest main branch SHA | Day 4 |
| M27 | Blender | 5.2.0 LTS (bpy, headless --background) | Day 4 |
| M28 | DaVinci Resolve | 21.0 (davinci-rest REST shim) | Day 5 |
| M29 | Nuke | 17.0 (Python API changes from 16.x) | Day 5 |

- Rate: 2 adapters/day
- AEGIS: >=0.90 per adapter

---

## Slot 7: DCC Adapters Batch B (3 adapters)

| Module | DCC Tool | Version | Build Day |
|--------|----------|---------|-----------|
| M30 | Cinema 4D | 2026.3.2 (Python API, MoGraph) | Day 6 |
| M31 | Houdini | 21.0 (hou module in hython, VEX/Python) | Day 7 |
| M32 | Unreal Engine | 5.8 (Remote Control API, EditorActorSubsystem) | Day 7 |

- Rate: 1-2 adapters/day
- AEGIS: >=0.90 per adapter

---

## Slot 8: Module 68 — Blender 4 Dental (B4D Grillz Controller)

| Attribute | Value |
|-----------|-------|
| **Function** | Custom dental jewelry design |
| **Tolerance** | +-0.05mm |
| **Materials** | Biocompatible (NextDent C&B MFH resin) |
| **DCC** | Blender 4 (dental-specific Python API) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.95 (highest threshold) |
| **Build Day** | Day 9 (DEDICATED FULL DAY) |

### Special Protocols (STRICTER)
- [ ] Axplorer MANDATORY (pre-code math pattern discovery)
- [ ] ultrathink: ALWAYS (not conditional)
- [ ] E2B sandbox: ACTUAL STL generation test
- [ ] Leanstral: ALL tolerance math formally verified

### Research Focus
- Dental geometry standards
- STL precision requirements
- Biocompatible materials database
- 3D printing formats (NextDent C&B MFH resin)
- Dental workflow specifics

---

## Module 69 — Web App (Also Critical, Dedicated Day 10)

| Attribute | Value |
|-----------|-------|
| **Function** | Primary user touchpoint for Fiona |
| **Stack** | React/Vue frontend, Python/FastAPI backend |
| **Database** | Supabase (real-time sync) |
| **Auth** | Supabase Auth (RLS) |
| **Pool** | L3 Premium (19 models) |
| **AEGIS** | >=0.90 |
| **Build Day** | Day 10 (DEDICATED FULL DAY) |
| **Supervisor** | Codex (GPT-5.6 Terra) for web security |

---

## Summary

| Category | Count |
|----------|-------|
| Critical Slots | 8 |
| + Web App | 1 |
| **Total Critical** | **9** |
| Standard Modules | 50 |
| **Grand Total** | **69** |

---

*See also: [[30-Day Build Timeline]], [[DCC Adapter Ecosystem]], [[AEGIS-99 Consensus Engine]]*
