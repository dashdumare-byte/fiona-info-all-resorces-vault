### 37. Install Harrier Embedding System (NEW -- Pre-Merge Task)
3-tier text embedding system replacing MiniLM. 94 languages, 32K context, up to 5,376 dims.

**Install (5 minutes):**
```bash
pip install sentence-transformers

# Tier 1: Real-time (270M, 1GB VRAM, ~500 docs/s)
ollama pull hf.co/Abiray/harrier-oss-v1-270m-GGUF

# Tier 2: Batch (0.6B, 2GB VRAM, ~300 docs/s)
ollama pull hf.co/Abiray/harrier-oss-v1-0.6b-GGUF

# Tier 3: Deep weekly (27B Q4, 14GB VRAM, ~50 docs/s)
ollama pull hf.co/Abiray/harrier-oss-v1-27b-GGUF:Q4_K_M
```

**Configure in Supabase/Chroma:**
```python
# Replace MiniLM with Harrier 270M for real-time
from sentence_transformers import SentenceTransformer
embedding_model = SentenceTransformer("microsoft/harrier-oss-v1-270m")

# For batch operations, use 0.6B
batch_model = SentenceTransformer("microsoft/harrier-oss-v1-0.6b")

# For weekly deep re-embedding, use 27B
from transformers import AutoTokenizer, AutoModel
deep_tokenizer = AutoTokenizer.from_pretrained("microsoft/harrier-oss-v1-27b")
deep_model = AutoModel.from_pretrained("microsoft/harrier-oss-v1-27b", load_in_4bit=True)
```

**Build-time value:** 2-3 days saved (research cross-verify, pattern reuse, AEGIS outlier detection)
**Runtime value:** +40% taste accuracy, 94-language client memory, AEGIS self-improvement
**Cost:** $0 (MIT license)
**Risk:** LOW (additive, doesn't break existing stack)

---

