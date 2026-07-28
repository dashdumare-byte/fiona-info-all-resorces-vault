---
tags: [architecture, loop-engineering, feedback-loops, agentic, claude-code, codex, critical]
date-created: 2026-07-28
source: 4 uploaded files — Feedback Loops (Delba), 14-Step Roadmap (Codez), AI Skill (rari), Agent Harness Self-Repair (Akshay)
---

# Loop Engineering — Master Framework

> **"You should not be prompting coding agents anymore. You should be designing loops that prompt your agents."**
> — Boris Cherny, head of Claude Code at Anthropic

**The leverage point has moved.** For two years, better prompts meant better output. Now the leverage is one floor up: **designing the system that decides what agents work on, when, with what gate, and what state survives between runs.**

---

## What Loop Engineering Is

Loop engineering is the practice of designing **repeatable feedback cycles for AI agents** that go from attempt to verified result without a human driving every step.

**Old way:** Prompt → Agent answers → You review → You find mistakes → You prompt again
**New way:** Define goal → Loop discovers/plans/executes/verifies → System stops when goal is reached

**Prompting gives an agent an instruction. Loop engineering gives an agent a job.**

---

## The 4-Condition Test (Build NO Loop Without Passing This)

All 4 must be true. Miss one and the loop costs more than it returns:

| # | Condition | Why It Matters | FIONA Check |
|---|-----------|---------------|-------------|
| 1 | **Task repeats** at least weekly | A loop amortizes setup across many runs. One-time jobs → just use a good prompt. | ✅ Module building, testing, DCC adapter validation — all repeat |
| 2 | **Verification is automated** | Test suite, type checker, linter, or build can reject bad output without you. No gate = agent grades its own homework. | ✅ AEGIS-99 consensus + Cursor Hard Gate + zero-failing-tests rule |
| 3 | **Token budget absorbs waste** | Loops re-read context, retry, explore. That burns tokens. | ✅ $250-300 build budget + $2,005 free credits + PULSE efficiency |
| 4 | **Agent has senior engineer tools** | Logs, reproduction environment, ability to run code and see what breaks. | ✅ E2B sandbox + Lightning.ai containers + supervisor oversight |

**The 30-second loop check** (tactical version):
1. Task happens ≥weekly? 
2. Test/type check/build can reject bad output?
3. Agent can run the code it changes?
4. Loop has hard stop (token budget, iteration count, time limit)?
5. Human reviews before merge/deploy? (anything irreversible)

**Miss one box → keep it as a manual prompt.**

---

## Who Benefits vs Who Should Skip

| Beneficiaries | Skip For Now |
|--------------|--------------|
| Teams with repetitive, machine-checkable work + budget | Solo builders on consumer plans |
| Codebases with strong test suites | Code with no automated verification |
| Async-first teams with multi-agent patterns | Teams where review (not typing) is the bottleneck |
| **FIONA** — 69 modules, AEGIS gating, sandboxed execution | One-off tasks, exploratory work, judgment calls |

---

## The 5 Stages of Every Loop

```
DISCOVER → PLAN → EXECUTE → VERIFY → ITERATE
   ↑_________________________________________↓
```

If output passes → ship it.
If output fails → send it back into the loop.

**Real FIONA examples:**

**Coding Loop:**
```
Read VISION.md + ARCHITECTURE.md → Plan next change → Edit code → Run tests
→ If tests fail: read error → fix → test again
→ If tests pass: summarize changes → STOP
```

**Research Loop:**
```
Define research question → Search sources → Summarize findings
→ Verify claims against sources → Compare conflicting info
→ Synthesize final answer → STOP when confidence ≥ threshold
```

**Content/Creative Loop:**
```
Topic + audience + goal → Draft → Critique agent reviews → Rewrite
→ Score against success criteria → If pass → publish / If fail → rewrite
```

---

## The 6 Building Blocks

### 1. Automations — The Heartbeat

What starts the loop without you manually remembering.

| Tool | Mechanism | FIONA Use |
|------|-----------|-----------|
| **Claude Code** | `/loop` (session cadence), Desktop scheduled tasks, Routines (cloud runs) | Daily build check, module validation cycles |
| **Codex** | Automations tab → set prompt + cadence → Triage inbox | Nightly DCC adapter smoke tests |

**Key primitives:**
- `/loop` — re-runs on a cadence (regular checks regardless of state)
- `/goal` — keeps going until a condition is TRUE (checked by separate model = maker-vs-checker split)

```bash
# Example: Auth quality loop
/loop 30m /goal "All tests in test/auth pass and lint is clean."
  Scan src/auth for new failures, propose fixes in claude/auth-fixes,
  open draft PR when goal condition holds.
```

### 2. Worktrees — Parallel Without Chaos

Multiple agents editing the same files = collisions. Git worktrees give each agent its own branch + working directory sharing the same repo history.

