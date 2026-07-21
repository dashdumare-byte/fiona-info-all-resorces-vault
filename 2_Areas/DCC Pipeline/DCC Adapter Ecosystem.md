---
tags: [dcc, adapters, pipeline, 7-tools, version-gates, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt + DCC Adapters chat (LEBROV & G) analysis
---

# DCC Adapter Ecosystem

> **7 DCC tools with hard version gates. Build FAILS if any gate is not met.**
> 7 pipeline enhancements absorbed from Garrett Fry + Lebrov analysis.

---

## Version Hard Gates (BUILD FAILS IF NOT MET)

| DCC Tool | Minimum Version | API / Interface | Adapter Module |
|----------|----------------|-----------------|----------------|
| **Unreal Engine** | 5.8 | Remote Control API, EditorActorSubsystem | M32 |
| **Blender** | 5.2.0 LTS | bpy API, headless `--background` | M27 |
| **DaVinci Resolve** | 21.0 | davinci-rest REST shim | M28 |
| **Nuke** | 17.0 | Python API (changes from 16.x) | M29 |
| **Cinema 4D** | 2026.3.2 | Python API, MoGraph module | M30 |
| **Houdini** | 21.0 | hou module in hython, VEX/Python | M31 |
| **ComfyUI** | latest main branch SHA | Node-based API | M26 |

---

## Batch Build Order

### Batch A (Days 4-5) — Rate: 2/day
| Day | Module | DCC | Key Challenge |
|-----|--------|-----|---------------|
| 4 | M26 | ComfyUI | Latest SHA changes, node API stability |
| 4 | M27 | Blender 5.2.0 LTS | Headless `--background` quirks |
| 5 | M28 | DaVinci 21 | davinci-rest REST shim setup |
| 5 | M29 | Nuke 17 | Python API breaking changes from 16.x |

### Batch B (Days 6-7) — Rate: 1-2/day
| Day | Module | DCC | Key Challenge |
|-----|--------|-----|---------------|
| 6 | M30 | C4D 2026.3.2 | MoGraph module API changes |
| 7 | M31 | Houdini 21 | hython environment, VEX/Python interop |
| 7 | M32 | UE 5.8 | Remote Control API authentication |

### Day 8: Cross-Adapter Integration
- Pipeline test: intake -> process -> output across all 7 tools
- UE5 + C4D specific integration
- Headless launch verification for all

---

## 7 Pipeline Enhancements (Absorbed, Not New Modules)

From Garrett Fry + Lebrov DCC analysis — all integrated into existing adapters:

| # | Enhancement | Integrated Into | Benefit |
|---|-------------|-----------------|---------|
| 1 | Blender USDZ export for Apple ecosystem | M27 Blender adapter | Native iOS AR preview |
| 2 | DaVinci EXR deep compositing pipeline | M28 DaVinci adapter | Deep data for Nuke handoff |
| 3 | Nuke OCIO color management auto-config | M29 Nuke adapter | ACES color space consistency |
| 4 | Houdini PDG/TOPS automation hooks | M31 Houdini adapter | Procedural workflow automation |
| 5 | UE5 Movie Render Queue Python control | M32 UE5 adapter | Automated cinematic renders |
| 6 | ComfyUI custom node hot-reload | M26 ComfyUI adapter | Live workflow iteration |
| 7 | C4D XRef asset streaming optimization | M30 C4D adapter | Large scene memory efficiency |

---

## Headless Launch Matrix

| DCC | Headless Command | Verification Test |
|-----|-----------------|-------------------|
| Blender | `blender --background --python script.py` | Render test cube to PNG |
| DaVinci | REST API ping + resolve project open | Load test project, export frame |
| Nuke | `nuke -t script.py` | Execute Read->Write node graph |
| C4D | `c4dpy script.py` | Instantiate MoGraph cloner |
| Houdini | `hython script.py` (hou module) | Create sphere, save .bgeo |
| UE5 | Remote Control API HTTP request | Get editor actor list |
| ComfyUI | HTTP API workflow execution | Run txt2img workflow |

---

## Cursor Hard Gate (Step 8) for DCC Adapters

Each adapter MUST pass ALL 12 checks:
1. Zero failing tests
2. Zero critical lint errors
3. Pylint >= 8.0
4. mypy type checking passes
5. bandit security scan clean
6. Headless launch successful
7. super-smoke-test passes
8. API version matches hard gate
9. Context7 validation passes
10. AEGIS-99 >= 0.90
11. Leanstral proof (if math involved)
12. E2B sandbox execution (for M68: actual STL generation)

---

## Cursor Grind Hook Config

```
MAX_ITERATIONS=10 (DCC adapters)
MAX_ITERATIONS=5 (standard modules)
Iterate on Lints: ON
Custom commands: /review, /fix-issue, /update-deps, /security-review
```

---

## Research Before Each Adapter

Kimi Agent mode + DeepResearcher (30min before each adapter):
1. Context7: Validate exact API versions
2. Tavily: Check for breaking changes (last 6 months)
3. GitHub MCP: Find community implementations
4. E2B: Test code in sandbox before Cursor gate
5. Nemotron 1M context: Full DCC docs review

---

*See also: [[Critical Modules]], [[16-Day Build Timeline]], [[Cursor Hard Gate]]*
