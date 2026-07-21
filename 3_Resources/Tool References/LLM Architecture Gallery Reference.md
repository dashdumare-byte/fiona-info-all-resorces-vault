# LLM Architecture Gallery Reference — Sebastian Raschka
# 83 models cataloged | Last updated: June 18, 2026
# Source: https://sebastianraschka.com/llm-architecture-gallery/
# FIONA Use: Permanent reference for model architecture decisions

## FIONA-RELEVANT MODELS (Grouped by Tier)

### TIER 1: FIONA Core Pool (Currently Locked)
| Model | Params | Context | Date | Architecture |
|-------|--------|---------|------|--------------|
| GPT-5.5 | ~1.5T | 1.05M | Apr 2026 | Dense, CoT reasoning |
| Claude Opus 4.8 | ~1.5T | 1M | May 2026 | Dense, visual+text |
| Claude Opus 4.7 | ~1.5T | 1M | Apr 2026 | Dense, async agents |
| Claude Opus 4.6 | ~1.5T | 1M | Feb 2026 | Dense, coding leader |
| Kimi K2.7 | 1T/32B active | 262K | Apr 2026 | MoE, multimodal |
| Kimi K2.7 Code | 1T/32B active | 262K | Jun 2026 | MoE, coding specialist |
| DeepSeek V4-Pro | 1.6T/49B active | 1.05M | Apr 2026 | MoE, hybrid attention |
| DeepSeek V4-Flash | 284B/13B active | 1.05M | Apr 2026 | MoE, fast inference |
| MiniMax M3 | 428B | 1M | Jun 2026 | MSA, native multimodal |
| **GLM 5.2** | **744B** | **1.05M** | **Jun 2026** | **MoE, coding brain lead** |
| GLM 5.1 | 744B | 192K | Apr 2026 | MoE, 8hr+ autonomous (fallback) |
| GLM 5.2 | 744B | 1.05M | Jun 2026 | MoE, reasoning, xhigh |
| Qwen3.7-Max | ~1T | 1M | May 2026 | Agent-centric coding |
| Nemotron 3 Ultra | 550B/55B active | 1M | Jun 2026 | Hybrid Mamba-Attention+MoE |

### TIER 2: EVALUATED / NEW MODELS (Need Discussion)
| Model | Params | Context | Date | Architecture | Key Feature |
|-------|--------|---------|------|--------------|-------------|
| Grok 4.5 | 1.5T (V9) | 500K | Jul 2026 | Dense, RL-trained | 80 TPS, 4.2x token efficiency |
| Sakana Fugu Ultra | Orchestrator | 1M | Jun 2026 | Multi-agent routing | 73.7 SWE-Bench Pro |
| Sakana Fugu | Orchestrator | 1M | Jun 2026 | Multi-agent routing | Balanced latency |
| Ornith 1.0-397B | 397B MoE | 262K | Jun 2026 | Self-scaffolding RL | 82.4 SWE-Bench, MIT |
| Ornith 1.0-35B | 35B MoE | 262K | Jun 2026 | Self-scaffolding RL | 75.6 SWE-Bench, local |
| Claude Sonnet 5 | ~1T | 1M | Jul 2026 | Dense, selectable reasoning | 2.3x faster than Opus |
| Tencent Hy3 | 295B/21B active | 262K | Jul 2026 | MoE, configurable reasoning | FREE on OpenRouter |
| Poolside Laguna XS 2.1 | 33B | 262K | Jul 2026 | Dense, coding agent | FREE on OpenRouter |

### TIER 3: LOCAL / FREE FALLBACKS
| Model | Params | Context | Quant | VRAM |
|-------|--------|---------|-------|------|
| Gemma 4 26B | 26B/3.8B active | 256K | Q4 | ~15.6GB |
| Gemma 4 31B | 31B dense | 256K | Q4 | ~17.4GB |
| Gemma 4 12B | 12B | 256K | Q4 | ~8GB |
| Ornith 1.0-9B | 9B dense | 256K | Q4 | ~6GB |

