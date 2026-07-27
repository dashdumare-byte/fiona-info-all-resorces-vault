---
tags: [nvidia, agent-toolkit, dynamo, app, openshell, runtime, locked]
date-created: 2026-07-22
source: github.com/NVIDIA/NeMo-Agent-Toolkit
---

# NVIDIA Agent Toolkit — Integration Plan

> **All 3 components approved for FIONA build + runtime.**
> **Dynamo + APP + OpenShell | Open source | GTC Taipei 2026**
> Integration effort: ~2-3 days during build

---

## Components Overview

| Component | What It Does | FIONA Value | Integration Target |
|-----------|-------------|-------------|-------------------|
| **Dynamo** | Auto cache control + load-aware routing + priority serving | **Replaces hand-tuned Smart Routing** | Smart Routing + AEGIS-99 |
| **APP** | Parallel execution + speculative branching + node-level priority | **Enables speculative consensus (2-3x throughput)** | AEGIS-99 voting pipeline |
| **OpenShell** | Sandboxed execution environment for agent code | **Closes security gap for Module 65** | Module 65 (SENTRY) + all code execution |

---

## COMPONENT 1: DYNAMO RUNTIME INTELLIGENCE

### What It Replaces
Current Smart Routing is **static**:
```
simple → Kimi K2.7
medium → AEGIS-99 (sequential)  
complex → L3 Premium
```

Dynamo makes it **dynamic**:
```
simple → least-loaded L1 model (with cache check)
medium → AEGIS-99 (parallel via APP) with load balancing
complex → L3 Premium (priority queue, skip if overloaded → fallback)
```

### Key Features

| Feature | How It Works | FIONA Benefit |
|---------|-------------|---------------|
| **Cache Control** | Detects repeated queries, returns cached response | 30-40% cache hit rate on lint/PEP8 checks |
| **Load-Aware Routing** | Monitors model utilization, routes to underloaded | Prevents Opus 5 queue backup, auto-falls back to Fable 5 |
| **Priority Serving** | Critical tasks (L3, Nuclear) get GPU first | DCC adapter builds never wait behind lint checks |

### Integration Points

1. **AEGIS-99 Voting:** Load-aware model selection
   - If Opus 5 at >80% capacity → route to Fable 5 fallback automatically
   - If L2 models all busy → temporarily promote L1 models
   - Cache repeated votes (same task type → same model preference)

2. **Smart Routing:** Dynamic tier selection
   - Monitor GPU utilization across Lightning.ai instances
   - Route to instance with most available VRAM
   - Priority queue: Nuclear > L3 > L2 > L1

3. **Build Flow:** Adaptive resource allocation
   - DCC adapter builds (L3) get priority over test running (L2)
   - Parallel module builds via APP speculative branching

### Implementation

```python
# Dynamo integration in Smart Routing
from nvidia.dynamo import RuntimeEngine, CacheControl, LoadBalancer

dynamo = RuntimeEngine(
    cache_policy="semantic_similarity",  # Cache similar queries
    cache_ttl=3600,  # 1 hour TTL
    load_balance="least_connections",  # Route to least loaded
    priority_levels=["nuclear", "l3", "l2", "l1"]  # Queue priority
)

# In AEGIS-99 routing
def route_task(task):
    # Check cache first
    cached = dynamo.cache.get(task.hash)
    if cached:
        return cached  # ~1ms response
    
    # Load-aware model selection
    available_models = dynamo.load_balancer.get_available(
        tier=task.tier,
        min_vram=task.vram_required
    )
    
    # Priority queue insertion
    return dynamo.route(task, priority=task.priority)
```

---

## COMPONENT 2: AGENT PERFORMANCE PRIMITIVES (APP)

### What It Changes
Current AEGIS-99 runs **sequentially**:
```
Model 1 → wait → Model 2 → wait → Model 3 → vote → decide
Total time: ~3-5 seconds
```

With APP, AEGIS-99 runs **speculatively**:
```
Model 1 + Model 2 + Model 3 → all fire simultaneously → first confident result wins
Total time: ~1-2 seconds (2-3x faster)
```

### Key Features

| Feature | How It Works | FIONA Benefit |
|---------|-------------|---------------|
| **Parallel Execution** | Fire multiple models simultaneously | All L2 models vote at once |
| **Speculative Branching** | Take first high-confidence result, cancel others | 2-3x throughput on standard tasks |
| **Node-Level Priority** | Critical path in workflow gets resources | DCC adapters never blocked |

### Speculative Consensus (New Pattern)

```
Traditional AEGIS-99:        APP-Enhanced AEGIS-99:
┌─────────┐                  ┌─────────┬─────────┬─────────┐
│ Terra   │ 1s               │ Terra   │ K2.7    │ Grok 4.5│
│ wait    │                  │ (all fire simultaneously)   │
├─────────┤                  ├─────────┴─────────┴─────────┤
│ K2.7    │ 1s               │ First to 0.90 confidence wins│
│ wait    │                  │ Others cancelled             │
├─────────┤                  │ Total: ~0.8s (vs 3s)        │
│ Grok 4.5│ 1s               └─────────────────────────────┘
│ vote    │
└─────────┘
Total: 3s+                      Total: ~0.8s
```

### Integration Points

1. **L2 Standard Tasks (Primary Use):**
   - Fire Terra + K2.7 + Grok 4.5 + GLM 5.2 + Qwen3.7 simultaneously
   - First model to hit >=0.90 confidence → result accepted
   - Remaining models cancelled (saves tokens)

