---
tags: [modules, lebrov, garrett-fry, comfyui, houdini, lora, controlnet, asset-tracking]
date-created: 2026-07-28
source: DOCX "Fiona DCC Adapters chat (LEBROV & G)"
---

# Additional Modules — Lebrov & Garrett Integration

> **7 new modules extracted from Garrett Fry's (creative control) and Lebrov/LMI's (Houdini pipeline) workflows. These modules expand FIONA's 69-module architecture with production-proven patterns.**

---

## Module Overview

| # | Module Name | Source | Purpose | Priority |
|---|-------------|--------|---------|----------|
| M70 | **ControlNet Enforcement Gate** | Garrett Fry | Hard requirement: no ComfyUI generation without control images | 🔴 CRITICAL |
| M71 | **LoRA Training Trigger** | Garrett Fry | Train custom LoRAs on client brand assets | 🔴 CRITICAL |
| M72 | **Houdini Tag-Based Bake Dispatcher** | Lebrov/LMI | PDG/TOPs template with per-tag ORBX/USD/EXR export | 🟠 HIGH |
| M73 | **Frame Chunk Scheduler** | Lebrov/LMI | Split animation into 10-25 frame chunks, distribute to render farm | 🟠 HIGH |
| M74 | **Project Asset DB** | Garrett Fry | Lightweight shot tracking (replaces Prism) | 🟠 HIGH |
| M75 | **Multi-DCC Assembly Engine** | Lebrov/LMI | Assemble baked elements into Nuke/UE5/DaVinci | 🟡 MEDIUM |
| M76 | **Research Pattern Ingestion API** | Both | Post-build research ingestion — new patterns → live templates | 🟡 MEDIUM |

**Total modules: 69 + 7 = 76** (but M70-M76 are tracked as "post-v1.7" or can replace existing placeholder modules)

---

## M70: ControlNet Enforcement Gate 🔴

**Source:** Garrett Fry's "Creative Control" doctrine
**Core Principle:** "AI video generation without control images is amateur hour."

### What It Does
Before ANY image/video generation is approved, AEGIS-99 checks: **does this workflow have control inputs?**

### Hard Gate Rules
| Condition | Action |
|-----------|--------|
| Generation has NO control images (depth/Canny/layout/pose) | **BLOCKED** — AEGIS-99 rejects |
| Generation has control images from 3D scene | **APPROVED** — passes gate |
| Control images match scene geometry | **BONUS** — higher AEGIS score |
| Prompt-only generation attempted | **BLOCKED + logged** — flagged in security report |

### Control Image Pipeline
```
3D Scene (Blender/C4D/Houdini)
    |
    v
Export Control Maps:
    ├── Depth map (automatic from 3D camera)
    ├── Canny edges (object outlines)
    ├── Normal map (surface orientation)
    ├── Layout guide (scene composition)
    └── Pose map (character positions, if applicable)
    |
    v
Feed into ComfyUI as conditioning
    |
    v
Generate AI video/image WITH control guidance
    |
    v
AEGIS-99 validates control match
```

### Implementation
```python
class ControlNetGate:
    REQUIRED_CONTROLS = {"depth", "canny", "normal", "layout"}
    
    def validate(self, workflow: ComfyUIWorkflow) -> GateResult:
        controls = workflow.get_control_inputs()
        
        missing = self.REQUIRED_CONTROLS - controls.keys()
        if missing:
            return GateResult(
                passed=False,
                reason=f"Missing control images: {missing}",
                severity="CRITICAL",
                action="BLOCK_GENERATION"
            )
        
        # Validate control quality
        for name, image in controls.items():
            if image.resolution < (512, 512):
                return GateResult(
                    passed=False,
                    reason=f"Control image {name} too low resolution: {image.resolution}",
                    severity="WARNING"
                )
        
        return GateResult(passed=True, aegis_bonus=+0.05)
```

**Build Phase:** Day 4-5 (with ComfyUI adapter)
**Cost:** $0 (uses existing ComfyUI pipeline)

---

## M71: LoRA Training Trigger 🔴

**Source:** Garrett Fry's LoRA training methodology
**Purpose:** Train custom LoRAs on client brand assets for consistent character/product representation

### What It Does
1. Watches `assets/client/` folder for new brand assets
2. Triggers LoRA training when new assets detected
3. Versions the trained LoRA
4. Injects trained LoRA into all downstream ComfyUI workflows

### Trigger Conditions
| Event | Action |
|-------|--------|
| New client logo uploaded | Trigger logo LoRA training |
| New product photos uploaded | Trigger product LoRA training |
| New character reference uploaded | Trigger character LoRA training |
| Client requests "brand consistency" | Scan all assets → train comprehensive LoRA |

