---
tags: [architecture, tool-integration, code-mode, mcp, cli, lazy-loading, token-efficiency, critical]
date-created: 2026-07-28
source: Just rn.txt (MCP vs CLI vs Code Mode debate resolution)
---

# Tool Integration — Code Mode Architecture

> **"Tool definitions belong in CODE, not in CONTEXT. The model writes a few lines that call them. The runtime does the rest."**

**The lever:** Anthropic's Code Mode pattern achieves **98.7% token reduction** by lazy-loading tool contracts instead of stuffing every tool description into context at session start.

---

## The Problem (What We Used to Do)

**OLD pattern (MCP upfront loading):**
```
Session starts
    ↓
Load ALL tool schemas into context
    ↓
5 MCP servers = 55K tokens BEFORE any work
    ↓
Model processes tool definitions + task
    ↓
150K tokens per workflow (Cloudflare measured this)
```

**Cost:** Every workflow burns 50-150K tokens just on tool definitions.

---

## The 3 Approaches

| Approach | Typed Contracts? | Lazy Loading? | Token Cost | Problem |
|----------|-----------------|---------------|------------|---------|
| **MCP** | ✅ Yes | ❌ No — loads everything upfront | 55K+ (5-server setup) | Burns tokens before work starts |
| **CLI/Shell** | ❌ No — agent guesses | ✅ Yes — on demand | Low | No typed contracts → agent wastes turns parsing |
| **Code Mode** | ✅ Yes | ✅ Yes — per task | ~2K | Best of both — typed contracts + lazy loading |

**Code Mode is NOT a replacement for MCP or CLI.** It is a **runtime that uses both as primitives:**
- **Bash/CLI** for anything with a binary on `$PATH` (git, curl, grep)
- **Typed module imports (MCP contracts)** for proprietary APIs (Salesforce, Stripe, DCC tools)
- The agent decides **per task** — a file search is bash, a DCC API call is a typed import

---

## How Code Mode Works

### The Pattern

```
OLD WAY (MCP upfront):
  Model sees: [GitHub schema] + [Slack schema] + [Linear schema] + [Salesforce schema] + ...
  Model thinks about ALL tools
  Cost: 150K tokens

CODE MODE (lazy loading):
  Model writes code:
    import { github } from "./connectors/github.ts"
    import { slack } from "./connectors/slack.ts"
    
    const files = github.search("auth refactor")
    const summary = files.map(f => f.summary).join("\n")
    slack.post("#engineering", `Auth refactor: ${summary}`)
  
  Model only sees: 2 import lines
  Runtime loads ONLY GitHub + Slack connectors
  Cost: 2K tokens
  
  98.7% reduction.
```

### Cloudflare's Implementation (Proof of Scale)

| Metric | Before (MCP upfront) | After (Code Mode) |
|--------|---------------------|-------------------|
| API endpoints | 2,500 | 2,500 |
| Schema tokens | 1.17M | 1K |
| Functions exposed | All 2,500 | 2 (`search`, `execute`) |
| Pattern | Agent loads everything | Agent writes code that searches → executes |

**The agent writes TypeScript that searches the catalog, then executes only what matches.**

---

## Code Mode in Practice

### Bash for Common Tools

The model has seen these in training data. No tool definition needed:

```bash
# Find all Python files importing pandas
find . -name "*.py" -exec grep -l "import pandas" {} \;

# Check git status
git status --short

# Search logs
grep "ERROR" /var/log/app.log | tail -20

# Download and extract
curl -s https://api.example.com/data | jq '.results'
```

### Typed Imports for Proprietary APIs

Strict contracts, only loaded when used:

```typescript
// DCC Adapter connector — only loaded when DCC task runs
import { blenderAdapter } from "./connectors/dcc/blender.ts"

const result = await blenderAdapter.render({
  file: "scene.blend",
  output: "frame_####.png",
  engine: "CYCLES",
  samples: 128
})
```

### Mixed Workflow Example

```typescript
// Step 1: Bash — find files
const pythonFiles = await bash(`find src -name "*.py" | head -20`)

// Step 2: Typed import — analyze with DCC tool
import { nukeAdapter } from "./connectors/dcc/nuke.ts"
const analysis = await nukeAdapter.analyzeScripts(pythonFiles)

// Step 3: Bash — commit results
await bash(`git add . && git commit -m "Analyzed ${analysis.count} scripts"`)

// Step 4: Typed import — notify team
import { slack } from "./connectors/slack.ts"
await slack.post("#pipeline", `Script analysis complete: ${analysis.summary}`)
```

**Same workflow, 4 tool calls, only 2 typed imports loaded.**

---

## MCP Is NOT Dead

| Metric | Value |
|--------|-------|
| MCP SDK downloads | 300M (up from 100M at start of 2026) |
| Growth rate | Fastest-growing agent infrastructure |
| What died | Loading every tool upfront |
| What survived | Typed contracts, protocol standard |

**FIONA uses MCP for:**
- Tool discovery and catalog management
- Typed contracts for proprietary APIs
- Cross-platform compatibility (Claude Code, Codex, OpenCode all speak MCP)

**FIONA does NOT use MCP for:**
- Loading all tools at session start
- Context-heavy tool descriptions
- Upfront schema loading

---

## FIONA Implementation Plan

### Custom MCP Servers for DCC Tools

