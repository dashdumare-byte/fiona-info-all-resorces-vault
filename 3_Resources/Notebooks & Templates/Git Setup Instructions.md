---
tags: [git, setup, github, sync, obsidian, instructions]
date-created: 2026-06-06
---

# Git Setup Instructions

> **Connect your FionaVault to GitHub for sync, backup, and AI model access.**

---

## Step 1: Create GitHub Repo

1. Go to github.com and sign in
2. Click the **+** icon (top right) -> **New repository**
3. Repository name: `fiona-vault`
4. Description: "FIONA v1.7 — Vault-as-Supervisor architecture context"
5. Visibility: **Private** (contains API strings and architecture)
6. **DO NOT** initialize with README (Obsidian vault already has index.md)
7. Click **Create repository**

---

## Step 2: Get Your Repo URL

After creating the repo, copy the HTTPS URL. It will look like:

```
https://github.com/YOUR_USERNAME/fiona-vault.git
```

Save this — you'll need it in Step 4.

---

## Step 3: Open Obsidian Git Plugin Settings

In Obsidian:
1. Open **Settings** (gear icon, bottom left)
2. Go to **Community Plugins**
3. Find **Obsidian Git** and click **Options**

---

## Step 4: Configure Git Remote

### Option A: Via Obsidian Git Plugin (Recommended)

In Obsidian Git settings:
1. Set **Commit message** to: `vault sync: {{date}}`
2. Set **Auto commit and push** to: **ON**
3. Set **Auto commit interval** to: **10** minutes
4. Set **Auto pull interval** to: **5** minutes
5. **Custom Git binary path**: leave blank (uses system git)
6. **Disable on mobile**: **ON** (vault is desktop-only for now)

Then open the command palette (Ctrl/Cmd + P) and run:
```
Obsidian Git: Edit remotes
```

Add your remote:
- Name: `origin`
- URL: `https://github.com/YOUR_USERNAME/fiona-vault.git`

---

### Option B: Via Terminal (If Plugin Doesn't Work)

Open terminal in your vault folder:

```bash
# Navigate to vault
cd /path/to/your/FionaVault

# Initialize git (if not already)
git init

# Add remote
git remote add origin https://github.com/YOUR_USERNAME/fiona-vault.git

# Add all files
git add .

# First commit
git commit -m "Initial vault commit — FIONA v1.7 architecture"

# Push to GitHub
git branch -M main
git push -u origin main
```

---

## Step 5: First Commit

1. In Obsidian, open command palette (Ctrl/Cmd + P)
2. Run: `Obsidian Git: Commit all changes`
3. Enter message: `Initial vault commit — FIONA v1.7 architecture`
4. Run: `Obsidian Git: Push`
5. Check github.com/YOUR_USERNAME/fiona-vault — files should appear

---

## Step 6: Auto-Sync Setup

For continuous sync:

1. **Settings -> Community Plugins -> Obsidian Git -> Options**
2. Enable:
   - [x] Auto commit and push: **ON**
   - [x] Auto pull on startup: **ON**
   - [x] Auto commit interval: **10** minutes
   - [x] Auto pull interval: **5** minutes
   - [x] Pull before push: **ON** (prevents conflicts)

This ensures:
- Every 10 minutes: local changes committed + pushed to GitHub
- Every 5 minutes: latest changes pulled from GitHub
- On startup: vault is current

---

## Step 7: Clone on Lightning.ai (For Build)

During build, you'll need the vault on Lightning.ai:

```bash
# In Lightning.ai terminal
git clone https://github.com/YOUR_USERNAME/fiona-vault.git

# Or if using SSH (recommended for automation)
git clone git@github.com:YOUR_USERNAME/fiona-vault.git
```

mcp-obsidian will read from this cloned directory.

---

## Git Best Practices for Vault

### Commit Messages
Use descriptive prefixes:
- `arch:` — Architecture changes
- `build:` — Build day notes, module updates
- `research:` — Research findings
- `fix:` — Corrections, error fixes
- `daily:` — Daily standup log

Example: `arch: Update AEGIS-99 weights for MiniMax M3 upgrade`

### Branching
- `main` — Stable, current architecture
- `build-day-N` — Daily build branches (merge to main at end of day)
- `experiment` — Testing new ideas (never merge without review)

### Conflict Resolution
If sync conflicts occur:
1. Obsidian Git will show conflict markers
2. Open the file in Obsidian
3. Choose which version to keep (or merge manually)
4. Commit the resolution
5. Push

### .gitignore for Vault

Create `.gitignore` in vault root:
```gitignore
# Obsidian
.obsidian/workspace.json
.obsidian/graph.json
.obsidian/plugins/obsidian-git/data.json

# System files
.DS_Store
Thumbs.db

# Temporary
*.tmp
*.temp
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "Authentication failed" | Use personal access token instead of password (GitHub settings -> Developer settings -> Personal access tokens) |
| "Repository not found" | Check repo URL, ensure repo is created and private |
| "Nothing to commit" | Make sure files are saved in Obsidian (Ctrl/Cmd + S) |
| Sync not working | Check Obsidian Git plugin is enabled, restart Obsidian |
| Large files failing | GitHub has 100MB limit. Use Git LFS for large files if needed. |

---

## What This Enables

1. **Backup**: Your entire architecture is safely stored on GitHub
2. **Version history**: See every change, rollback if needed
3. **Multi-device**: Same vault on all your machines
4. **AI access**: mcp-obsidian reads from Git-cloned vault on Lightning.ai
5. **Collaboration**: Other supervisors can reference the same vault

---

*Setup this Git sync to activate the full Vault-as-Supervisor architecture.*