### Training Pipeline
```
Asset Upload
    |
    v
Preprocess Images (resize, caption, tag)
    |
    v
Train LoRA (Kohya_ss or AI-Toolkit via API)
    ├── Training time: 20-60 minutes
    ├── Output: .safetensors LoRA file
    └── Version: auto-incremented (v1, v2, etc.)
    |
    v
Validate LoRA (test generations)
    |
    v
Version in Asset DB
    |
    v
Inject into ComfyUI workflows (all downstream)
```

### Build Phase:** Day 10-12 (after ComfyUI adapter is stable)
**Cost:** ~$2-5 per training run (GPU time on RunPod or local)

---

## M72: Houdini Tag-Based Bake Dispatcher 🟠

**Source:** Lebrov/LMI Octane Pipeline — "Each tag is evaluated and exported as its own ORBX file"
**Purpose:** Only re-bake what changed — massive time savings

### What It Does
1. Tags every Houdini element (character, environment, FX, lighting)
2. Watches for upstream SOP changes
3. Only re-bakes tags that changed
4. Exports to ORBX/USD/EXR automatically

### Tag System
| Tag | Elements | Bake Output |
|-----|----------|-------------|
| `character` | Characters, creatures | Character ORBX |
| `environment` | Terrain, buildings, props | Environment ORBX |
| `vegetation` | Trees, plants, grass | Vegetation ORBX |
| `fx` | Fire, smoke, particles | FX ORBX (per-frame) |
| `lighting` | Lights, HDRIs | Lighting EXR |
| `camera` | Camera rigs, animations | Camera USD |

### Change Detection
```python
class TagBakeDispatcher:
    def on_sop_change(self, changed_sops: List[SOP]):
        affected_tags = set()
        
        for sop in changed_sops:
            # Which tags does this SOP affect?
            tag = self.get_tag_for_sop(sop)
            affected_tags.add(tag)
        
        # Only re-bake affected tags
        for tag in affected_tags:
            self.rebake_tag(tag)
        
        log.info(f"Re-baked {len(affected_tags)} tags: {affected_tags}")
```

**Performance:** 250GB+ scene → 1.5GB final upload (only changed tags)
**Build Phase:** Day 6-7 (with Houdini adapter)
**Cost:** $0 (uses Houdini PDG/TOPs native)

---

## M73: Frame Chunk Scheduler 🟠

**Source:** Lebrov/LMI — "10 to 25 frames per chunk, minimum split of 5 frames"
**Purpose:** Distribute animation rendering across multiple workers

### What It Does
1. Splits animation timeline into 10-25 frame chunks
2. Distributes chunks to available render workers
3. Monitors progress
4. Assembles completed frames into final sequence

### Chunk Size Logic
| Frame Count | Chunk Size | Workers Needed |
|-------------|-----------|----------------|
| 1-25 frames | Render as single job | 1 |
| 26-100 frames | 25 frames per chunk | 2-4 |
| 101-300 frames | 20 frames per chunk | 5-15 |
| 300+ frames | 15 frames per chunk | 20+ |

### Worker Distribution
```
Frame Range: 1-300
Chunk Size: 20 frames
Chunks: 1-20, 21-40, 41-60, ... 281-300 (15 chunks)

Workers Available: RunPod GPU 1-5
Distribution:
    Worker 1: Chunks 1-3 (frames 1-60)
    Worker 2: Chunks 4-6 (frames 61-120)
    Worker 3: Chunks 7-9 (frames 121-180)
    Worker 4: Chunks 10-12 (frames 181-240)
    Worker 5: Chunks 13-15 (frames 241-300)

Assembly: When all chunks complete → merge into final EXR sequence
```

**Build Phase:** Day 8-10 (after DCC adapters stable)
**Cost:** Variable (depends on render farm usage, ~$5-20 per 300-frame job)

---

## M74: Project Asset DB 🟠

**Source:** Garrett Fry's Prism-style versioning
**Purpose:** Lightweight shot tracking — every render, comp, and workflow versioned

### Schema
```sql
-- Projects
CREATE TABLE projects (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    client TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    status TEXT DEFAULT 'active'
);

-- Shots
CREATE TABLE shots (
    id TEXT PRIMARY KEY,
    project_id TEXT REFERENCES projects(id),
    name TEXT NOT NULL,
    description TEXT,
    status TEXT DEFAULT 'pending'
);

-- Assets (renders, comps, workflows)
CREATE TABLE assets (
    id TEXT PRIMARY KEY,
    shot_id TEXT REFERENCES shots(id),
    type TEXT CHECK(type IN ('render', 'comp', 'workflow', 'lora', 'control_image')),
    version INTEGER DEFAULT 1,
    filepath TEXT NOT NULL,
    metadata JSONB,
    created_by TEXT,  -- Which supervisor/model
    aegis_score REAL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Tags
CREATE TABLE asset_tags (
    asset_id TEXT REFERENCES assets(id),
    tag TEXT NOT NULL,
    PRIMARY KEY (asset_id, tag)
);
```

