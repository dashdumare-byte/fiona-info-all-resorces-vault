---
tags: [ai-types, catalog, tools, models, reference, locked]
date-created: 2026-07-22
---

# AI Types Catalog — Complete Reference for FIONA

> **All 22 AI model types evaluated for FIONA build-time and runtime.**
> **Updated: 2026-07-22**
> **Status: ACTIVE tools vs TRACKED vs SKIP**

---

## ACTIVE TOOLS (Integrated into FIONA)

### 1. LLMs (Dense Architectures)
**What:** Predict next word using fully activated neural networks. General knowledge, reasoning, text generation.
**In FIONA:** GPT-5.6 Sol/Terra, Claude Opus 4.8/Opus 5 (Fable 5 fallback), GLM 5.2, Kimi K2.7/K3
**Tier:** L1-L3 AEGIS-99 + Coding Brain
**Action:** Already integrated. No changes.

---

### 2. MoE (Mixture of Experts)
**What:** Router directs tokens to relevant expert subnetworks. Massive total params, fast inference.
**In FIONA:** DeepSeek V4-Pro, MiniMax M3, Ornith-35B, Tencent Hy3, GLM 5.2
**Tier:** L1-L3 AEGIS-99
**Action:** Already integrated. No changes.

---

### 3. RLMs (Reasoning Language Models)
**What:** Reinforcement learning to "think" before speaking. Hidden chain-of-thought.
**In FIONA:** DeepSeek R1 (open, MIT), GPT-5.6 Sol, Claude 3.7 Sonnet
**Tier:** L3 Premium (complex reasoning tasks)
**Action:** Already integrated. No changes.

---

### 4. VLMs (Vision-Language Models)
**What:** Process text + images simultaneously. "See" and analyze visual content.
**In FIONA:** MiniMax M3, Kimi K3, GPT-5.6 Sol
**Tier:** L2-L3 (multimodal tasks)
**Action:** Already integrated. No changes.

---

### 5. SLMs (Small Language Models)
**What:** Compact models (1-10B params) for edge devices, local inference.
**In FIONA:**
- **Qwen3.5-9B** (L1 coding lead) — 82.5% MMLU-Pro, 76% HumanEval, Apache 2.0, ~6GB VRAM
- **Gemma 4 E4B** (ultra-lightweight fallback) — 78.1% MMLU-Pro, 128K context, ~3.5GB VRAM
- **Ornith-9B** (offline emergency) — 69.4% SWE-Bench, ~6GB VRAM
**Tier:** L1 Free
**Action:** Qwen3.5-9B replaces Gemma 4 26B for L1 coding. Gemma 4 stays for multimodal.

---

### 6. Code Generation Models
**What:** Specialized models pre-trained on billions of lines of code.
**In FIONA:** Full 4-Tier Coding Brain (16 models across L1-L3)
**Document:** See `Coding Brain - 4-Tier System.md`
**Action:** Already integrated. No changes.

---

### 7. TTS (Text-to-Speech) — ⚠️ COMMERCIAL LICENSE CRITICAL

**CRITICAL:** Many top TTS models are NON-COMMERCIAL. Pure Magic is a commercial agency.

