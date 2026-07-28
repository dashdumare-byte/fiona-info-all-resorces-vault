---
tags: [architecture, cursor, composer, trap-door, sandbox, auto-fix, background-agent, bugbot, critical]
date-created: 2026-07-28
updated: 2026-07-28
source: CURSOR COMP 2.5.txt + web research (Cursor 3.0, Background Agent, BugBot, Auto-review, Hooks)
---

# Cursor Composer 2.5 — Trap Door & Sandbox Architecture

> **The "trap door": Smart automation that wakes up when code breaks, calls the AI agent automatically ("Code Red! The castle fell!"), the AI fixes everything by itself in the background, and when you come back, everything is already fixed and working.**
> — Ashandy's original concept, now backed by Cursor's native Background Agent

---

## Cursor Composer 2.5 — Confirmed Specs (May 2026)

| Spec | Value |
|------|-------|
| **Base model** | Kimi K2.5 (Cursor fine-tuned with RL) |
| **SWE-Bench Multilingual** | 79.8% |
| **Artificial Analysis Index** | 62 (3rd place) |
| **Standard cost** | **$0.07/task** (10-60x cheaper than Opus/GPT) |
| **Fast cost** | $0.44/task |
| **Token pricing (Standard)** | $0.50/M input, $2.50/M output |
| **Token pricing (Fast)** | $3/M input, $15/M output |
| **Capabilities** | Multi-file refactoring, zero-hallucination long contexts, complex constraint matching, autonomous git conflict resolution |

⚠️ **Fast mode is the DEFAULT.** Same model, just hotter hardware. Most users never change it and burn credits. **FIONA should default to Standard mode.**

---

## Cursor 3.0+ Platform Changes (April-June 2026)

### Cursor 3.0 — "Glass" (April 2, 2026)
Biggest interface overhaul since 2023.

| Feature | What It Does | FIONA Value |
|---------|-------------|-------------|
| **Agents Window** | Separate from IDE — run multiple AI agents in parallel across local, worktrees, cloud sandboxes, SSH | 🔥 Run all 3 supervisors simultaneously |
| **Agent Tabs** | View multiple chats side-by-side or in grid | 🔥 Monitor build + runtime + DCC agents at once |
| **Design Mode** (`Cmd+Shift+D`) | Annotate UI elements directly in built-in browser | Medium — Module 12 (Frontend Factory) |
| **Marketplace** | 30+ plugins (Atlassian, Datadog, GitLab, Hugging Face) | Medium — expand tool integrations |
| **Multi-LLM comparison** | Send same prompt to multiple models simultaneously | 🔥 **Native AEGIS-99 comparison** — compare Opus 5, GPT-5.6 Sol, DeepSeek side-by-side |
| **Native multi-repo + worktree** | `/worktree` and `/best-of-n` commands | 🔥 Parallel module builds without file collisions |

### Cursor 3.6 — Auto-review (May 29, 2026)
Routes Shell/MCP/Fetch calls through: **allowlist → sandbox → classifier subagent**
- Fewer approval interruptions
- Safer autonomous operation
- **Critical for unattended trap door loops**

### Cursor Hooks
Scripts wired to editor events — guardrails around agent edits:
- `onPreEdit` — validate before agent changes code
- `onPostEdit` — check after changes
- `onPreCommit` — final gate before commit
- `onApprove` — human approval hook

---

## The Trap Door Architecture

### What It Is
A continuous auto-fix loop that runs in the background. When any part of the FIONA system breaks (test fails, build errors, security vulnerability), the trap door:

1. **Detects** the failure (via overseers, CI, or scheduled checks)
2. **Activates** the appropriate AI agent(s)
3. **Isolates** the fix in a sandbox (never touches production directly)
4. **Loops** until all checks pass (referee pattern)
5. **Delivers** clean code via Git PR or direct merge (if confidence is high)
6. **Notifies** Ashandy of what was fixed and why

### Who Runs the Trap Door
NOT just Cursor Composer. **All AI providers' models participate:**

| Role | Model/Tool | What It Does |
|------|-----------|--------------|
| **Primary fixer** | Cursor Composer 2.5 (Standard mode) | Multi-file refactoring, constraint matching |
| **Code review** | Claude Code (Opus 5 / Opus 4.8) | Deep analysis, architecture validation |
| **Adversarial check** | Codex (GPT-5.6 Terra) | Find edge cases, security issues |
| **Alternative impl** | OpenCode (Qwen3.7) | Independent rewrite, catch blind spots |
| **Math/formal verify** | Leanstral | Proof verification for critical logic |
| **Overseer monitor** | Pi Agent + Goose | 24/7 failure detection, escalation |

### The Referee Loop (Implementation Pattern)

