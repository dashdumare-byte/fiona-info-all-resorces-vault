---
tags: [free-credits, budget, aws, google, nvidia, anthropic, strategy, locked]
date-created: 2026-07-22
---

# Free Credits Strategy — Maximizing FIONA's $300-350 Budget

> **$2,005+ in free credits available before spending $1.**
> **Stack multiple providers to cover the entire 30-day build + runtime.**

---

## TIER 1: MAJOR CREDITS ($200-$2,000+ per provider)

| # | Provider | Free Credits | How to Get | Models Accessible | Credit Card? | Expires |
|---|----------|-------------|------------|-------------------|--------------|---------|
| 1 | **AWS BedRock** | **$200** ($100 signup + $100 guided) | New AWS account → complete guided setup | Claude (Opus 4.8, Fable 5), Llama, Mistral, Titan, Nova | Yes | 6 months |
| 2 | **AWS Activate (Founders)** | **$1,000** | Apply at aws.amazon.com/startups/credits with company website | Same as BedRock + all AWS services | Yes | Credit-based |
| 3 | **AWS Activate (Portfolio/VC-backed)** | **$5,000-$100,000+** | Requires approved VC/incubator partner | Same as above | Yes | Credit-based |
| 4 | **Google Cloud (New Project)** | **$300** | New Google Cloud project | Gemini Pro, Imagen, all Vertex AI | Yes | 90 days |
| 5 | **Google for Startups (Bootstrap)** | **$2,000** | Apply with company website + demo | Same as above | Yes | 1-2 years |
| 6 | **Google for Startups (VC-backed)** | **$25,000-$350,000** | Portfolio tier with VC partner | Same as above | Yes | 1-2 years |
| 7 | **NVIDIA NIM** | **~1,000 credits** (~1,000 API calls) | Sign up at build.nvidia.com | Nemotron Ultra, Llama, DeepSeek, Qwen, GLM-5.2, Mistral | **NO** | Monthly reset |
| 8 | **NVIDIA AI Enterprise (90-day trial)** | **~4,000 additional credits** | Add business email to NVIDIA account | Same as above | **NO** | 90 days |
| 9 | **Anthropic (Starter)** | **~$5** | Sign up at console.anthropic.com | All Claude models (Opus, Sonnet, Haiku, Fable 5) | **NO** | Until used |
| 10 | **Anthropic (Corporate email program)** | **$50-$300** (2x match on deposit) | Sign up with corporate email, deposit $50-$300 | Same as above | **NO** for signup |
| 11 | **Anthropic (AI Perks stacked)** | **$1,000-$25,000+** | Apply through AI Perks accelerator programs | Same as above | No for application |
| 12 | **AgentRouter** | **$200** with referral link | Sign up at agentrouter.org with referral | Claude, GPT-5, DeepSeek, GLM | **NO** | Until used |

---

## TIER 2: DAILY FREE TIERS (Recurring, No Credit Card)

| # | Provider | Daily Free | How to Get | Best For |
|---|----------|-----------|------------|----------|
| 13 | **Cerebras** | **1,000,000 tokens/day** | Sign up at cloud.cerebras.ai | Llama 4 Scout (10M context), Qwen3, DeepSeek R1. 2,600+ tok/s |
| 14 | **Groq** | **14,400 requests/day** (30 RPM, 6K TPM) | Sign up at console.groq.com | Fast inference: Llama 3.1 8B (840 TPS), Llama 3.3 70B, Kimi K2 |
| 15 | **Google AI Studio** | **250 req/day** (Flash), **1,000 req/day** (Flash-Lite) | Sign up at aistudio.google.com | Gemini 2.5 Flash (1M context) |
| 16 | **NVIDIA NIM (monthly)** | **1,000 requests/month** | build.nvidia.com | Llama 3.1 405B, Mixtral 8x22B, Gemma 2 27B |
| 17 | **Mistral AI** | Free mode (rate-limited) | Sign up at mistral.ai | Mistral models, no credit card |
| 18 | **Hugging Face Inference** | Small monthly credit | Sign up at huggingface.co | Thousands of models |

---

## TIER 3: SMALL TRIALS ($1-$5)

| # | Provider | Amount | How to Get |
|---|----------|--------|------------|
| 19 | **Together AI** | **$1 credit** | Sign up at together.ai |
| 20 | **Fireworks AI** | **$1 trial** | Sign up at fireworks.ai |
| 21 | **OpenRouter** | First 1M BYOK requests/month free | Sign up at openrouter.ai |

---

## STACKING STRATEGY (Sign Up In This Order)

| Order | Provider | Credits | Gets Us Access To |
|-------|----------|---------|-------------------|
| 1 | NVIDIA NIM | 1,000 + 4,000 trial | Nemotron Ultra, GLM-5.2, DeepSeek, Llama (**FREE**) |
| 2 | Cerebras | 1M tokens/day | Llama 4 Scout, Qwen3, DeepSeek R1 (**FREE daily**) |
| 3 | Groq | 14,400 req/day | Llama 3.1 70B, Kimi K2, GPT-OSS 120B (**FREE daily**) |
| 4 | Google AI Studio | 250 req/day | Gemini 2.5 Flash 1M context (**FREE daily**) |
| 5 | Anthropic starter | $5 | Claude Opus 4.8, Fable 5 testing |
| 6 | AWS BedRock | $200 | Claude Opus 4.8, Fable 5, Llama, Mistral |
| 7 | Google Cloud | $300 | Gemini Pro, Imagen |
| 8 | AgentRouter | $200 | Claude, GPT-5, DeepSeek via one API |
| 9 | Anthropic corporate | $300 (2x match) | More Claude/Fable 5 |
| 10 | AWS Activate Founders | $1,000 | Extended BedRock access |

**Total from free credits alone: ~$2,005+**

This covers the ENTIRE 30-day build ($300 budget) with $1,700 left over for runtime.

---

## Credits → FIONA Model Mapping

| FIONA Model | Free Credit Source | Amount |
|-------------|-------------------|--------|
| **Nemotron 3 Ultra** | NVIDIA NIM (1,000 + 4,000 trial) | FREE |
| **GLM-5.2** | NVIDIA NIM | FREE |
| **MiniMax M3** | NVIDIA NIM | FREE |
| **Claude Opus 4.8** | AWS BedRock ($200) + Anthropic ($5 + $300) | $505 total |
| **Fable 5** | AWS BedRock ($200) + Anthropic ($305) | $505 total |
| **GPT-5.6 Terra/Sol** | AgentRouter ($200) | $200 |
| **Kimi K2.7 / K3** | Groq free tier (14,400/day) for K2 | FREE daily |
| **DeepSeek V4-Pro** | NVIDIA NIM + Cerebras | FREE |
| **Gemma 4 26B** | Ollama local | FREE (always) |
| **Ornith-35B** | Self-hosted on Lightning.ai | FREE |
| **Gemini models** | Google Cloud ($300) + AI Studio (250/day) | $300 + FREE daily |
| **Llama models** | Cerebras (1M tokens/day) + Groq | FREE daily |
| **Qwen3.7** | Cerebras + NVIDIA NIM | FREE |
| **Grok 4.5** | xAI API (minimal free tier) | Small amount |

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Initial free credits research and stacking strategy |
