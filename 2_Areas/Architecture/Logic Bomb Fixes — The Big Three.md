---
tags: [security, logic-bombs, state-persistence, network-gate, idempotency, critical]
date-created: 2026-07-28
source: DOCX "Fiona GGOG" + Additional Fiona Architecture Info
---

# Logic Bomb Fixes — The Big Three

> **Three catastrophic failure modes that killed earlier AI build attempts. Each one has been identified, analyzed, and fixed with a specific guard.**

---

## 1. Groundhog Day Restart

**The Bug:** After a minor error, the agent restarts the ENTIRE build from Step 1 instead of continuing from where it left off. This causes infinite loops and wasted tokens as the same initial steps are re-executed endlessly.

**When It Happens:**
- After any non-fatal error (syntax error, test failure, lint warning)
- When agent context is refreshed or cleared
- When switching between supervisors or models
- After overnight pause → morning session

**The Fix — State-Persistence Checkpoints:**

```python
# State checkpoint system — saves full build state after each module
class StateCheckpoint:
    def save(self):
        checkpoint = {
            "last_completed_module": current_module_id,  # e.g. "M27"
            "last_completed_step": current_step,           # e.g. "Step 8: Cursor Hard Gate"
            "module_status": {                            # All 69 modules
                mid: {
                    "status": "completed|in_progress|blocked",
                    "aegis_score": score,
                    "last_updated": timestamp
                }
                for mid in all_modules
            },
            "supervisor_state": {
                "claude_context": claude.get_current_context(),
                "codex_context": codex.get_current_context(),
                "opencode_context": opencode.get_current_context()
            },
            "memory_state": {
                "chroma_embeddings": chroma.export_metadata(),
                "supabase_tables": db.export_state()
            },
            "budget_state": {
                "total_spent": current_spend,
                "remaining": budget - current_spend,
                "daily_spend": today_spend
            }
        }
        
        # Save to persistent storage
        with open("fiona_state_checkpoint.json", "w") as f:
            json.dump(checkpoint, f, indent=2)
        
        # Also sync to MEMORY.md
        update_memory_md(checkpoint)

    def restore(self):
        checkpoint = load("fiona_state_checkpoint.json")
        
        # Validate checkpoint integrity
        if not validate_checksum(checkpoint):
            raise CheckpointCorruptedError("State checkpoint is corrupted!")
        
        # Restore module state
        current_module_id = checkpoint["last_completed_module"]
        current_step = checkpoint["last_completed_step"]
        module_status = checkpoint["module_status"]
        
        # Log restoration
        log.info(f"State restored: Module {current_module_id}, Step {current_step}")
        return checkpoint
```

**Rules:**
1. **Checkpoint after EVERY completed module** — before moving to next
2. **Checkpoint every 30 minutes** during long-running tasks
3. **Validate on restore** — checksum prevents corrupted checkpoints
4. **Never restart from Step 1** unless explicitly commanded by Ashandy
5. **Log all restores** — "State restored to Module X, Step Y at [timestamp]"

**Integration:**
- State saved to `fiona_state_checkpoint.json` + `MEMORY.md`
- Synced to Supabase every 60 seconds
- Part of the 60s Mega Cycle heartbeat check
- Supervisors restore state automatically on session start

---

## 2. Network Health Gate

**The Bug:** When latency between the Dell laptop (orchestration) and Lightning.ai (production) exceeds 250ms, operations continue but fail silently or produce corrupted output. Slow responses cause timeouts, retry storms, and data corruption.

**When It Happens:**
- Lightning.ai server under heavy load
- Dell laptop on poor WiFi
- VPN/routing issues between locations
- Background downloads/uploads saturating bandwidth

**The Fix — Hard-Coded Latency Check:**

```python
# Network Health Gate — checks latency before ANY operation
class NetworkHealthGate:
    LATENCY_THRESHOLD_MS = 250  # Hard stop threshold
    WARNING_THRESHOLD_MS = 150  # Warning but continue
    
    def check(self):
        latency = measure_latency("dell-laptop", "lightning.ai")
        
        if latency > self.LATENCY_THRESHOLD_MS:
            # HARD STOP — Pause ALL operations
            log.critical(f"Network latency {latency}ms exceeds threshold {self.LATENCY_THRESHOLD_MS}ms")
            
            alert_ashandy(f"NETWORK HALT: Latency {latency}ms. All operations paused.")
            
            # Save state immediately
            state_checkpoint.save()
            
            # Pause all supervisors
            claude.pause()
            codex.pause()
            opencode.pause()
            
            # Wait for network recovery
            while latency > self.LATENCY_THRESHOLD_MS:
                time.sleep(30)  # Check every 30 seconds
                latency = measure_latency("dell-laptop", "lightning.ai")
                log.info(f"Waiting for network recovery... Current: {latency}ms")
            
            # Network recovered — resume
            log.info(f"Network recovered: {latency}ms. Resuming operations.")
            claude.resume()
            codex.resume()
            opencode.resume()
            
        elif latency > self.WARNING_THRESHOLD_MS:
            # Warning — continue but log
            log.warning(f"Network latency {latency}ms above warning threshold")
            
        else:
            # Healthy
            log.debug(f"Network healthy: {latency}ms")

    def monitor(self):
        # Run as background thread
        while True:
            self.check()
            time.sleep(5)  # Check every 5 seconds
```

**Rules:**
1. **Check latency every 5 seconds** (background thread)
2. **>250ms = HARD STOP** — pause ALL operations immediately
3. **>150ms = WARNING** — log but continue
4. **<150ms = HEALTHY** — normal operation
5. **Save state before pausing** — prevents data loss during halt
6. **Resume automatically** when latency drops below threshold
7. **Alert Ashandy** on every halt event