### FULL GALLERY: ALL 83 MODELS (For Reference)
1. GPT-2 XL (1.5B) — 2019-11 — Dense baseline
2. Llama 3 (8B) — 2024-04 — Dense, GQA
3. Llama 3.2 (1B) — 2024-09 — Dense small
4. Llama 3.2 (3B) — 2024-09 — Dense small
5. OLMo 2 (7B) — 2025-01 — Open, dense
6. Phi-4 (14B) — 2025-01 — Dense
7. DeepSeek V3 (671B/37B) — 2024-12 — MoE, MLA
8. DeepSeek R1 (671B/37B) — 2025-01 — Reasoning MoE
9. Gemma 3 (27B) — 2025-03 — Dense, SWA
10. xLSTM (7B) — 2025-03 — LSTM blocks
11. Mistral Small 3.1 (24B) — 2025-03 — Dense, GQA
12. Llama 4 Maverick (400B/17B) — 2025-04 — MoE, GQA
13. Qwen3 (0.6B) — 2025-04 — Dense tiny
14. Qwen3 (4B) — 2025-04 — Dense small
15. Qwen3 (8B) — 2025-04 — Dense medium
16. Qwen3 (30B-A3B) — 2025-04 — MoE
17. Qwen3 (32B) — 2025-04 — Dense
18. Qwen3 (235B-A22B) — 2025-04 — MoE
19. SmolLM3 (3B) — 2025-04 — Dense, efficient
20. Kimi K2 (1T/32B) — 2025-04 — MoE, MuonClip
21. GLM-4.5 (355B) — 2025-04 — MoE
22. GLM-4.5-Air (106B) — 2025-04 — MoE lightweight
23. Qwen3 Coder Flash (30B-A3B) — 2025-05 — MoE coding
24. GPT-OSS (20B) — 2025-05 — OpenAI open
25. GPT-OSS (120B) — 2025-05 — OpenAI open
26. Gemma 3 (270M) — 2025-05 — Dense tiny
27. Grok 2.5 (270B) — 2025-05 — Dense
28. Qwen3 Next (80B-A3B) — 2025-05 — MoE
29. MiniMax M2 (230B) — 2025-05 — MSA
30. Kimi Linear (48B-A3B) — 2025-05 — Linear attention MoE
31. OLMo 3 (7B) — 2025-06 — Open, dense
32. OLMo 3 (32B) — 2025-06 — Open, dense
33. INTELLECT-3 (106B) — 2025-06 — Dense
34. DeepSeek V3.2 (671B) — 2025-06 — MoE, DSA
35. Mistral Large 3 (673B) — 2025-06 — MoE
36. Nemotron 3 Nano (30B-A3B) — 2025-06 — MoE
37. Xiaomi MiMo-V2-Flash (309B) — 2025-06 — MoE
38. GLM-4.7 (355B) — 2025-06 — MoE
39. Arcee AI Trinity Large (400B) — 2025-06 — MoE
40. Kimi K2.5 (1T/32B) — 2025-07 — MoE, visual
41. LongCat-Flash-Lite (68.5B-A3B) — 2025-07 — MoE
42. Step 3.5 Flash (196B) — 2025-07 — MoE
43. Nanbeige 4.1 (3B) — 2025-07 — Dense
44. GLM-5 (744B) — 2025-07 — MoE
45. MiniMax-M2.5 (230B) — 2025-07 — MSA upgrade
46. Tiny Aya (3.35B) — 2025-08 — Dense multilingual
47. Ling 2.5 (1T) — 2025-08 — MoE
48. Qwen3.5 (397B) — 2025-08 — MoE
49. Sarvam (30B) — 2025-08 — Dense, Indic
50. Sarvam (105B) — 2025-08 — Dense, Indic
51. Nemotron 3 Super (120B-A12B) — 2025-08 — MoE
52. Mistral Small 4 (119B) — 2025-08 — Dense
53. Nemotron 3 Nano (4B) — 2025-09 — Dense
54. MiniMax M2.7 (230B) — 2025-09 — MSA
55. Gemma 4 (26B-A4B) — 2025-09 — MoE, multimodal
56. Gemma 4 (31B) — 2025-09 — Dense, multimodal
57. Gemma 4 (E2B) — 2025-09 — MoE, edge
58. Gemma 4 (E4B) — 2025-09 — Dense, edge
59. **GLM-5.2 (744B)** — 2026-06 — MoE, coding brain lead, 1.05M context
59b. GLM-5.1 (744B) — 2025-10 — MoE, long-horizon (fallback)
60. Qwen3.6 (35B-A3B) — 2025-10 — MoE, multimodal
61. Kimi K2.7 (1T/32B) — 2026-04 — MoE, agent swarm
62. Qwen3.6 (27B) — 2026-04 — Dense, multimodal
63. Xiaomi MiMo-V2.5 (310B) — 2026-04 — MoE
64. Xiaomi MiMo-V2.5-Pro (1.02T) — 2026-04 — MoE
65. Ling 2.6 (1T) — 2026-04 — MoE
66. Tencent Hy3-preview (295B-A21B) — 2026-05 — MoE, configurable reasoning
67. DeepSeek V4-Flash (284B/13B) — 2026-04 — MoE, fast
68. DeepSeek V4-Pro (1.6T/49B) — 2026-04 — MoE, hybrid attention
69. Laguna XS.2 (33B) — 2026-04 — Dense, coding
70. Granite 4.1 (30B) — 2026-04 — Dense, enterprise
71. ZAYA1-8B (8.4B) — 2026-04 — Dense
72. Command A+ (218B-A25B) — 2026-04 — MoE
73. LFM2.5 (1.2B, 8B, 350M) — 2026-04 — Liquid neural nets
74. JetBrains Mellum2 Thinking (12B) — 2026-04 — Dense, coding
75. Gemma 4 (12B) — 2026-04 — Dense, multimodal
76. Nemotron 3 Ultra (550B/55B) — 2026-06 — Hybrid Mamba+MoE+MTP
77. North Mini Code (30B-A3B) — 2026-05 — MoE, coding
78. Kimi K2.7 Code (1T/32B) — 2026-06 — MoE, coding specialist
79. MiniMax M3 (428B) — 2026-06 — MSA, native multimodal
80. VibeThinker-3B (3B) — 2026-06 — Dense, reasoning
81. GLM-5.2 (744B) — 2026-06 — MoE, 1M context, reasoning
82. Grok 4.5 (1.5T V9) — 2026-07 — Dense, RL-trained, 80 TPS
83. Ornith 1.0 (9B/31B/35B/397B) — 2026-06 — Self-scaffolding RL, MIT

