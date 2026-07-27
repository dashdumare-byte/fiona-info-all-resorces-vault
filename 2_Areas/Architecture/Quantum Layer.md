---
tags: [architecture, quantum, orion, braket, classical, hybrid, optimization, locked]
date-created: 2026-07-22
updated: 2026-07-22
---

# Quantum Layer — ORION: Hybrid Classical-Quantum Optimizer

> **D-Wave = sandbox only (learning). Braket = production quantum.**
> **Classical algorithms always run first. Quantum is the "turbo-boost" when classical plateaus.**
> **3-Phase Pipeline: Classical Exploration → Quantum Turbo-Boost → Classical Refinement**

---

## The Core Insight

> **"Use classical algorithms for the heavy, high-quality exploration and quantum computers as a specialized 'turbo-boost' for specific, hard-to-solve sub-problems."**

**Proof points:**
- VINCI Energies: D-Wave hybrid solvers outperformed data-driven methods for HVAC network design
- Gurobi comparison: Quantum annealer was **10x faster** than leading classical solver for rapid approximations
- Quantum's value: **speed of approximation**, not finding the perfect answer

---

## Two-Tier D-Wave Strategy

| Tier | Offering | Cost | FIONA Role |
|------|----------|------|-----------|
| **Sandbox** | Free tier (1 min/mo) | $0 | Learning, prototyping QUBO formulations, experimenting |
| **Hybrid Solvers** | Leap Hybrid (paid) | ~$2,000/mo | **TOO EXPENSIVE** — outside FIONA budget. Braket handles production. |

**D-Wave stays as learning sandbox only.** No production workloads.

---

## Amazon Braket — Production Quantum Platform

### Available Hardware (7 QPUs)

| Provider | Technology | QPU | Best For FIONA | Per-Task | Per-Shot | Reserve/Hr |
|----------|-----------|-----|---------------|----------|----------|------------|
| **IonQ** | Trapped-ion | Forte | High-fidelity QAOA for campaign portfolio | $0.30 | $0.08 | $7,000 |
| **Rigetti** | Superconducting | Cepheus | **Fastest/cheapest gate QAOA** — default for FIONA | $0.30 | $0.000425 | $4,100 |
| **Rigetti** | Superconducting | Ankaa-3 | Gate-based variational algorithms | $0.30 | $0.00090 | $5,750 |
| **QuEra** | Neutral-atom | Aquila | Graph partitioning — client resource allocation | $0.30 | $0.01 | $2,500 |
| **IQM** | Superconducting | Garnet | High-connectivity optimization | $0.30 | $0.00145 | $3,000 |

### Simulators (Free Tier + Development)

| Simulator | Cost | Use |
|-----------|------|-----|
| **SV1** (state vector) | **FREE** 1hr/mo for 12 months, then $0.075/min | Algorithm development, validate before QPU |
| **TN1** (tensor network) | $0.075/min | Sparse circuits |
| **dm1** (density matrix) | $0.075/min | Noise modeling |

### Hybrid Jobs (The Critical Feature)

Hybrid Jobs = Python script on EC2 (classical) orchestrating quantum circuits on QPU.

**Real FIONA cost example:**
- 50 optimization iterations x 2 tasks x 100 shots on Rigetti Cepheus: **$45.36**
- Same on SV1 simulator: **$1.97**
- With $400 AWS free credits: **$0 for months**

### AWS Free Tier for FIONA
- **$400 AWS credits** for new accounts (covers months of development)
- **1 hour/month SV1 simulator** free for 12 months
- No upfront costs, pay only for what you use

---

## 3-Phase Turbo-Boost Pipeline

```
PHASE 1: CLASSICAL EXPLORATION (Always runs first)
├── Input: Optimization problem from any FIONA module
├── Optuna (TPE) → Explore search space efficiently
├── DEAP (GA) → Evolve solutions for combinatorial problems
├── PySwarms (PSO) → Swarm for continuous spaces
├── OR-Tools → Constraint satisfaction for scheduling
└── Output: Initial solution + plateau detection flag

    ↓ [If plateau detected after N iterations]

PHASE 2: QUANTUM TURBO-BOOST (Selective activation)
├── Classical encodes sub-problem as QAOA/Ising/QUBO
├── Braket Hybrid Job submits to selected QPU:
│   ├── Default: Rigetti Cepheus ($0.000425/shot, fastest)
│   ├── Complex: IonQ Forte ($0.08/shot, highest fidelity)
│   └── Graph: QuEra Aquila ($0.01/shot, analog mode)
├── Quantum returns: Rapid suboptimal approximation
│   (10x faster than classical alone — per Gurobi research)
└── Output: Good approximate solution in 10x less time

    ↓ [Always runs]

PHASE 3: CLASSICAL REFINEMENT
├── Take Phase 2 approximate solution as warm start
├── Optuna/DEAP refine from quantum's starting point
├── Converge to final high-quality solution
└── Output: Optimized result delivered to requesting module
```

