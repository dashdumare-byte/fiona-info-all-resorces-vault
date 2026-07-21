# SSH Key Restore Instructions

> **NEVER regenerate the SSH key. Always restore it from this vault.**

## Why This File Exists

The `~/.ssh/` directory gets wiped between sessions. The SSH key for pushing to GitHub is stored INSIDE this vault folder so it persists forever.

## The Key Files

| File | What It Is |
|------|-----------|
| `.ssh_key_private` | Private key (KEEP SECRET) |
| `.ssh_key_public` | Public key (already on GitHub as "FionaVault") |

## How to Restore (Copy-Paste These Commands)

```bash
# 1. Create .ssh directory
mkdir -p ~/.ssh

# 2. Copy private key from vault to .ssh
cp /path/to/FionaVault/.ssh_key_private ~/.ssh/id_ed25519

# 3. Copy public key
cp /path/to/FionaVault/.ssh_key_public ~/.ssh/id_ed25519.pub

# 4. Set correct permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# 5. Add GitHub to known hosts
ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts

# 6. Test connection
ssh -T git@github.com

# 7. Set remote to SSH
cd /path/to/FionaVault
git remote set-url origin git@github.com:dashdumare-byte/fiona-info-all-resorces-vault.git
```

## After Restore

```bash
# Pull latest
git pull origin main

# Make changes, then push
git add -A
git commit -m "your message"
git push origin main
```

## NEVER DO THIS

- ❌ Regenerate a new SSH key
- ❌ Switch to HTTPS remote
- ❌ Delete the `.ssh_key_private` file from this vault

## Repo URL (Permanent)

```
git@github.com:dashdumare-byte/fiona-info-all-resorces-vault.git
```

Last updated: 2026-07-21