The 7 DCC hard gates need custom MCP servers (not covered by Anthropic's official MCPs):

| DCC Tool | MCP Server | Key Functions | Status |
|----------|-----------|---------------|--------|
| **Blender 5.2.0** | `fiona-mcp-blender` | Headless render (`--background`), bpy API, file I/O | Build Days 4-5 |
| **DaVinci Resolve 21** | `fiona-mcp-davinci` | davinci-rest REST shim, timeline export, color grade | Build Days 4-5 |
| **Nuke 17** | `fiona-mcp-nuke` | Python API (17.x changes from 16.x), compositing | Build Days 4-5 |
| **ComfyUI** | `fiona-mcp-comfyui` | Latest SHA, node execution, workflow automation | Build Days 4-5 |
| **Cinema 4D 2026.3.2** | `fiona-mcp-c4d` | Python API, MoGraph, rendering | Build Days 6-7 |
| **Houdini 21** | `fiona-mcp-houdini` | hou module in hython, VEX/Python, simulation | Build Days 6-7 |
| **Unreal Engine 5.8** | `fiona-mcp-ue5` | Remote Control API, EditorActorSubsystem | Build Days 6-7 |

**Each server:** TypeScript with typed contracts, lazy-loaded only when that DCC is called.

### Tool Integration Architecture

```
FIONA Module (any of 69)
    |
    v
Tool Router (Code Mode runtime)
    |
    +---> Bash/CLI task? ───────────→ Execute directly (git, grep, curl)
    |
    +---> DCC task? ────────────────→ Lazy-load fiona-mcp-[dcc] → Execute
    |
    +---> External API task? ───────→ Lazy-load MCP connector → Execute
    |
    +---> Internal tool? ───────────→ Lazy-load internal SKILL.md → Execute
    |
    v
Result returned to module
```

### Token Budget Per Task Type

| Task Type | Code Mode Cost | Old MCP Cost | Savings |
|-----------|---------------|--------------|---------|
| Git operations | ~200 tokens | 5K (GitHub MCP loaded) | 96% |
| DCC render call | ~800 tokens (typed import) | 15K (DCC schema loaded) | 95% |
| Research search | ~500 tokens (bash) | 10K (Tavily + Exa loaded) | 95% |
| Multi-tool workflow | ~2K tokens | 50-150K | **98.7%** |
| Simple file ops | ~100 tokens (bash) | 5K | 98% |

---

## Research Tool MCP Commands

Already confirmed working, lazy-load on demand:

| Tool | MCP Install Command | When Loaded |
|------|-------------------|-------------|
| **Context7** | `npx -y @upstash/context7-mcp` | Library doc lookup |
| **Firecrawl** | `npx -y firecrawl-mcp` | Web page extraction |
| **E2B** | `npx -y @e2b/mcp-` | Code execution sandbox |
| **Brave Search** | `npx -y @modelcontextprotocol/server-brave-search` | Web search |
| **Consensus** | `npx -y consensus-mcp` (if available) | Research paper validation |

---

## A2A Protocol + Code Mode

**A2A** (Google's Agent-to-Agent protocol) handles WHO talks to WHO.
**Code Mode** handles HOW tools are loaded and executed.

Together:
- A2A: Agent A discovers Agent B's capabilities via `/.well-known/agent.json`
- Code Mode: Agent A lazy-loads only the connectors needed for that interaction
- Result: Inter-agent communication without loading every possible tool

See: [[Smart Routing]] for agent-to-agent routing logic.

---

## Integration with FIONA Architecture

| FIONA System | Code Mode Connection |
|-------------|---------------------|
| **PULSE Token Efficiency** | Code Mode IS the tool integration layer of PULSE |
| **DCC Adapter Ecosystem** | 7 custom MCP servers, lazy-loaded per adapter |
| **Smart Routing** | Router decides bash vs typed import per task |
| **Loop Engineering** | Loop iterations don't reload tools — state persists |
| **Mega Cycle** | 60s cycles stay cheap because tools aren't reloaded |
| **Universal Research Mandate** | Research tools lazy-load per research phase |
| **3-Tier AEGIS-99** | L1 uses bash (free), L2/L3 use typed imports (paid) |
| **Cursor Composer 2.5** | Cursor's tool calls use Code Mode pattern natively |

---

## Security Considerations

| Risk | Mitigation |
|------|-----------|
| Malicious typed imports | Audit all connector code before deployment |
| Credential exposure in lazy-load | Store secrets in Supabase Vault, never in connector code |
| Tool discovery abuse | A2A Agent Cards expose only necessary capabilities |
| Infinite tool recursion | Hard limit: max 5 tool calls per task iteration |
| Untrusted MCP servers | Allowlist only: fiona-mcp-* and verified official MCPs |

---

## Key Principles

1. **Never load all tools at session start.** Load per task, unload after.
2. **Bash for common, typed imports for proprietary.** The agent decides per task.
3. **One connector per tool family.** blender-mcp handles ALL Blender operations.
4. **Typed contracts are mandatory.** No CLI parsing — strict input/output types.
5. **MCP is the protocol, Code Mode is the runtime.** They complement, not compete.
6. **98.7% token reduction is achievable.** But only with lazy loading discipline.

---

## Source Files
- `Just rn.txt` — Original analysis (MCP vs CLI vs Code Mode)
- Anthropic "Code execution with MCP" (November 2025)
- Cloudflare API implementation case study

---

## Related Files
- [[PULSE Token Efficiency Protocol]] — Code Mode enables PULSE Commandment #3 (lazy loading)
- [[DCC Adapter Ecosystem]] — 7 custom MCP servers for DCC hard gates
- [[Smart Routing]] — Agent-to-agent routing with lazy tool loading
- [[Loop Engineering — Master Framework]] — Loops don't reload tools every cycle
- [[Mega Cycle System Integration]] — 60s cycles stay cheap with Code Mode
- [[Cursor Composer 2.5 — Trap Door & Sandbox Architecture]] — Cursor uses Code Mode natively
- [[Universal Research Mandate]] — Research tools lazy-load per phase