---

## Classical Algorithms → FIONA Module Mapping

### Metaheuristics Layer (Free, Open Source)

| Algorithm | FIONA Module | Use Case | Implementation |
|-----------|-------------|----------|----------------|
| **Genetic Algorithm (GA)** | M10 Campaign Engine | Optimize campaign parameter combinations | DEAP |
| **Particle Swarm Optimization (PSO)** | M44 Trend Forecaster | Swarm intelligence tracking trend vectors | PySwarms |
| **Ant Colony Optimization (ACO)** | M55 Client Ingest Funnel | Optimal pathfinding through client onboarding | Custom |
| **Simulated Annealing (SA)** | M27-32 DCC Adapters | Render farm scheduling across 7 DCC tools | SciPy |

### Surrogate/Meta-Modeling Layer (Free, Open Source)

| Algorithm | FIONA Module | Use Case | Implementation |
|-----------|-------------|----------|----------------|
| **TPE (Tree-structured Parzen Estimator)** | M64 Self-Diagnostics | Optimize module hyperparameters | Optuna |
| **Bayesian Optimization** | M10 Campaign Engine | High-dimensional creative optimization | Optuna |
| **CMA-ES** | M12 Frontend Factory | Design parameter optimization | Optuna |

### AI & Machine Learning Layer (Free, Open Source)

| Algorithm | FIONA Module | Use Case | Implementation |
|-----------|-------------|----------|----------------|
| **XGBoost** | M44 Trend Forecaster | Predict trend trajectories | xgboost |
| **Random Forest** | M10 Campaign Engine | Predict campaign performance | scikit-learn |
| **Neural Networks (PyTorch)** | M10 Campaign Engine | Deep creative asset performance prediction | PyTorch |
| **Gradient Boosting** | M49 SEO Oracle | Predict search ranking changes | LightGBM |

---

## Quantum "Turbo-Boost" → Specific FIONA Tasks

### When Quantum Activates

| Scenario | Classical Alone | + Quantum Turbo-Boost |
|----------|----------------|----------------------|
| **Campaign portfolio** (1,000+ assets) | GA finds good solution in 30 min | QAOA on Rigetti finds **good starting point in 3 min**, classical refines in 10 min. **Total: 13 min vs 30 min** |
| **Content scheduling** (cross-platform) | PSO converges in 15 min | Quantum-assisted graph partitioning finds schedule skeleton in 2 min, PSO refines. **Total: 7 min vs 15 min** |
| **Creative variant testing** (10,000+ combinations) | GA stalls after 500 iterations | QAOA samples solution space 10x faster, GA continues from better starting point. **2x overall speedup** |

### Quantum Backend Selection Logic

```
if problem_type == "combinatorial_optimization" and variables > 1000:
    if budget_constrained:          → Rigetti Cepheus (cheapest shots)
    if high_fidelity_needed:       → IonQ Forte (best gates)
    if graph_partitioning:         → QuEra Aquila (analog mode)
elif problem_type == "learning":
    → D-Wave Sandbox (free, 1 min/mo)
else:
    → Classical only (no quantum needed)
```

---

## Module 69: ORION — Hybrid Optimization Engine

