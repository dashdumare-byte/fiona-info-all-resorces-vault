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

## 8 Pre-Seeded Known Issues (Prevent These Failures)

These are documented failure modes from prior DCC adapter builds. Each adapter build MUST account for these:

| # | DCC | Known Issue | Fix / Workaround | Verification |
|---|-----|-------------|-------------------|--------------|
| 1 | **DaVinci Resolve 21** | GUI dependency — Resolve refuses to launch without display server | Use **davinci-rest REST shim** (headless API server). Never launch full Resolve in container. | REST ping test |
| 2 | **Houdini 21** | hou module only available inside hython interpreter, NOT standard Python | Always use **`hython`** (not `python`) to run Houdini scripts. `hou` is not pip-installable. | `hython -c "import hou; print(hou.__version__)"` |
| 3 | **Nuke 17** | Breaking API changes from 16.x — node creation syntax changed | Check API version at runtime: `nuke.NUKE_VERSION_MAJOR`. Use version-gated code paths. | Context7 validation |
| 4 | **Cinema 4D 2026.3.2** | Tencent Cloud auth requirement blocks headless operation in some regions | Use **HuggingFace fallback** for C4D Python SDK download. Pre-download SDK before container build. | SDK import test |
| 5 | **Unreal Engine 5.8** | `EditorLevelLibrary` is deprecated in 5.7+ — scripts using it will fail | Use **`EditorActorSubsystem`** (new API). Search/replace all `EditorLevelLibrary` refs before build. | Actor list retrieval test |
| 6 | **Blender 5.2.0** | Headless mode **REQUIRES** `--background` flag — silently hangs without it | Always include `--background` in launch command: `blender --background --python script.py` | Render test cube |
| 7 | **ComfyUI, DaVinci, Houdini, C4D** | These 4 DCCs need **custom MCP servers built from scratch** (no existing MCP) | Budget 2-3 days per custom MCP. Use TypeScript with typed contracts. Test headless before integration. | MCP server health check |
| 8 | **ComfyUI** | Default video generation is slow — need optimized model | Use **LTX Video Fast** as primary video generation model. Configure in ComfyUI workflow JSON. | Video generation speed test |

**All 8 issues must be verified passing before the DCC adapter is considered complete.**

---

## DCC License Costs (Purchase After Build — Day 31+)

⚠️ **Do NOT purchase before build. Free/trial versions sufficient for build phase.**

| DCC | License | Cost | When to Buy | Education Discount |
|-----|---------|------|-------------|-------------------|
| **DaVinci Resolve** | Studio | $295 one-time | Day 31+ | Blackmagic education program |
| **Houdini** | Education | ~$75/year | Day 31+ | Verify student status |
| **Nuke** | Education | ~$99/year | Day 31+ | Verify via Foundry |
| **Cinema 4D** | — | Via SheerID | Day 31+ | Student verification required |
| **Blender** | FREE | $0 | — | Always free |
| **ComfyUI** | FREE | $0 | — | Open source |
| **Unreal Engine** | FREE | $0 | — | Free until $1M revenue |

**Total DCC license cost: ~$470 first year** (Resolve $295 + Houdini $75 + Nuke $99)

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

*See also: [[Critical Modules]], [[30-Day Build Timeline]], [[Cursor Hard Gate]], [[Tool Integration — Code Mode Architecture]] — 7 custom DCC MCP servers use lazy-loading (98.7% token reduction)*
