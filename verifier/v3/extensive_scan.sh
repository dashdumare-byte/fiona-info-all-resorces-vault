#!/bin/bash
VAULT="/mnt/agents/output/FionaVault"
ERRORS=0
echo "════════════════════════════════════════════════════════════"
echo "EXTENSIVE DEEP SCAN — All 15 Items Verification"
echo "════════════════════════════════════════════════════════════"

# === BATCH 1 CRITICAL (5 items) ===
echo ""
echo "=== BATCH 1 CRITICAL ==="

echo -n "1.1 8 DCC Known Issues in DCC Adapter Ecosystem... "
if grep -q "Pre-Seeded Known Issues" "$VAULT/2_Areas/DCC Pipeline/DCC Adapter Ecosystem.md" && \
   grep -q "davinci-rest REST shim" "$VAULT/2_Areas/DCC Pipeline/DCC Adapter Ecosystem.md" && \
   grep -q "hython" "$VAULT/2_Areas/DCC Pipeline/DCC Adapter Ecosystem.md" && \
   grep -q "EditorActorSubsystem" "$VAULT/2_Areas/DCC Pipeline/DCC Adapter Ecosystem.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "1.2 Session Start Protocol file exists... "
if [ -f "$VAULT/2_Areas/Build Ops/Session Start Protocol.md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "1.3 Session Start Protocol referenced in Build Flow... "
if grep -q "Session Start Protocol" "$VAULT/2_Areas/Build Ops/Build Flow.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "1.4 CLAUDE.md GitNexus additions in Supervisor Config... "
if grep -q "CLAUDE.md Required Additions" "$VAULT/2_Areas/Architecture/Supervisor Configuration.md" && \
   grep -q "Graph Indexes" "$VAULT/2_Areas/Architecture/Supervisor Configuration.md" && \
   grep -q "blast radius" "$VAULT/2_Areas/Architecture/Supervisor Configuration.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "1.5 Plurai in AI Types Catalog... "
if grep -q "Plurai" "$VAULT/3_Resources/Tool References/AI Types Catalog.md" && \
   grep -q "SLM-based evals" "$VAULT/3_Resources/Tool References/AI Types Catalog.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "1.6 Plurai in Security Stack... "
if grep -q "Plurai" "$VAULT/2_Areas/Security & Risk/Security Stack.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "1.7 Lemur in AI Types Catalog... "
if grep -q "Lemur" "$VAULT/3_Resources/Tool References/AI Types Catalog.md" && \
   grep -q "Neural Architecture Search" "$VAULT/3_Resources/Tool References/AI Types Catalog.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

# === BATCH 2 HIGH (5 items) ===
echo ""
echo "=== BATCH 2 HIGH VALUE ==="

echo -n "2.1 Temporal.io file exists... "
if [ -f "$VAULT/2_Areas/Architecture/Temporal.io — Workflow Orchestration.md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "2.2 Temporal.io in index.md... "
if grep -q "Temporal.io" "$VAULT/index.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "2.3 FlashKDA in AI Types Catalog... "
if grep -q "FlashKDA" "$VAULT/3_Resources/Tool References/AI Types Catalog.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "2.4 Alibaba Metis/HDPO in AI Types Catalog... "
if grep -q "Metis" "$VAULT/3_Resources/Tool References/AI Types Catalog.md" && \
   grep -q "HDPO" "$VAULT/3_Resources/Tool References/AI Types Catalog.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "2.5 Metis/HDPO in Supervisor Config... "
if grep -q "Alibaba Metis" "$VAULT/2_Areas/Architecture/Supervisor Configuration.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "2.6 ASI-Evolve deepened in Creative Taste System... "
if grep -q "ASI-Evolve Deep Dive" "$VAULT/2_Areas/Memory & Storage/Creative Taste System.md" && \
   grep -q "Learn-Design-Experiment-Analyze" "$VAULT/2_Areas/Memory & Storage/Creative Taste System.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "2.7 OpenMythos deepened in Creative Taste System... "
if grep -q "OpenMythos" "$VAULT/2_Areas/Memory & Storage/Creative Taste System.md" && \
   grep -q "770M" "$VAULT/2_Areas/Memory & Storage/Creative Taste System.md" && \
   grep -q "Looped Transformers" "$VAULT/2_Areas/Memory & Storage/Creative Taste System.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

# === BATCH 3 MEDIUM (5 items) ===
echo ""
echo "=== BATCH 3 MEDIUM VALUE ==="

echo -n "3.1 DeepResearcher expanded in URM... "
if grep -q "DeepResearcher" "$VAULT/2_Areas/Research & Intelligence/Universal Research Mandate.md" && \
   grep -q "4 Pillars" "$VAULT/2_Areas/Research & Intelligence/Universal Research Mandate.md" && \
   grep -q "Recursive Browsing" "$VAULT/2_Areas/Research & Intelligence/Universal Research Mandate.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "3.2 A2A Protocol expanded in Tool Integration... "
if grep -q "Agent Cards" "$VAULT/2_Areas/Architecture/Tool Integration — Code Mode Architecture.md" && \
   grep -q "150+" "$VAULT/2_Areas/Architecture/Tool Integration — Code Mode Architecture.md" && \
   grep -q "OAuth 2.0" "$VAULT/2_Areas/Architecture/Tool Integration — Code Mode Architecture.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "3.3 LLMDR/PIBT in F-GARP... "
if grep -q "LLMDR" "$VAULT/2_Areas/Security & Risk/F-GARP - Deadlock Recovery.md" && \
   grep -q "PIBT" "$VAULT/2_Areas/Security & Risk/F-GARP - Deadlock Recovery.md" && \
   grep -q "Semantic Delta Monitor" "$VAULT/2_Areas/Security & Risk/F-GARP - Deadlock Recovery.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "3.4 Cost clarifications in Budget Breakdown... "
if grep -q "Lean 4" "$VAULT/2_Areas/Build Ops/Budget Breakdown.md" && \
   grep -q "Leanstral" "$VAULT/2_Areas/Build Ops/Budget Breakdown.md" && \
   grep -q "Tach" "$VAULT/2_Areas/Build Ops/Budget Breakdown.md"; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

# === EARLIER FILES (verify still present) ===
echo ""
echo "=== EARLIER CRITICAL FILES ==="

echo -n "4.1 Loop Engineering Master Framework... "
if [ -f "$VAULT/2_Areas/Architecture/Loop Engineering — Master Framework.md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "4.2 KIMI Swarm Historical Archive... "
if [ -f "$VAULT/4_Archive/Historical Sources/KIMI Swarm — Original Source Prompts (April 2026).md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "4.3 Cursor Composer 2.5... "
if [ -f "$VAULT/2_Areas/Architecture/Cursor Composer 2.5 — Trap Door & Sandbox Architecture.md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "4.4 Tool Integration — Code Mode... "
if [ -f "$VAULT/2_Areas/Architecture/Tool Integration — Code Mode Architecture.md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

echo -n "4.5 Cron Automation... "
if [ -f "$VAULT/2_Areas/Architecture/Cron Automation — Build & Runtime Schedules.md" ]; then
  echo "PASS"
else
  echo "FAIL"
  ERRORS=$((ERRORS+1))
fi

# === STALE DATA CHECK ===
echo ""
echo "=== STALE DATA CHECK ==="

echo -n "5.1 No GPT-5.5 references remaining... "
COUNT=$(grep -rn "GPT-5\.5\|gpt-5\.5" "$VAULT" --include="*.md" 2>/dev/null | grep -iv "5\.6\|replace\|replaces\|old\|changelog\|Terra\|Sol\|Luna" | wc -l)
if [ "$COUNT" -eq 0 ]; then
  echo "PASS (0 found)"
else
  echo "FAIL ($COUNT found)"
  ERRORS=$((ERRORS+1))
fi

echo -n "5.2 No Opus 4.6 references remaining... "
COUNT=$(grep -rn "Opus 4\.6\|opus-4\.6" "$VAULT" --include="*.md" 2>/dev/null | grep -iv "Gallery\|Sonnet\|historical\|changelog\|4\.8\|4\.7" | wc -l)
if [ "$COUNT" -eq 0 ]; then
  echo "PASS (0 found)"
else
  echo "FAIL ($COUNT found)"
  ERRORS=$((ERRORS+1))
fi

echo -n "5.3 No 9-model pool references remaining... "
COUNT=$(grep -rn "9-model" "$VAULT" --include="*.md" 2>/dev/null | grep -iv "L3 Premium\|changelog\|2026-06\|all 9" | wc -l)
if [ "$COUNT" -eq 0 ]; then
  echo "PASS (0 found)"
else
  echo "FAIL ($COUNT found)"
  ERRORS=$((ERRORS+1))
fi

echo -n "5.4 No $300-350 budget references remaining... "
COUNT=$(grep -rn "300-350\|300–350" "$VAULT" --include="*.md" 2>/dev/null | grep -iv "changelog\|historical" | wc -l)
if [ "$COUNT" -eq 0 ]; then
  echo "PASS (0 found)"
else
  echo "FAIL ($COUNT found)"
  ERRORS=$((ERRORS+1))
fi

echo -n "5.5 No D-Wave as primary references remaining... "
COUNT=$(grep -rn "D-Wave.*primary" "$VAULT" --include="*.md" 2>/dev/null | grep -iv "changelog\|sandbox\|2026-06" | wc -l)
if [ "$COUNT" -eq 0 ]; then
  echo "PASS (0 found)"
else
  echo "FAIL ($COUNT found)"
  ERRORS=$((ERRORS+1))
fi

# === GIT STATUS ===
echo ""
echo "=== GIT SYNC ==="
echo -n "6.1 Local and remote in sync... "
cd "$VAULT" && git fetch origin main --dry-run 2>&1 | grep -q "up to date" && echo "PASS" || echo "NEED PULL"

echo ""
echo "════════════════════════════════════════════════════════════"
echo "SCAN COMPLETE — TOTAL ERRORS: $ERRORS"
echo "════════════════════════════════════════════════════════════"

exit $ERRORS