```python
while True:
    # 1. Run all checks
    test_results = run_test_suite()
    lint_results = run_linter()
    security_results = run_security_scan()
    aegis_score = run_aegis_consensus()
    
    # 2. Check for failures
    if all_checks_pass(test_results, lint_results, security_results, aegis_score):
        # Deliver clean code
        create_pull_request()
        notify_ashandy("All checks passed. Changes delivered.")
        break
    
    # 3. Route to appropriate fixer based on failure type
    if test_results.has_failures():
        cursor_composer.fix_tests(test_results)
    if lint_results.has_errors():
        cursor_composer.fix_lint(lint_results)
    if security_results.has_vulnerabilities():
        claude_code.fix_security(security_results)
    if aegis_score < THRESHOLD:
        # Need model consensus — escalate to multi-model review
        run_aegis_full_pool()
    
    # 4. Safety checks
    if iteration_count > MAX_ITERATIONS:
        notify_ashandy("Max iterations reached. Manual review needed.")
        break
    if token_spend > BUDGET_LIMIT:
        notify_ashandy("Budget limit reached. Pausing auto-fix.")
        break
    
    # 5. Verify fix in sandbox before next iteration
    sandbox_results = verify_in_sandbox()
    if not sandbox_results.safe:
        rollback_sandbox_changes()
        continue
```

---

## Sandbox-Per-Model Architecture

Every AI model runs in its own isolated sandbox. **Never let AI models run continuous loops directly on the production build environment.**

### Why Sandboxes Are Mandatory

| Risk | Without Sandbox | With Sandbox |
|------|----------------|--------------|
| **Exploding loop** | Bad code deletes files or infinite crash → production destroyed | Happens in disposable container only |
| **Security isolation** | AI hallucinates external packages with vulnerabilities → passwords/databases exposed | Firewall blocks AI from sensitive systems |
| **Clean hand-offs** | Agent fails, breaks things, retries — all in production | Agent retries in sandbox → clean code delivered via Git PR |

### Implementation on Lightning.ai

Lightning.ai Studios are built on cloud containers — sandboxes are trivial:

```
Master Automation Script
    |
    +-- Spin up ephemeral sandbox container (per model)
    |       +-- Cursor Composer 2.5 sandbox
    |       +-- Claude Code sandbox
    |       +-- Codex sandbox
    |       +-- OpenCode sandbox
    |
    +-- Pass AI runtime + task to each sandbox
    |
    +-- Each AI runs its trap door loop independently
    |
    +-- Collect clean code from each sandbox
    |
    +-- Run AEGIS-99 consensus on combined output
    |
    +-- If consensus >= 0.90 → merge to main via Git PR
    |
    +-- Destroy all sandbox containers
    |
    +-- Log results, notify Ashandy
```

### Sandbox Specs (Per Model)

| Model | Sandbox Type | Isolation | Destroy After |
|-------|-------------|-----------|---------------|
| Cursor Composer 2.5 | Lightning.ai ephemeral container | Full container isolation | After clean delivery |
| Claude Code | Lightning.ai worktree | Git worktree + branch | After PR opened |
| Codex | E2B sandbox | Code execution only | After tests pass |
| OpenCode | Lightning.ai container | Full container isolation | After review complete |

---

## Cursor Native Features for FIONA

### Background Agent ($60-200/mo Cursor plan)

**This is Cursor's native implementation of the trap door.**

What it does:
- Runs in cloud sandbox while you sleep
- Reads GitHub issues automatically
- Opens branches, commits, drafts PRs
- Works on assigned tasks autonomously

**FIONA Integration:**
- Assign Background Agent nightly tasks: dependency bumps, lint fixes, test triage
- Use for: non-critical continuous maintenance (DCC adapter compatibility checks, documentation updates)
- **NOT for:** Architecture decisions, auth code, production deploys (human approval required)

### BugBot ($40/user/month)

Auto-reviews every PR:
- Catches regressions
- Flags risky changes
- Posts inline comments with confidence scores
- Runs separate from the author agent (maker-checker split)

**FIONA Integration:**
- Add BugBot as the **pre-merge gate** after Cursor fixes but before merge
- BugBot score + AEGIS-99 score both required for merge
- Replaces manual Tier 1 review for standard changes

### Multi-LLM Comparison (Cursor 3.0)

Send same prompt to multiple models simultaneously — **this is AEGIS-99 built into Cursor.**

**FIONA Integration:**
- Use for: critical module validation, architecture decisions
- Compare: Opus 5, GPT-5.6 Sol, DeepSeek V4-Pro side-by-side
- AEGIS-99 weights can be applied to Cursor's comparison output

### Cursor Hooks — Guardrails