**Integration:**
- Runs as overseer background thread (Pi Agent)
- Part of the 60s Mega Cycle health check
- State checkpoint auto-saved on halt
- Resume triggers Session Start Protocol on recovery

---

## 3. Idempotent Execution

**The Bug:** Running a script twice creates duplicate files, corrupts databases, or double-processes data. This happens because scripts are not designed to be safe to re-run.

**When It Happens:**
- After Groundhog Day restart → script re-runs
- After Network Health Gate recovery → operations resume
- After supervisor crash → recovery attempts repeat last action
- During trap door auto-fix → same fix attempted multiple times

**The Fix — Idempotency Guard:**

```python
# Idempotency decorator — ensures any function can be called multiple times safely
from functools import wraps
import hashlib

def idempotent(key_func=None):
    """
    Decorator that ensures function execution is idempotent.
    
    Before executing:
    1. Generates a unique key for this call
    2. Checks if this exact call has already been completed
    3. If yes → returns cached result (no re-execution)
    4. If no → executes and records completion
    """
    def decorator(func):
        # Track completed executions
        completed = load_idempotency_log()  # Persistent storage
        
        @wraps(func)
        def wrapper(*args, **kwargs):
            # Generate unique key for this call
            if key_func:
                key = key_func(*args, **kwargs)
            else:
                # Default: hash of function name + args + kwargs
                call_data = f"{func.__name__}:{str(args)}:{str(kwargs)}"
                key = hashlib.sha256(call_data.encode()).hexdigest()[:16]
            
            # Check if already completed
            if key in completed:
                log.info(f"Idempotent hit: {func.__name__} with key {key} — skipping (already done)")
                return completed[key]["result"]
            
            # Execute
            log.debug(f"Idempotent miss: {func.__name__} with key {key} — executing")
            result = func(*args, **kwargs)
            
            # Record completion
            completed[key] = {
                "function": func.__name__,
                "timestamp": datetime.now().isoformat(),
                "result_hash": hashlib.sha256(str(result).encode()).hexdigest()[:8],
                "result": result  # Or just store hash for large results
            }
            save_idempotency_log(completed)
            
            return result
        return wrapper
    return decorator


# Example usage
@idempotent(key_func=lambda module_id: f"module_build:{module_id}")
def build_module(module_id: str):
    """Build a single FIONA module. Safe to call multiple times."""
    # ... build logic ...
    return BuildResult(success=True, module_id=module_id)

@idempotent(key_func=lambda adapter_name: f"dcc_install:{adapter_name}")
def install_dcc_adapter(adapter_name: str):
    """Install a DCC adapter. Won't reinstall if already done."""
    # ... install logic ...
    return InstallResult(success=True, adapter=adapter_name)

@idempotent(key_func=lambda db_name: f"db_migration:{db_name}")
def run_database_migration(db_name: str):
    """Run database migration. Safe to retry."""
    # ... migration logic ...
    return MigrationResult(success=True, db=db_name)
```

**Rules:**
1. **Every module build function** must be wrapped with `@idempotent`
2. **Every DCC adapter install** must be idempotent
3. **Every database migration** must be idempotent
4. **Every file creation** must check if file already exists
5. **Log all idempotent hits** — "Skipping [function] — already completed"
6. **Key must be deterministic** — same inputs → same key, every time
7. **Storage must be persistent** — survives restarts (use SQLite or JSONL)

**Integration:**
- `@idempotent` decorator applied to all build functions
- Idempotency log stored in `fiona_idempotency_log.jsonl`
- Part of every supervisor's build pipeline
- AEGIS-99 checks idempotency before marking module complete

---

## Why These Three Are Non-Negotiable

| Without Fix | With Fix |
|------------|----------|
| Groundhog Day → Infinite restart loops, wasted tokens, never completing | Checkpoints → Resume from exact failure point |
| Network Health → Silent failures, corrupted data, wasted hours | Latency gate → Hard stop before corruption |
| Idempotent → Duplicate files, corrupt DB, double processing | Idempotency → Safe to retry any operation |

**All three work together:**
- Network Health Gate detects latency → pauses
- State Checkpoint saves current position
- Idempotency ensures safe resume when network recovers
- Result: Zero data loss, zero wasted tokens

---

## Pre-Merge Checklist for Logic Bombs

```markdown
## Logic Bomb Prevention Checklist

### Groundhog Day Restart
- [ ] State checkpoint system implemented
- [ ] Checkpoint saved after every module
- [ ] MEMORY.md auto-updated with current state
- [ ] Supabase sync every 60 seconds
- [ ] Session Start Protocol reads last checkpoint

### Network Health Gate
- [ ] Latency monitor thread running (5s interval)
- [ ] 250ms hard stop threshold configured
- [ ] 150ms warning threshold configured
- [ ] Ashandy alert on halt configured
- [ ] Auto-save on halt implemented
- [ ] Auto-resume on recovery implemented

### Idempotent Execution
- [ ] @idempotent decorator implemented
- [ ] Applied to all build_module functions
- [ ] Applied to all DCC adapter installs
- [ ] Applied to all database migrations
- [ ] Idempotency log persisted to disk
- [ ] AEGIS-99 validates idempotency on module complete
```

---

## Related Files
- [[Session Start Protocol]] — Reads checkpoint on every session start
- [[Cron Automation — Build & Runtime Schedules]] — Network check runs every 5s
- [[Overseer Configuration]] — Pi Agent monitors network health
- [[Mega Cycle System Integration]] — Part of 60s cycle health check
- [[AEGIS-99 Consensus Engine]] — Validates idempotency before module pass
- [[F-GARP - Deadlock Recovery]] — If all three fail → F-GARP escalation