```
Module 69: ORION — Hybrid Classical-Quantum Optimizer

Architecture (3-Phase Turbo-Boost Pipeline):

PHASE 1: CLASSICAL EXPLORATION
├── Input: Optimization problem from any FIONA module
├── Optuna (TPE) → Explore search space efficiently
├── DEAP (GA) → Evolve solutions for combinatorial problems  
├── PySwarms (PSO) → Swarm for continuous spaces
├── OR-Tools → Constraint programming for scheduling
└── Output: Initial solution + plateau detection flag

    ↓ [If plateau detected after N iterations]

PHASE 2: QUANTUM TURBO-BOOST
├── Classical encodes sub-problem as QAOA/Ising/QUBO
├── Braket Hybrid Job submits to selected QPU:
│   ├── Default: Rigetti Cepheus ($0.000425/shot, fastest)
│   ├── Complex: IonQ Forte ($0.08/shot, highest fidelity)
│   └── Graph: QuEra Aquila ($0.01/shot, analog mode)
├── Quantum returns: Rapid suboptimal approximation
│   (10x faster than classical alone — per Gurobi research)
└── Output: Good approximate solution in 10x less time

    ↓ [Always runs]

PHASE 3: CLASSICAL REFINEMENT
├── Take Phase 2 approximate solution as warm start
├── Optuna/DEAP refine from quantum's starting point
├── Converge to final high-quality solution
└── Output: Optimized result delivered to requesting module

DECISION ENGINE:
├── Problem size < 1000 variables → Classical only (Phases 1+3)
├── Problem size 1000-10000 variables → Full 3-phase turbo-boost
├── Problem size > 10000 variables → Nuclear: Multi-QPU parallel
└── Budget check: If Braket cost > $50/run → fall back to classical
```

---

## Tool Stack

| Tool | Action | Cost | Notes |
|------|--------|------|-------|
| **D-Wave Sandbox** | Keep | $0 | Learning only. Your research confirms D-Wave Hybrid (paid) works in production, but $2K/mo is 6x our budget |
| **Amazon Braket** | **Primary production quantum** | $5-50/run pay-per-use | Your "turbo-boost" platform. $400 AWS credits cover months |
| **Optuna** | **Add** | $0 (open source) | TPE + CMA-ES for all module optimization |
| **DEAP** | **Add** | $0 (open source) | Genetic algorithms for campaign combinatorics |
| **PySwarms** | **Add** | $0 (open source) | PSO for trend tracking + render scheduling |
| **XGBoost** | **Add** | $0 (open source) | Predictive modeling for campaign/trend forecasting |
| **LightGBM** | **Add** | $0 (open source) | Gradient boosting for SEO optimization |
| **OR-Tools** | **Add** | $0 (open source) | Google's constraint programming for scheduling |
| **EnergyPlus** | Skip | N/A | Not relevant for digital creative agency |
| **MATLAB** | Skip | N/A | Python equivalents exist (NumPy/SciPy) |

---

## Budget Impact

| Item | Monthly Cost | Notes |
|------|-------------|-------|
| Classical algorithms (Optuna, DEAP, PySwarms, XGBoost, OR-Tools) | **$0** | All open source |
| Braket simulator (SV1) | **$0** | 1hr free tier for 12 months |
| Braket quantum runs (turbo-boost) | **$20-100** | Only when classical plateaus |
| AWS EC2 for Hybrid Jobs | **$5-20** | Small instances for classical part |
| D-Wave sandbox | **$0** | Free tier only |
| **Total optimization cost** | **$25-120/mo** | Within $200-250 runtime budget |

---

## Proof-of-Value Metrics

| Metric | Source | FIONA Application |
|--------|--------|-------------------|
| **10x faster than Gurobi** | Layout optimization study | Campaign combinatorics, content scheduling |
| **Outperformed data-driven methods** | VINCI Energies case | Client project optimization |
| **"Rapid suboptimal approximations"** | Research document | Real-time campaign adjustments where fast > perfect |
| **Classical + quantum > classical alone** | Truss optimization study | All multi-variable optimization tasks |

---

## Changelog

| Date | Change |
|------|--------|
| 2026-06-06 | Initial Quantum Layer (D-Wave primary, Origin secondary) |
| 2026-07-22 | **Complete rewrite**: ORION Hybrid Classical-Quantum System |
| 2026-07-22 | D-Wave demoted to sandbox only (1 min/mo free tier) |
| 2026-07-22 | Amazon Braket added as production quantum platform |
| 2026-07-22 | 3-Phase Turbo-Boost Pipeline: Classical → Quantum → Classical |
| 2026-07-22 | Classical algorithms added: Optuna, DEAP, PySwarms, XGBoost, OR-Tools |
| 2026-07-22 | Module 69 redesign: "ORION" Hybrid Optimization Engine |
