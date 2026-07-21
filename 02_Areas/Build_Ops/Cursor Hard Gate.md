---
tags: [build, cursor, hard-gate, quality, 12-checks, locked]
date-created: 2026-06-08
---

# Cursor Hard Gate (Step 8)

> **12 mandatory checks. Build FAILS if any check fails. Zero tolerance.**

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
