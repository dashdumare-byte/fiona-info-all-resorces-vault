---
tags: [notebooklm, obsidian, integration, google-drive, research, layer-2]
date-created: 2026-06-06
source: Layer 2 research — NotebookLM-Obsidian integration analysis
---

# NotebookLM Integration

> **Four integration methods. NotebookLM ingests vault for deep research synthesis. Vault remains source of truth.**

---

## What NotebookLM Provides

| Feature | Use for FIONA |
|---------|--------------|
| **Audio Overviews** | Ashandy listens to architecture summaries while commuting |
| **Data Tables** | Structured extraction from vault (model specs, version gates) |
| **Source-Grounded Q&A** | Ask questions about architecture, get cited answers |
| **Multi-Source Synthesis** | Combine vault + module files + research papers |

---

## Key Limitation

**NotebookLM sources are STATIC snapshots.** They do NOT auto-refresh when vault changes.

**Solution**: Manual sync, Chrome extension refresh, or automated push (see Method 3).

---

## Method 1: Google Drive Sync (Simplest)

### How It Works
1. Sync Obsidian vault to Google Drive (via Local Folder Sync or Obsidian Google Drive plugin)
2. NotebookLM reads .md files directly from Google Drive
3. Markdown is a subset of plain text — NotebookLM handles it natively

### Setup Steps
1. Install Google Drive sync for your OS
2. Add FionaVault folder to synced folders
3. In NotebookLM: "Add Source" -> Google Drive -> Select vault folder
4. All .md files become sources

### Pros
- Simple, no coding
- Works immediately
- Free

### Cons
- Manual refresh (static snapshots)
- All files sync (no filtering)

---

## Method 2: Apps Script Automation (Recommended)

### How It Works
1. Google Apps Script watches vault folder in Drive
2. On trigger (hourly or manual): merges all .md files into one master .txt
3. Auto-updates NotebookLM source
4. NotebookLM Tools Chrome extension provides refresh button

### Apps Script Code
```javascript
function updateNotebookLMSource() {
  const folderId = 'YOUR_VAULT_FOLDER_ID'; // FionaVault in Drive
  const folder = DriveApp.getFolderById(folderId);
  const files = folder.getFilesByType('text/markdown');
  
  let merged = '# FIONA v1.7 Vault Export\n\n';
  merged += 'Generated: ' + new Date().toISOString() + '\n\n';
  merged += '---\n\n';
  
  while (files.hasNext()) {
    const file = files.next();
    merged += '\n\n=== ' + file.getName() + ' ===\n\n';
    merged += file.getBlob().getDataAsString();
    merged += '\n\n---\n';
  }
  
  // Save to Drive as master export
  const exportName = 'FionaVault-Export-' + new Date().toISOString().split('T')[0] + '.txt';
  DriveApp.createFile(exportName, merged, MimeType.PLAIN_TEXT);
  
  // NotebookLM will pick up this file from Drive
}

// Run hourly
ScriptApp.newTrigger('updateNotebookLMSource')
  .timeBased()
  .everyHours(1)
  .create();
```

### Pros
- Automated sync
- Single aggregated file for NotebookLM
- Timestamped exports

### Cons
- Requires Google Apps Script setup
- Still hourly (not real-time)

---

## Method 3: obsidian-notebooklm Adapter (Advanced)

### How It Works
GitHub: `romular21/obsidian-notebooklm`

- Python tool watches vault folders
- Aggregates to Google Doc (better formatting than .txt)
- Auto-updates with debouncing
- Multi-target support
- Cross-platform

### Setup
```bash
# Install
pip install obsidian-notebooklm

# Configure
notebooklm --init
# Set vault path: /path/to/FionaVault
# Set Google credentials
# Set target: notebooklm

# Run (continuous watch)
notebooklm --watch --vault ~/FionaVault
```

### Pros
- Purpose-built for Obsidian
- Google Doc target (rich formatting)
- Debounced (no excessive updates)
- Cross-platform

### Cons
- Requires Python + pip install
- More complex setup

---

## Method 4: MCP Market Skill (Bidirectional)

### How It Works
NotebookLM to Obsidian sync via Claude Code MCP:

- Imports NotebookLM sources as individual Markdown files
- Resolves citations to wikilinks
- Generates Dataview dashboards
- Useful for: bringing NotebookLM research BACK into vault

### Use Case
1. NotebookLM synthesizes research on a topic
2. MCP skill exports synthesis as .md into vault
3. Becomes part of permanent architecture documentation

---

## Recommended FIONA Setup

| Component | Tool | Purpose |
|-----------|------|---------|
| **Vault source of truth** | Obsidian + Git | Real-time, versioned, AI-accessible via mcp-obsidian |
| **Deep research synthesis** | NotebookLM + Method 2 (Apps Script) | Audio overviews for Ashandy, structured data extraction |
| **AI model access** | mcp-obsidian bridge | All 9 models query vault in real-time during build |
| **Bidirectional sync** | Method 4 (MCP) | NotebookLM insights back into vault |

### Daily Workflow
1. **Morning**: Listen to NotebookLM Audio Overview of vault changes (commute)
2. **During build**: All models access vault via mcp-obsidian (real-time)
3. **Evening**: Apps Script auto-syncs day's changes to NotebookLM
4. **Research**: NotebookLM Q&A on architecture + module files + external sources

---

## Star NotebookLM Plugin (Obsidian)

Obsidian community plugin: `notebooklm-star`

- Embeds NotebookLM webview inside Obsidian
- Side-by-side: vault + NotebookLM
- Useful for: live reference while editing

---

*Integration analysis: 2026-06-06 | Layer 2 research*