| Model | Speech Arena Elo | License | Commercial? | FIONA Status |
|-------|-----------------|---------|-------------|--------------|
| **Step Audio EditX** | **1,118 (#1)** | **Apache 2.0** | **YES** | **PRIMARY TTS** |
| Fish Audio S2 Pro | 1,110 | Non-commercial | NO | Cannot use |
| Voxtral TTS | 1,077 | CC BY-NC 4.0 | NO | Cannot use |
| **Kokoro 82M** | 1,060 | **Apache 2.0** | **YES** | Lightweight fallback |
| **Orpheus 3B** | — | **Apache 2.0** | **YES** | Expressive TTS |
| **Chatterbox** | 1,011 | **MIT** | **YES** | Voice cloning |

**FIONA TTS Stack:**
- **Primary:** Step Audio EditX (Apache 2.0, #1 quality, emotion control)
- **Expressive:** Orpheus 3B (inline emotion tags: `[whisper]`, `[giggle]`, `[clears throat]`)
- **Lightweight:** Kokoro 82M (CPU-capable, 54 voices, 2-3GB VRAM)
- **Voice Cloning:** Chatterbox (5-second zero-shot, beat ElevenLabs 65% to 24%)
- **STT:** Whisper v3 (FREE via OpenAI API)

**Modules:** M13 (Vox Gen), M15 (Podcast Engine), M36 (Voice Clone)

---

### 8. Image Generation (Diffusion)
**What:** Text-to-image via denoising. High-fidelity imagery from prompts.
**In FIONA:**
- **Primary:** FLUX.1 Schnell — FREE, 4 steps, high quality
- **Backup:** DALL-E 3 — $0.04/image, strict prompt adherence
**Modules:** M10 (Campaign Engine), M16 (Mockup Machine), M35 (Asset Forge)

---

### 9. OCR / Document Intelligence
**What:** Extract text from PDFs, images, handwritten notes. Preserve layout/tables.
**In FIONA:** **Mistral OCR** ($0.001/page) — structured Markdown output
**Modules:** M47 (Legal Eagle), M55 (Client Ingest)

---

### 10. Embedding & Vector Search
**What:** Convert text/images to vectors for similarity search.
**In FIONA:** Harrier 3-Tier (270M inline / 0.6B batch / 27B Q4 weekly)
**Action:** Already integrated. No changes.

---

### 11. Web Scraping AI
**What:** Autonomous web scraping with anti-bot bypass, proxy rotation.
**In FIONA:** **Oxylabs AI Studio** ($12/mo)
- 5 AI apps: AI-Scraper, AI-Crawler, Browser Agent, AI-Search, AI-Map
- 175M+ residential proxies, MCP support
**Modules:** M44 (Trend Forecaster), M43 (Influencer Sniper), M49 (SEO Oracle)

---

## TRACKED TOOLS (In OV, Activate When Needed)

### 12. Video Generation
**What:** Text-to-video with physics simulation.
**Tool:** Luma Dream Machine (~$0.30/sec)
**FIONA Use:** M10 (Campaign Engine) — AI-generated video ads
**Status:** Track. Activate when client requests video campaigns.

---

### 13. SAM 2 (Spatial Segmentation)
**What:** Zero-shot object isolation from images/video.
**Tool:** SAM 2 (Meta) — open source
**FIONA Use:** M35 (Asset Forge) — isolate objects from campaign images
**Status:** Track. Useful for creative asset extraction.

---

### 14. GAN (Generative Adversarial)
**What:** Hyper-realistic face synthesis and image upscaling.
**Tool:** StyleGAN3 — open source
**FIONA Use:** M16 (Mockup Machine) — realistic human models in product mockups
**Status:** Track. Potentially useful for fashion/lifestyle clients.

---

### 15. LAM (Large Action Model)
**What:** Operates desktop/browser GUIs autonomously.
**Tool:** OpenAI Operator (~$0.03/action)
**FIONA Use:** M64 (Self-Diagnostics) — automated browser testing
**Status:** Track. Expensive per-action. Use sparingly.

---

### 16. ToolFormers
**What:** Direct API execution from natural language.
**Tool:** Gorilla LLM — open source, Apache 2.0
**FIONA Use:** M20 (API Gateway) — enhanced function calling
**Status:** Track. Self-host if function calling needs improve.

---

## REFERENCE ONLY (In OV for Future Use)

### 17. MLM (Masked Language Models)
**What:** Bidirectional context understanding.
**Tool:** DeBERTa-v3 — open source
**FIONA Use:** Sentiment analysis on client feedback, social media monitoring
**Status:** Reference. Not an active tool.

---

### 18. RNNs / SSMs (Mamba-2)
**What:** Infinite context with constant memory (vs transformers' quadratic scaling).
**Tool:** Mamba-2 — open source
**FIONA Use:** Future potential for infinite-length document processing
**Status:** Reference. Research-stage architecture.

---

### 19. Hierarchical Reasoning (ToT/MCTS)
**What:** Tree-of-Thoughts / Monte Carlo Tree Search for multi-level planning.
**FIONA Use:** Module 64 (Self-Diagnostics), F-GARP deadlock recovery
**Status:** Reference. Technique, not a model. Partially covered by Sol/Opus 5 CoT.

---

### 20. Self-Adapting (SEAL)
**What:** Real-time self-correction and weight adaptation.
**Tool:** SEAL Framework — research-stage
**FIONA Use:** Future potential for self-improving modules
**Status:** Reference. Not production-ready.

---

## SKIPPED (Not Relevant)

### 21. LCM (Latent Consistency)
**Why Skip:** FLUX.1 Schnell is also fast (4 steps) and higher quality. LCM adds nothing.

---

## SUMMARY TABLE

| Category | Count | Status | Monthly Cost |
|----------|-------|--------|-------------|
| Active (integrated) | 11 types | In use | ~$12.50 new |
| Tracked | 5 types | In OV, activate when needed | Pay-per-use |
| Reference only | 4 types | In OV for future research | $0 |
| Skipped | 1 type | Not relevant | $0 |
| **Total** | **21 types** | | **~$12.50/mo** |

---

## Changelog

| Date | Change |
|------|--------|
| 2026-07-22 | Initial catalog — 21 AI types evaluated |
| 2026-07-22 | Voxtral TTS removed (non-commercial license) |
| 2026-07-22 | Step Audio EditX added as primary TTS (Apache 2.0) |
| 2026-07-22 | Orpheus 3B added for expressive TTS |
| 2026-07-22 | Qwen3.5-9B replaces Gemma 4 26B for L1 coding |
| 2026-07-22 | Oxylabs AI Studio confirmed over Firecrawl |