### What It Tracks
- Every ComfyUI workflow version
- Every render output (with AEGIS-99 score)
- Every LoRA training run
- Every control image set
- Dependencies between assets (this render needs that workflow)

**Build Phase:** Day 2-3 (infrastructure module)
**Cost:** $0 (SQLite is free, runs on Lightning.ai)

---

## M75: Multi-DCC Assembly Engine 🟡

**Source:** Lebrov/LMI — "Scene compiler mindset"
**Purpose:** Treat UE5, Nuke, DaVinci as "compilers" that assemble pre-baked elements

### Assembly Targets
| Target DCC | Input Elements | Output |
|------------|---------------|--------|
| **Nuke 17** | EXR renders, masks, AOVs | Final composite |
| **UE5** | USD scene, materials, lighting | Real-time review |
| **DaVinci 21** | Graded EXR, audio, titles | Final delivery |
| **Blender** | ORBX/USD, materials | Alternative comp |

### Assembly Logic
```python
class AssemblyEngine:
    def assemble(self, target_dcc: str, elements: List[Asset]) -> AssemblyResult:
        # Check all elements are baked and available
        for element in elements:
            if not element.is_baked():
                return AssemblyResult(
                    success=False,
                    reason=f"Element {element.id} not baked yet"
                )
        
        # Route to appropriate assembler
        assemblers = {
            "nuke": NukeAssembler(),
            "ue5": UE5Assembler(),
            "davinci": DaVinciAssembler(),
            "blender": BlenderAssembler()
        }
        
        assembler = assemblers[target_dcc]
        result = assembler.assemble(elements)
        
        # AEGIS-99 validate assembly
        aegis_score = aegis.validate_assembly(result)
        
        return AssemblyResult(
            success=True,
            output=result,
            aegis_score=aegis_score
        )
```

**Build Phase:** Day 12-15 (after all DCC adapters stable)
**Cost:** $0 (orchestration logic, uses existing DCC adapters)

---

## M76: Research Pattern Ingestion API 🟡

**Source:** Both — post-build continuous learning
**Purpose:** When Garrett/Lebrov publish new tutorials, Fiona ingests → extracts → deploys new patterns

### Ingestion Pipeline
```
New Content Detected (YouTube, blog, GitHub)
    |
    v
Research Agents (Claude Code, Kimi K2.7, Codex)
    ├── Transcribe video / extract text
    ├── Extract workflow patterns
    └── Identify new techniques
    |
    v
Cross-Verification (2+ models verify)
    ├── Is pattern valid?
    ├── Can we replicate?
    └── Is it better than current?
    |
    v
AEGIS-99 Validation
    ├── Generate test implementation
    ├── Test against existing workflows
    └── Score: must be ≥0.90
    |
    v
Template Generation
    ├── Create new workflow template
    ├── Update existing templates
    └── Version in Asset DB
    |
    v
Live Deployment
    ├── Available to supervisors immediately
    ├── No rebuild required
    └── Flagged as "New Pattern: [Source]"
```

**Build Phase:** Post-build (runtime module)
**Cost:** ~$1-3 per ingestion (research + validation)

---

## Integration with Existing FIONA Architecture

| New Module | Connects To |
|-----------|-------------|
| M70 ControlNet Gate | ComfyUI Adapter, AEGIS-99, DCC 3D Exports |
| M71 LoRA Trigger | ComfyUI Adapter, Asset DB, AEGIS-99 |
| M72 Tag Bake Dispatcher | Houdini Adapter, PDG/TOPs, Frame Chunk Scheduler |
| M73 Frame Chunk Scheduler | Tag Bake Dispatcher, Render Farm, Assembly Engine |
| M74 Project Asset DB | All DCC Adapters, LoRA Trigger, Assembly Engine |
| M75 Assembly Engine | All DCC Adapters, Asset DB, Nuke/UE5/DaVinci |
| M76 Research Ingestion API | Universal Research Mandate, All Modules, Asset DB |

---

## Related Files
- [[DCC Adapter Ecosystem]] — 7 DCC hard gates these modules build on
- [[Cursor Hard Gate]] — ControlNet Gate is part of Step 8
- [[Creative Taste System]] — LoRA training for client brand consistency
- [[AEGIS-99 Consensus Engine]] — Validates all new modules
- [[Loop Engineering — Master Framework]] — Frame Chunk Scheduler uses loop engineering
- [[Universal Research Mandate]] — Research Ingestion API extends URM
- [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]] — Assembly engine can trigger auto-fix
