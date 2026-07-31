---
tags: [checklist, pre-merge, build-day, setup, accounts, critical]
date-created: 2026-07-28
source: DOCX "Fiona GGOG" + Additional Fiona Architecture Info
---

# Pre-Merge Checklist

> **Complete these 12 items BEFORE Day 1 of the build. Without them, the build cannot start.**

---

## API Accounts & Keys (Items 1-4)

| # | Action | Why It's Required | Cost | Status |
|---|--------|-------------------|------|--------|
| 1 | **Create NVIDIA Developer account** at build.nvidia.com | Nemotron 3 Ultra 550B (AEGIS-99 Architect Primary) needs NIM API key | Free dev key | ☐ |
| 2 | **Create Z.ai account + API key** | GLM-5.2 is Orchestrator + highest priority coding model | Included in Coding Plan ($30/mo Pro) | ☐ |
| 3 | **Create Alibaba Cloud Model Studio account** | Qwen3.7-Max is AEGIS Auditor 2 + Gen Pool Pass 2 + OpenCode supervisor | Check OpenRouter first — may be available there | ☐ |
| 4 | **Verify Kimi K2.7 on OpenRouter** | `nvidia/nemotron-3-ultra-550b` (or `moonshotai/kimi-k2.7`) must be live | Free tier on OpenRouter | ☐ |

**Note:** If a model string is not on OpenRouter, use the provider's native API:
- Qwen3.7 → Alibaba Cloud Model Studio API
- Kimi K2.7 → Moonshot AI API (if not on OpenRouter)
- GLM-5.2 → Z.ai API

---

## Tool Setup (Items 5-8)

| # | Action | Why It's Required | Verification Command |
|---|--------|-------------------|---------------------|
| 5 | **Update Claude Code to ≥ 2.1.95** | Supervisor 1 requires latest version for MCP support | `claude --version` |
| 6 | **Verify Vertex AI project** `db08a4cc-d337-45de-b0c` | Primary Claude Opus access | `gcloud config get-value project` |
| 7 | **Verify AWS Bedrock IAM** `fiona-bedrock` | Fallback Claude access | `aws sts get-caller-identity` |
| 8 | **Enable Cursor Iterate on Lints** | Hard gate (Step 8) requires auto-lint iteration | Settings → Features → Iterate on Lints → ON |

---

## Configuration Files (Items 9-11)

| # | Action | Contents | Location |
|---|--------|----------|----------|
| 9 | **Upload 14 spec files to Lightning.ai** | 8 BATCH files + 6 support files | `/fiona/specs/` on Lightning.ai |
| 10 | **Create `.cursor/hooks/grind.ts`** | MAX_ITERATIONS=10 (DCC) / 5 (standard) | `.cursor/hooks/grind.ts` |
| 11 | **Create `.cursor/commands/`** | /review, /fix-issue, /update-deps, /security-review | `.cursor/commands/` |

**grind.ts template:**
```typescript
// .cursor/hooks/grind.ts
export const GRIND_CONFIG = {
  maxIterations: {
    dcc: 10,      // DCC adapters need more iterations
    standard: 5,  // Standard modules
    security: 3   // Security-critical modules
  },
  timeoutMinutes: 30,
  abortOnCriticalLint: true
};
```

---

## DCC Licenses (Item 12 — Post-Build Only)

| DCC | License Cost | When to Buy | Education Discount |
|-----|-------------|-------------|-------------------|
| DaVinci Resolve Studio | **$295** one-time | After build (Day 30+) | Available via Blackmagic |
| Houdini Education | **~$75/year** | After build | Verify student status |
| Nuke Education | **~$99/year** | After build | Verify via Foundry |
| Cinema 4D | Via SheerID | After build | Student verification required |

⚠️ **Do NOT obtain DCC licenses before build.** The build uses free/trial versions. Licenses are only needed for production runtime.

---

## Pre-Merge Day Script

Run this script the day BEFORE build starts:

```bash
#!/bin/bash
# pre_merge_check.sh

echo "=== FIONA v1.7 Pre-Merge Check ==="

# 1. API Accounts
echo "1. NVIDIA NIM..."
curl -s https://api.nvidia.com/health || echo "❌ NVIDIA NIM not reachable"

echo "2. Z.ai..."
curl -s https://api.z.ai/health || echo "❌ Z.ai not reachable"

echo "3. Alibaba Cloud..."
curl -s https://api.aliyun.com/health || echo "❌ Alibaba Cloud not reachable"

echo "4. OpenRouter..."
curl -s https://openrouter.ai/api/v1/models | grep -q "kimi" && echo "✅ Kimi available" || echo "❌ Kimi not on OpenRouter"

# 5. Tool Versions
echo "5. Claude Code..."
claude --version

echo "6. Cursor..."
cursor --version

echo "7. Git..."
git --version

echo "8. Node..."
node --version

# 9. Lightning.ai
echo "9. Lightning.ai connection..."
ssh lightning.ai "echo '✅ Lightning.ai reachable'" || echo "❌ Lightning.ai not reachable"

echo "10. Cursor hooks..."
ls -la .cursor/hooks/grind.ts && echo "✅ grind.ts exists" || echo "❌ grind.ts missing"

echo "11. Cursor commands..."
ls -la .cursor/commands/ && echo "✅ Commands exist" || echo "❌ Commands missing"

echo "12. Spec files..."
ls /fiona/specs/ | wc -l | xargs echo "spec files:"

echo "=== Pre-Merge Check Complete ==="
```

---

## Post-Build Actions (Day 31+)

| Action | When | Cost |
|--------|------|------|
| Purchase DaVinci Resolve Studio | Day 31 | $295 |
| Purchase Houdini Education | Day 31 | ~$75/yr |
| Purchase Nuke Education | Day 31 | ~$99/yr |
| Verify Cinema 4D via SheerID | Day 31 | Student discount |
| Enable Sentry Team Plan (Seer/Autofix) | When first revenue | $26/mo |
| Upgrade Cursor to Ultra ($200/mo) | When trap door needed | $200/mo |
| Activate Plurai runtime guardrails | When client-facing | $0.15/1K tokens |
| Activate Temporal.io workflows | When client projects start | $0-50/mo |

---

## Related Files
- [[Budget Breakdown]] — All costs documented
- [[30-Day Build Timeline]] — Day-by-day plan
- [[Model Roster]] — All model strings and access methods
- [[Logic Bomb Fixes — The Big Three]] — State checkpoint system
- [[Session Start Protocol]] — What to do on Day 1 morning
