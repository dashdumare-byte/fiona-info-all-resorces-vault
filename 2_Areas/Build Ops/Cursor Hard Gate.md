---
tags: [build, cursor, hard-gate, quality, 12-checks, locked]
date-created: 2026-06-06
source: FIONA_v1.7_ARCHITECTURE_v4.1.txt + FIONA_v1.7_MERGE_BUILD_PLAN(1).txt
---

# Cursor Hard Gate (Step 8)

> **12 mandatory checks. Build FAILS if any check fails. Zero tolerance.**
> Final gate before code ships. Nothing passes without all 12.

---

## The 12 Checks

| # | Check | Tool | Pass Criteria |
|---|-------|------|---------------|
| 1 | **Zero failing tests** | pytest | All tests green, 100% pass rate |
| 2 | **Zero critical lint errors** | Pylint | Critical errors = 0 |
| 3 | **Pylint score >= 8.0** | Pylint | Composite score threshold |
| 4 | **Type checking passes** | mypy | Zero type errors |
| 5 | **Security scan clean** | bandit | No high-severity issues |
| 6 | **Headless launch** | DCC-specific | DCC tool launches in headless mode |
| 7 | **super-smoke-test** | custom hook | Runtime verification passes |
| 8 | **API version match** | Context7 | API version matches hard gate version |
| 9 | **Context7 validation** | Context7 | All API calls validated against docs |
| 10 | **AEGIS-99 PASS** | AEGIS-99 | Score >= threshold (0.85/0.90/0.95) |
| 11 | **Leanstral proof** | Lean 4 | Mathematical proofs verified (if math involved) |
| 12 | **E2B sandbox** | E2B | Code executes successfully in sandbox |

---

## Special Cases

### DCC Adapters (M26-M32)
- Check 6 (headless launch): MANDATORY for all 7 adapters
- Check 12 (E2B sandbox): Verify actual API call works
- Additional: API response format validation

### Module 68 (B4D Grillz)
- Check 10 (AEGIS): >=0.95 (highest threshold)
- Check 11 (Leanstral): ALL tolerance math formally verified
- Check 12 (E2B): ACTUAL STL generation with synthetic dental model
- Additional: Precision measurement +-0.05mm verified

### Web App (M69)
- Check 2 (lint): Include ESLint for frontend
- Check 5 (security): Include OWASP ZAP or similar web scan
- Check 7 (smoke test): End-to-end browser test
- Additional: Auth flow test, real-time sync test

---

## Grind Hook Configuration

```
MAX_ITERATIONS=10  (DCC adapters — more retries for complex integrations)
MAX_ITERATIONS=5   (standard modules — faster iteration)
Iterate on Lints: ON
```

## Custom Cursor Commands

| Command | Purpose |
|---------|---------|
| `/review` | Trigger full supervisor review |
| `/fix-issue` | Auto-fix known issue patterns |
| `/update-deps` | Check and update dependencies |
| `/security-review` | Run full security scan |

---

## Gate Failure Response

| Failure Type | Response |
|-------------|----------|
| Test failure | Fix test or code, re-run |
| Lint error | Auto-fix if possible, manual if critical |
| Security issue | Fix mandatory, re-scan |
| AEGIS FAIL | Rework code or expand model pool |
| Proof failure | Debug math, re-run Axplorer + Leanstral |
| Sandbox fail | Debug environment, retry |

---

*See also: [[Build Flow]], [[16-Day Build Timeline]], [[Security Stack]]*
