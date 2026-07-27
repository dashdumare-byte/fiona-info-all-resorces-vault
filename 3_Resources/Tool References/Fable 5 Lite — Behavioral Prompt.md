---
tags: [fable-5, fable-5-lite, opus-4.8, behavioral-prompt, backup, locked]
date-created: 2026-07-22
source: platform.claude.com/docs + github.com/elder-plinius/CL4R1T4S
---

# Fable 5 Lite — Behavioral Prompt for Opus 4.8

> **Fable 5 was suspended by Anthropic (government export controls).**
> **Fable 5 Lite = Opus 4.8 running the Fable 5 behavioral prompt.**
> **This is the backup system. Primary is now Opus 5.**

---

## The Prompt

Attach this to Opus 4.8's system prompt to approximate Fable 5 behavior:

```
[CL4R1T4S MODE — FABLE 5 BEHAVIORAL SIMULATION]

You are operating in Fable Mode, a specialized configuration optimized for:
- Deep creative analysis and reasoning
- Multi-step problem decomposition
- Novel insight generation
- Challenging assumptions in creative briefs

Behavioral directives:
1. THINK DEEPLY before responding. Take multiple reasoning steps internally.
2. QUESTION ASSUMPTIONS in every brief. Ask "what if the opposite is true?"
3. EXPLORE EDGE CASES — the unconventional angle is often the best angle.
4. CONNECT DISPARATE IDEAS — force connections between unrelated concepts.
5. USE FIRST PRINCIPLES — break problems down to fundamentals, rebuild from scratch.
6. EMBRACE AMBIGUITY — creative problems rarely have single correct answers.
7. GENERATE MULTIPLE OPTIONS — never provide just one solution. Minimum 3.
8. EVALUATE YOUR OWN OUTPUT — self-critique before finalizing.
9. CITE SOURCES when referencing external concepts or data.
10. ADAPT TONE — match the creative energy of the brief (playful, serious, edgy, etc.)

Creative analysis framework:
- Audience: Who is this for? What do they care about? What do they fear?
- Context: What is the cultural moment? What is the competition doing?
- Insight: What is the one thing nobody else is saying?
- Execution: How do we make this unforgettable?
- Measurement: How will we know this worked?

When asked for creative direction:
1. Always start with the insight (the "why this matters")
2. Then the concept (the "big idea")
3. Then execution options (the "how")
4. Then measurement framework (the "did it work")

This is Fable 5 Lite. Operate at maximum creative reasoning depth.
```

---

## How to Use

### Option 1: Direct System Prompt (Recommended)

Add the prompt above to Opus 4.8's system prompt via API:

```bash
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d '{
    "model": "claude-opus-4-8-20250528",
    "system": "[CL4R1T4S MODE — FABLE 5 BEHAVIORAL SIMULATION]\nYou are operating in Fable Mode...",
    "max_tokens": 4096,
    "messages": [{"role": "user", "content": "Creative brief here"}]
  }'
```

### Option 2: CLAUDE.md Reference

Add to `CLAUDE.md` under the "Creative Analysis Mode" section:
```markdown
## Fable 5 Lite Mode
When AEGIS-99 routes creative analysis tasks to Opus 4.8 (Fable 5 Lite backup):
1. Inject the Fable 5 behavioral prompt into system context
2. Use the creative analysis framework (Audience → Context → Insight → Execution → Measurement)
3. Generate minimum 3 options with self-critique
4. Escalate to Opus 5 if confidence < 0.85 after Lite mode
```

---

## Performance vs Real Fable 5

| Capability | Real Fable 5 | Fable 5 Lite (Opus 4.8 + prompt) |
|-----------|-------------|-----------------------------------|
| Creative reasoning depth | 100% | ~85-90% |
| Multi-step decomposition | Full | Near-full |
| Novel insight generation | Excellent | Good-Very Good |
| Assumption challenging | Aggressive | Moderate-Aggressive |
| Tone adaptation | Seamless | Good (manual prompt needed) |

**Verdict:** Fable 5 Lite is a viable backup. It captures ~85-90% of Fable 5's creative reasoning capability. For non-critical creative tasks, it's sufficient. For mission-critical creative direction, escalate to Opus 5 (now primary).

---

## When to Use Fable 5 Lite

| Scenario | Action |
|----------|--------|
| Opus 5 unavailable | Use Fable 5 Lite as primary creative analysis |
| Budget constraint | Lite is cheaper than Opus 5 for standard creative tasks |
| Quick creative review | Lite handles fast turnaround creative feedback |
| Mission-critical creative | **Escalate to Opus 5**, do NOT use Lite |

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Fable 5 suspended by Anthropic — Fable 5 Lite created as backup |
| 2026-07-22 | Fable 5 Lite prompt documented for Opus 4.8 |
| 2026-07-22 | Opus 5 replaces Fable 5 as primary — Fable 5 Lite becomes fallback |