## KEY ARCHITECTURE PATTERNS
- MoE (Mixture of Experts): DeepSeek, GLM, Kimi, Nemotron, MiniMax
- Dense: GPT-5.5, Claude Opus, Grok, Gemma 4 (some)
- Hybrid Attention: Nemotron 3 Ultra (Mamba+Attention)
- Linear Attention: Kimi Linear, GLM-4.7+
- Self-Scaffolding: Ornith 1.0 (unique)
- Multi-Agent Orchestration: Sakana Fugu (unique)
- Configurable Reasoning: Tencent Hy3, Claude Sonnet 5

## FIONA DECISION MATRIX
| Model Type | Best for FIONA | Architecture | Cost |
|-----------|---------------|--------------|------|
| Coding lead | GLM 5.2 (NEW) | MoE | ~$2.86/M out |
| Deep analysis | Claude Opus 4.8 | Dense | $25/M out |
| Volume coding | Grok 4.5 (NEW) | Dense, RL | $6/M out |
| Consensus | Nemotron 3 Ultra | MoE | FREE (NIM) |
| Multimodal | MiniMax M3 | MSA | $1.20/M out |
| Free local | Ornith-35B | MoE | $0 (self-host) |
| Free API | Tencent Hy3 | MoE | $0 (OpenRouter) |
| Fast coding | Poolside Laguna XS 2.1 | Dense | $0 (OpenRouter free) |
