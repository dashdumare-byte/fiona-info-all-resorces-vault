# Merge Build Plan

## Phase 1: Pre-Merge Preparation (YOU DO NOW)

*(Other pre-merge tasks to be added here.)*

### 36. Install GBrain (NEW — Pre-Merge Task)
GBrain is Garry Tan's (YC CEO) open-source agent memory system. Install during merge session for build-time + runtime advantage.

**Install (2 minutes):**
```bash
# Install Bun runtime
curl -fsSL https://bun.sh/install | bash

# Install GBrain
bun install -g github:garrytan/gbrain

# Initialize with embedded PGLite (no Docker needed)
gbrain init --pglite

# Import FionaVault
gbrain import C:\Users\USER\OneDrive\Documents\FionaVault

# Verify
gbrain doctor
```

## Phase 2: Merge Session