| Tool | Implementation | FIONA Use |
|------|---------------|-----------|
| **Claude Code** | `--worktree` flag, `isolation: worktree` on subagents | Parallel module builds, separate DCC adapters |
| **Codex** | Built-in worktree support | Multiple adapter development simultaneously |

### 3. Skills — Project Knowledge Once, Read Every Run

A SKILL.md stops re-explaining project context every session. Intent compounds.

**FIONA Skills to create:**
- `fiona-verify` — End-to-end verification after any code change
- `fiona-dcc-test` — DCC adapter smoke test protocol
- `fiona-security-scan` — Security check after any dependency change
- `fiona-aegis-check` — AEGIS-99 consensus validation

**Skill format:**
```markdown
---
name: fiona-verify
description: Verify code changes end-to-end. Run whenever any module code changes.
---

# FIONA Verification Protocol

## Step 1 — Automated checks
1. Run full test suite (zero tolerance for failures)
2. Run linter (zero critical errors)
3. Run security scanner (Trivy + garak)
4. Check AEGIS-99 consensus score ≥ threshold

## Step 2 — Integration checks
5. Verify DCC adapter launches headless
6. Check cross-adapter pipeline end-to-end
7. Validate no regression in existing modules

## Step 3 — Documentation
8. Update STATE.md with changes made
9. Log any new lessons learned

## Never do
- Skip tests to save time
- Modify security config without human approval
- Touch src/billing/ or src/payments/ without escalation
```

### 4. Connectors (MCP) — The Loop Touches Real Tools

MCP connectors let the agent act in your real environment, not just suggest fixes.

| Connector | What It Does | FIONA Value |
|-----------|-------------|-------------|
| **GitHub** | Read repos, create branches, open PRs, react to webhooks | Biggest day-one win |
| **Linear/Jira** | Update tickets, link PRs, auto-close on pass | Track module progress |
| **Slack** | Post results, ping on escalations, summarize overnight runs | Team communication |
| **Sentry** | Investigate live alerts, draft fixes | Runtime error response |

### 5. Subagents — Maker ≠ Checker

The model that wrote the code is "way too nice grading its own homework." Split:

| Role | Model | Task |
|------|-------|------|
| **Explorer** | Fast, read-only | Discover patterns, research |
| **Implementer** | Strong coding | Write the actual code |
| **Verifier** | Different model | Review against spec (evaluator-optimizer pattern) |

**FIONA's existing subagent structure:**
- 3 Supervisors (Claude Code, Codex, OpenCode) = built-in maker-checker split
- 2 Overseers (Pi Agent, Goose) = continuous monitoring subagents
- AEGIS-99 = multi-model consensus verifier

### 6. Memory — The Loop Remembers Across Runs

"The agent forgets. The repo does not. The notes do not."

| Memory Type | Implementation | FIONA Use |
|-------------|---------------|-----------|
| **STATE.md** | Markdown in repo | Daily run log: what's done, what's next, lessons learned |
| **Obsidian Vault** | This vault | Architecture decisions, tool evaluations, research |
| **Supabase** | Structured data | Module status, AEGIS scores, build metrics |
| **Chroma** | Vector embeddings | Creative taste, code patterns, research briefs |

**State file template:**
```markdown
# Loop State — [Module Name]

## Last Run
2026-07-28 · 3 tests passing, 1 fix drafted, 0 escalated

## In Progress
- claude/fix-auth-token-refresh — tests passing locally, awaiting CI

## Completed Today
- Module 27 (Blender adapter) → merged (AEGIS 0.92, all DCC gates pass)

## Escalated to Humans
- None

## Lessons Learned
- 2026-07-27: Houdini 21 Python API changed from hou module in hython
- 2026-07-26: Blender bpy API requires --background flag for headless
```

---

## 2 Loop Types

### Closed Loops (START HERE)
- Bounded: human designs the path first
- Clear goal → defined steps → evaluation after each step → stop condition
- **Cheaper, more reliable, produces cleaner output**
- Good for: lint-and-fix, dependency bumps, test triage, module scaffolding

### Open Loops (ADVANCED)
- Exploratory: broad goal, agent searches for the path
- Can discover things you didn't specify
- **Expensive, messy, can drift from goal**
- Good for: architecture exploration, creative concept generation, research

**Rule:** Start closed. Open only when your checks are strong.

---

## Single Agent vs Fleet

| | Single-Agent Loop | Fleet Loop |
|---|---|---|
| **Structure** | One agent runs whole cycle | Orchestrator + specialists + subagents |
| **Good for** | Focused tasks, small scopes, simple goals | Complex projects, multi-domain work |
| **Examples** | Bug fixes, content drafts, research summaries | Full module build, DCC batch deployment |
| **FIONA use** | Individual module coding, test writing | 69-module orchestration, DCC adapter batch |

**Fleet example:**
```
Orchestrator (Nemotron 3 Ultra) owns the mission
    ↓              ↓              ↓
Research      Engineering        QA
Specialist    Specialist         Specialist
(Kimi K2.7)   (GLM-5.2)          (Qwen3.7)
    ↓              ↓                  ↓
Web search    Code writer        Test writer
+ DeepResearch + Debugger        + Bug tracker
```