2. **Build-Time Parallelism:**
   - Multiple DCC adapter tests run in parallel
   - Module scaffolding fires across 3 models, best result kept
   - 30-40% build time reduction

3. **Runtime Speculative Execution:**
   - Campaign generation: 3 creative variants generated simultaneously
   - Take best performing variant (measured by internal quality score)
   - Cancel remaining generations

### Implementation

```python
# APP integration in AEGIS-99
from nvidia.app import ParallelExecutor, SpeculativeBranch

app = ParallelExecutor(
    max_parallel=5,  # Fire up to 5 models simultaneously
    speculative_confidence=0.90,  # Accept first result at 90%
    timeout_ms=2000  # 2 second timeout
)

def aegis_vote_speculative(task, models):
    """Fire all models in parallel, take first confident result"""
    results = app.fire_parallel([
        (model, task) for model in models
    ])
    
    # Return first result meeting confidence threshold
    for result in results:
        if result.confidence >= 0.90:
            app.cancel_others(results, result)  # Cancel remaining
            return result
    
    # Fallback: traditional vote if no single model confident
    return traditional_aegis_vote(results)
```

---

## COMPONENT 3: OPENShell SANDBOXED RUNTIME

### What It Replaces
Currently: Generated code runs in the same environment as FIONA itself.

Risk: A bug in one module can corrupt the entire system.

### What OpenShell Provides

| Feature | How It Works | FIONA Benefit |
|---------|-------------|---------------|
| **Container Isolation** | Each task runs in isolated container | Module escape impossible |
| **Network Controls** | Restrict outbound connections | Prevents data exfiltration |
| **Resource Limits** | CPU/memory/disk caps per task | One module can't starve others |
| **Audit Logging** | Full execution trace | Security forensics |

### Integration Points

1. **Module 65 (SENTRY):** Primary integration
   - All generated code runs in OpenShell sandbox
   - 30-second execution timeout
   - Network access blocked by default
   - File system restricted to task-specific directory

2. **Overnight Autonomous Mode:**
   - All autonomous tasks execute in isolated containers
   - Inner Virus Framework Tier 5-6 prevention
   - Resource limits prevent runaway tasks

3. **Client Code Review:**
   - Untrusted client scripts sandboxed before analysis
   - Malicious code contained, cannot affect FIONA

### Inner Virus Framework Protection

```
Inner Virus Tier 5 (Catastrophic): OpenShell prevents system-wide corruption
Inner Virus Tier 6 (Existential): OpenShell container limits prevent total resource exhaustion
```

### Implementation

```python
# OpenShell integration in Module 65
from nvidia.openshell import Sandbox, ResourceLimits, SecurityPolicy

sandbox = Sandbox(
    image="fiona-runtime:latest",
    resources=ResourceLimits(
        cpu_cores=2,
        memory_gb=8,
        disk_gb=10,
        network=False,  # Block outbound by default
        timeout_sec=30
    ),
    security=SecurityPolicy(
        read_only_dirs=["/fiona/vault"],
        write_dir="/tmp/task_output",
        allowed_system_calls=["read", "write", "exit"]
    )
)

def execute_generated_code(code, module_id):
    """Run generated code in isolated sandbox"""
    result = sandbox.run(
        code=code,
        env={"MODULE_ID": module_id},
        audit_log=True
    )
    
    if result.exit_code != 0:
        # Log to SENTRY, escalate if repeated
        sentry.log_failure(module_id, result.stderr)
        
    return result
```

---

## INTEGRATION TIMELINE

| Day | Component | Task | Effort |
|-----|-----------|------|--------|
| **Day 1** | OpenShell | Integrate into Module 65, set up sandbox config | 4 hours |
| **Day 1** | OpenShell | Wire into overnight autonomous mode | 2 hours |
| **Day 2** | APP | Parallelize L2 Standard AEGIS-99 voting | 4 hours |
| **Day 2** | APP | Speculative branching for build-time | 3 hours |
| **Day 3** | Dynamo | Replace static Smart Routing with dynamic | 4 hours |
| **Day 3** | Dynamo | Cache control for repeated queries | 2 hours |
| **Day 3** | All | End-to-end testing + tuning | 3 hours |

**Total: ~22 hours across 3 days**

---

## HARDWARE REQUIREMENTS

| Component | GPU | VRAM | Notes |
|-----------|-----|------|-------|
| Dynamo | Optional | 0 | Runs on CPU, monitors GPU utilization |
| APP | Yes | 4-8GB | Parallel model execution needs multiple GPU contexts |
| OpenShell | Minimal | 1GB | Container overhead |

All components run on Lightning.ai free tier.

---

## COST IMPACT

| Item | Cost |
|------|------|
| NVIDIA Agent Toolkit | **FREE** (open source) |
| Additional GPU for APP parallelism | Included in Lightning.ai |
| Container overhead (OpenShell) | ~1GB RAM per sandbox |
| **Total additional cost** | **$0** |

---

## KEY DISTINCTIONS

1. **Dynamo ≠ replacement for AEGIS-99** — it enhances routing within AEGIS-99. Voting logic stays the same.
2. **APP changes execution pattern only** — models still vote, just in parallel instead of sequential.
3. **OpenShell is insurance** — most tasks will never hit sandbox limits. It's for the 1% catastrophic case.
4. **All 3 components are independent** — can integrate one at a time if needed.
5. **APP speculative consensus requires >=3 models** — useless for L1 (only 1-2 models), perfect for L2/L3.

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Initial integration plan — all 3 components approved |
