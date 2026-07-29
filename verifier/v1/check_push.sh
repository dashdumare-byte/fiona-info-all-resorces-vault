#!/bin/bash
VAULT="/mnt/agents/output/FionaVault"
ERRORS=0

echo "=== CHECK 1: Agent Swarm in AI Types Catalog ==="
if grep -q "Agent Swarm" "$VAULT/3_Resources/Tool References/AI Types Catalog.md"; then
  echo "PASS"
else
  echo "FAIL: Agent Swarm not found"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 2: Nemotron 8AM cron in Mega Cycle ==="
if grep -q "Nemotron 8AM Research Cron" "$VAULT/2_Areas/Architecture/Mega Cycle System Integration.md"; then
  echo "PASS"
else
  echo "FAIL: Nemotron 8AM cron not in Mega Cycle"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 3: Nemotron 8AM cron in Universal Research Mandate ==="
if grep -q "Daily Research Automation" "$VAULT/2_Areas/Research & Intelligence/Universal Research Mandate.md"; then
  echo "PASS"
else
  echo "FAIL: Daily Research Automation not in URM"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 4: OpenClaw cron in Overseer Config ==="
if grep -q "OpenClaw Cron Automation" "$VAULT/2_Areas/Architecture/Overseer Configuration.md"; then
  echo "PASS"
else
  echo "FAIL: OpenClaw not in Overseer Config"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 5: Cron Automation file exists ==="
if [ -f "$VAULT/2_Areas/Architecture/Cron Automation — Build & Runtime Schedules.md" ]; then
  echo "PASS"
else
  echo "FAIL: Cron Automation file missing"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 6: PromptCachePrefixBuilder in PULSE ==="
if grep -q "PromptCachePrefixBuilder" "$VAULT/2_Areas/Build Ops/PULSE Token Efficiency Protocol.md"; then
  echo "PASS"
else
  echo "FAIL: PromptCachePrefixBuilder not in PULSE"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 7: ModelContextWindowGuard in PULSE ==="
if grep -q "ModelContextWindowGuard" "$VAULT/2_Areas/Build Ops/PULSE Token Efficiency Protocol.md"; then
  echo "PASS"
else
  echo "FAIL: ModelContextWindowGuard not in PULSE"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 8: ModelContextWindowGuard in Model Roster ==="
if grep -q "ModelContextWindowGuard" "$VAULT/2_Areas/Model Management/Model Roster.md"; then
  echo "PASS"
else
  echo "FAIL: ModelContextWindowGuard not in Model Roster"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 9: Claude Code Subagents in Supervisor Config ==="
if grep -q "Claude Code Subagents" "$VAULT/2_Areas/Architecture/Supervisor Configuration.md"; then
  echo "PASS"
else
  echo "FAIL: Subagents not in Supervisor Config"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 10: Claude Code Hooks in Supervisor Config ==="
if grep -q "Claude Code Hooks" "$VAULT/2_Areas/Architecture/Supervisor Configuration.md"; then
  echo "PASS"
else
  echo "FAIL: Hooks not in Supervisor Config"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 11: FacTool in Security Stack ==="
if grep -q "FacTool" "$VAULT/2_Areas/Security & Risk/Security Stack.md"; then
  echo "PASS"
else
  echo "FAIL: FacTool not in Security Stack"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 12: 9-Step Information Retrieval in URM ==="
if grep -q "9-Step Information Retrieval" "$VAULT/2_Areas/Research & Intelligence/Universal Research Mandate.md"; then
  echo "PASS"
else
  echo "FAIL: 9-Step not in URM"
  ERRORS=$((ERRORS+1))
fi

echo "=== CHECK 13: Git remote sync ==="
cd "$VAULT" && git fetch origin main --dry-run 2>&1 | grep -q "up to date" && echo "PASS" || echo "NEED PULL"

echo ""
echo "TOTAL ERRORS: $ERRORS"
exit $ERRORS