---

## Failure Modes (Know These Before Building)

### 1. The Ralph Wiggum Loop
Agent emits "completion" token early, loop exits on half-done job.
**Causes:** No real verifier, soft completion conditions, no hard stops
**Fix:** Objective gate (test passes/fails, build compiles/doesn't)

### 2. Comprehension Debt
The faster the loop ships code you didn't write, the larger the gap between what the repo contains and what you understand.
**Fix:** Read the diffs. Spot-check the gate. Don't let it touch architecture work.

### 3. Cognitive Surrender
The pull to stop forming an opinion and accept whatever the loop returns.
**Fix:** Pair-design loops with a teammate. Block loop from judgment-call work.

### 4. Goal Drift Over Long Sessions
Each summarization step is lossy. "Don't do X" constraints disappear at turn 47.
**Fix:** Standing VISION.md or AGENTS.md reread each run.

### 5. Self-Preferential Bias
The agent that wrote the code is too nice grading its own homework.
**Fix:** Separate verifier subagent with no exposure to maker's reasoning.

### 6. Agentic Laziness
Loop declares "done enough" at partial completion.
**Fix:** `/goal` with objective stop condition checked by fresh model.

### 7. The Security Tax
Unattended loop = unattended attack surface.
**Threats:** Unreviewed code shipping, skills as injection vectors, credentials in logs, permission scope creep
**Fix:** Security checks in gate (SAST, dependency audit, secret scanning), audit permissions every 30 days.

---

## FIONA Loop Applications

| Module/Phase | Loop Type | Building Blocks Used | Trigger |
|-------------|-----------|---------------------|---------|
| **Daily build check** | Closed | Automation (/loop 1d), Skills (fiona-verify), Memory (STATE.md) | Daily cron |
| **DCC adapter testing** | Closed | Automation, Worktrees, Subagents (maker-checker), Gate (headless launch) | After each adapter build |
| **AEGIS-99 consensus** | Closed | Subagents (8 models), Gate (≥0.85/0.90/0.95), Memory (scores logged) | After every code generation |
| **Continuous error fixing** | Closed | Automation (/goal), Sandbox (E2B), Subagents ( supervisors) | CI failure detected |
| **Creative concept generation** | Open → Closed | Fleet (orchestrator + specialists), Memory (creative taste), Gate (AEGIS review) | Client request |
| **Overnight research** | Closed | Automation, Skills (research protocol), Memory (briefs stored), Connectors (Tavily, Exa) | 8AM daily cron |
| **Dependency bump** | Closed | Automation (weekly), Skills, Gate (tests pass), Connectors (GitHub PR) | Weekly cron |

---

## Loop Engineering vs Prompt Engineering

| Prompt Engineer | Loop Engineer |
|----------------|---------------|
| Focuses on better instructions | Designs the feedback system |
| Improves single output | Produces verified outcomes |
| Human reviews everything after | System runs autonomously |
| Says: "Write me a function" | Says: "Write it, test it, fix it until it passes, then summarize" |

**The highest-leverage AI builders are designing systems that discover, plan, execute, verify, and stop correctly.**

---

## The Honest Truth

Most developers don't need loops yet — not until:
- The task repeats
- Verification is automated
- The budget can absorb the waste
- The agent has senior engineer tools

**Miss one condition and the loop costs more than it returns.**

But for FIONA — 69 modules, automated verification, $2,005 in free credits, sandboxed execution — **loop engineering is not optional. It's the core operating model.**

**Build small. One automation. One skill. One state file. One gate. Get a manual run reliable. Turn it into a skill. Wrap it in a loop. Then schedule it. Order matters. Skip ahead and you're paying for a system no one understands.**

---

## Integration with FIONA Architecture

| FIONA System | Loop Engineering Connection |
|-------------|----------------------------|
| **Mega Cycle System** | The 21 feedback memories ARE the loop's state |
| **PULSE Token Efficiency** | Reduces token waste so loops are affordable |
| **AEGIS-99** | The gate — objective pass/fail for every output |
| **3 Supervisors** | Built-in maker-checker subagent split |
| **2 Overseers** | Continuous monitoring subagents |
| **E2B Sandbox** | Safe execution environment for loops |
| **Skills (CLAUDE.md, AGENTS.md)** | Project knowledge read every run |
| **Universal Research Mandate** | Research loop — all 8 models independently |
| **Cursor Hard Gate** | The final gate before merge |
| **F-GARP** | Recovery loop when AEGIS detects deadlock |

---

## Related Files
- [[Mega Cycle System Integration]] — 21 feedback memories, 6-rung depth ladder
- [[PULSE Token Efficiency Protocol]] — 10 Commandments for affordable loops
- [[AEGIS-99 Consensus Engine]] — The gate
- [[Supervisor Configuration]] — 3 supervisors = built-in maker-checker
- [[F-GARP - Deadlock Recovery]] — Recovery loop for when things break
