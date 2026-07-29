---
tags: [security, stack, 31-tools, build, runtime, locked, layer-2]
date-created: 2026-06-06
source: SENTRY & SNYK analysis + FIONA_SECURITY_STACK_COMPLETE_LOCKIN.md
---

# Security Stack

> **34 tools (Plurai added as SLM guardrails layer) across build + runtime. Zero-tolerance security posture.**
> Expanded from basic Snyk+Sentry to full 31-tool stack during Layer 2 analysis.

---

## Build-Time Security (16 Tools)

### Dependency Scanning
| Tool | Purpose | Cost |
|------|---------|------|
| **Snyk** | Vulnerability scanning in dependencies | Free tier |
| **OWASP Dependency-Check** | Known vulnerability detection in dependencies | Free |
| **Renovate** | Automated dependency updates | Free |

### Static Analysis (SAST)
| Tool | Purpose | Cost |
|------|---------|------|
| **Semgrep** | Lightweight static analysis, custom rules | Free tier |
| **CodeQL** | Deep semantic analysis (GitHub) | Free for OSS |
| **SonarQube** | Code quality + security smells | Free (self-hosted) |
| **Pylint** | Python linting (>=8.0 threshold) | Free |
| **mypy** | Type checking | Free |
| **radon** | Code complexity analysis | Free |

### Secrets Detection
| Tool | Purpose | Cost |
|------|---------|------|
| **TruffleHog** | Secret leakage detection in commits | Free |
| **git-secrets** | Pre-commit secret scanning | Free |
| **GitGuardian** | Comprehensive secret detection | Free tier |

### AI-Specific Security
| Tool | Purpose | Cost |
|------|---------|------|
| **garak** | LLM vulnerability probing (prompt injection, jailbreaks) | Free |
| **Giskard** | ML model testing, bias detection, robustness | Free (open-source) |
| **PyRIT** | AI red teaming framework (Microsoft) | Free |

### Container Security
| Tool | Purpose | Cost |
|------|---------|------|
| **Trivy** | Container image + filesystem scanning | Free |
| **Grype** | Vulnerability scanner for containers | Free |

---

## Runtime Security (15 Tools)

### Application Monitoring
| Tool | Purpose | Cost |
|------|---------|------|
| **Sentry** | Error tracking, performance monitoring | Free tier |
| **SigNoz** | OpenTelemetry-based observability (backup) | Free (self-hosted) |
| **GlitchTip** | Sentry-compatible error tracking (backup) | Free (self-hosted) |

### AI Safety & Guardrails
| Tool | Purpose | Cost |
|------|---------|------|
| **NeMo Guardrails** | LLM output validation, topic control | Free (NVIDIA) |
| **Evidently AI** | ML model drift + quality monitoring | Free (open-source) |
| **AEGIS-99** | Multi-model consensus gate (custom) | API costs |
| **FacTool** | 5-step factual verification pipeline — validates code, math, QA claims against sources | Free (open-source) |
| **Plurai** | SLM-based evals & guardrails — real-time validation, policy compliance, grounding check. 15x cheaper than LLM-as-judge, <100ms | $0.15/1K tokens (1M free on signup) |

### Prompt Security
| Tool | Purpose | Cost |
|------|---------|------|
| **Rebuff** | Prompt injection detection | Free tier |
| **Prompt Security Scanner** | Input/output scanning | Free |

### Input Validation
| Tool | Purpose | Cost |
|------|---------|------|
| **bandit** | Python security vulnerability scanner | Free |
| **Safety** | Python dependency security checker | Free |

### Runtime Verification
| Tool | Purpose | Cost |
|------|---------|------|
| **super-smoke-test** | Runtime verification hook | Free (custom) |
| **HallucinationAutoFixer** | Import correction, hallucination cleanup | Free (custom) |
| **Logfire** | AEGIS failure logging | Free tier |

### Backup Observability
| Tool | Purpose | Cost |
|------|---------|------|
| **SigNoz** | OTel backend alternative | Free (self-hosted) |
| **GlitchTip** | Sentry-compatible alternative | Free (self-hosted) |

---

## Integration Points

### Build Flow
| Step | Security Tools |
|------|---------------|
| 0: Research | Giskard (verify research sources) |
| 3: Parallel Gen | bandit (auto-scan generated code) |
| 4: AEGIS-99 | AEGIS itself is a security gate |
| 7: 3-Supervisor Review | Semgrep, CodeQL deep scan |
| 8: Cursor Hard Gate | Snyk, Trivy, TruffleHog, garak |

### Runtime
| Layer | Security Tools |
|-------|---------------|
| Input | Rebuff, NeMo Guardrails, bandit |
| Processing | AEGIS-99, Giskard, Evidently |
| Output | NeMo Guardrails, super-smoke-test |
| Monitoring | Sentry, Logfire, SigNoz (backup) |

---

## Security Incident Response

### Severity Classification
| Level | Name | Response Time | Action |
|-------|------|---------------|--------|
| 1 | CRITICAL | Immediate | Pause build, notify Ashandy, isolate |
| 2 | HIGH | < 15 min | Supervisor review, potential pause |
| 3 | MEDIUM | < 1 hour | Log, add to Tier 2 review queue |
| 4 | LOW | < 24 hours | Log, batch fix |

### Response Flow
```
Security alert triggered
    |
    v
Classify severity (auto + supervisor)
    |
    +---> CRITICAL --> PAUSE build --> Notify Ashandy --> Isolate component
    +---> HIGH --> Supervisor review --> Fix or escalate
    +---> MEDIUM --> Log --> Tier 2 review (20hr cycle)
    +---> LOW --> Log --> Batch fix
```

---

## Zero-Tolerance Policies

1. **No secrets in code**: TruffleHog + git-secrets block all commits with secrets
2. **No unvetted dependencies**: Snyk + Safety scan before any `pip install`
3. **No unvalidated AI output**: AEGIS-99 + NeMo Guardrails + FacTool 5-step verification on all outputs
4. **No ignored security alerts**: ALL alerts must be acknowledged or dismissed with reason
5. **Build fails on security**: Cursor Hard Gate includes security scan; fail = no merge

---

*Total: 34 tools (FacTool + Plurai added) | Build: 16 | Runtime: 17 | ~$0.15/1K tokens for Plurai (1M free on signup)*