```javascript
// Example: Pre-edit validation hook
{
  "onPreEdit": [
    "run_linter",
    "check_aegis_threshold",
    "verify_no_payments_code"
  ],
  "onPostEdit": [
    "run_tests",
    "security_scan"
  ],
  "onPreCommit": [
    "full_test_suite",
    "aegis_consensus_check",
    "bugbot_review"
  ],
  "onApprove": [
    "notify_ashandy"
  ]
}
```

---

## Pricing Tiers for FIONA

| Plan | Price | What's Included | FIONA Suitability |
|------|-------|----------------|-------------------|
| Free (Hobby) | $0 | Limited Tab + small chat | ❌ Too limited |
| **Pro** | **$20/mo** | $20 metered spend, full Tab, Composer, Agent | ✅ **Good for individual use** |
| Pro+ | $60/mo | $60 metered spend | ✅ **Good for trap door background tasks** |
| **Ultra** | **$200/mo** | $200 metered spend, priority queue | ✅ **Best for full multi-agent trap door** |
| Business | $40/user/mo | Team dashboard, audit log | ✅ If team grows |
| Enterprise | Custom | SSO, on-prem, SCIM | Future option |

**BugBot add-on:** $40/user/month (auto-PR-review)

### FIONA Budget Impact

| Component | Monthly Cost | Notes |
|-----------|-------------|-------|
| Cursor Ultra (for trap door) | $200/mo | Priority queue, multi-agent background |
| BugBot (2-3 users) | $80-120/mo | Auto-review all PRs |
| **Total Cursor cost** | **$280-320/mo** | Within $200-250 runtime budget if optimized — consider Pro+ ($60) + BugBot ($40) = $100/mo for lighter usage |
| Alternative: Pro + BugBot | $60/mo | Minimum viable trap door |

---

## Integration with FIONA Systems

| FIONA System | How Cursor Integrates |
|-------------|----------------------|
| **3 Supervisors** | Claude Code, Codex, OpenCode → all run alongside Cursor in trap door |
| **2 Overseers** | Pi Agent + Goose detect failures → trigger trap door activation |
| **AEGIS-99** | Multi-LLM comparison validates Cursor's fixes; BugBot adds PR review layer |
| **E2B Sandbox** | Codex runs in E2B; Cursor runs in Lightning.ai container |
| **Cursor Hard Gate** | Zero failing tests, zero lint, AEGIS PASS — enforced via Cursor Hooks |
| **F-GARP** | If trap door loops fail → F-GARP deadlock recovery kicks in |
| **Mega Cycle** | Trap door = one of the 21 feedback memories (continuous auto-fix cycle) |
| **Loop Engineering** | Referee loop + sandbox-per-model = FIONA's implementation of loop engineering |
| **PULSE** | Cursor Standard mode ($0.07/task) instead of Fast ($0.44/task) for cost efficiency |

---

## Security Considerations

| Threat | Mitigation |
|--------|-----------|
| Unreviewed code shipping | BugBot auto-review + AEGIS consensus + human approval gate |
| Skills as injection vectors | Audit all Cursor skills before installing; 520 of 17,022 audited skills leak credentials |
| Credentials in logs | Disable verbose logging in production loops; sanitize all logs |
| Permission scope creep | Re-audit all AI permissions every 30 days |
| Model jailbreak via auto-fix | Cursor Hooks enforce allowlist on all file modifications |
| Infinite loop burning budget | Hard iteration limit + token budget cap + time limit |

---

## Implementation Phases

### Phase 1: Basic Trap Door (Week 1-2 of build)
- Cursor Pro ($20/mo) + manual referee loop
- Single sandbox (E2B)
- Human approval on every fix

### Phase 2: Automated Referee (Week 3-4)
- Cursor Pro+ ($60/mo)
- Automated referee loop with iteration limits
- Sandbox-per-model (Lightning.ai ephemeral containers)

### Phase 3: Full Autonomy (Post-build / Runtime)
- Cursor Ultra ($200/mo) + BugBot ($40/user)
- Background Agent for overnight maintenance
- Full trap door with all supervisors + overseers
- Human approval only for architecture changes

---

## Source Files
- `CURSOR COMP 2.5.txt` — Original analysis (Ashandy's concept + technical specs)
- Cursor forums and release notes (April-July 2026)
- Cursor pricing page (July 2026)

---

## Related Files
- [[Loop Engineering — Master Framework]] — The 6 building blocks the trap door implements
- [[Supervisor Configuration]] — 3 supervisors that participate in trap door
- [[Overseer Configuration]] — 2 overseers that detect failures
- [[AEGIS-99 Consensus Engine]] — Quality gate for all Cursor fixes
- [[F-GARP - Deadlock Recovery]] — When trap door loops fail
- [[Mega Cycle System Integration]] — Trap door = one of 21 feedback memories
- [[PULSE Token Efficiency Protocol]] — Use Cursor Standard mode for cost efficiency
