---
name: "hivemind-audit-trail-setup"
description: "Install and configure audit trail infrastructure on a fresh HiveMind client node. Covers SQLite audit logging, vault task ledger init, session logging, operator maintenance scheduling, and compliance report generation. Use when bootstrapping a new HiveMind client install or auditing an existing node's audit readiness."
---

# hivemind-audit-trail-setup

## Source Provenance

BeastmodeVault-authored operational skill. Derived from the Fusion Stack audit architecture (fusion-stack-spec.md), hermes-operator-maintenance, session-auto-per-day-logging, and the HIPAA compliance framework.

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Turn the audit trail architecture (SQLite audit logging, vault task ledger, session receipts, operator maintenance) into a repeatable, installable system on a new HiveMind client node. Produce a setup receipt that proves every audit component is live and queryable.

## Prerequisites

- Hermes or OpenClaw installed and authenticated
- Vault path configured (`~/vault/` or equivalent)
- Discord bot token with permissions to create channels and post messages
- SQLite3 installed (`sqlite3 --version`)
- Node.js for any helper scripts (optional)
- z13 hardware target for local SQLite (or any Linux machine for cloud-connected installs)

## Procedure

### Phase 1 — SQLite Audit Logger

**Goal:** Every AI query is logged with full metadata. Logs never leave the local machine unless explicitly exported.

1. Create the audit database directory:
   ```bash
   sudo mkdir -p /var/hermes/audit
   sudo chown $USER:$USER /var/hermes/audit
   chmod 700 /var/hermes/audit
   ```

2. Initialize the SQLite audit database:
   ```bash
   sqlite3 /var/hermes/audit/audit.db <<EOF
   CREATE TABLE IF NOT EXISTS audit_log (
     audit_id TEXT PRIMARY KEY,
     timestamp TEXT NOT NULL DEFAULT (datetime('now')),
     client_id TEXT NOT NULL,
     task_id TEXT,
     original_prompt TEXT,          -- Stored locally only, never exported
     sanitized_prompt TEXT,         -- PHI removed, used for cloud queries
     classification TEXT,           -- 'simple' | 'complex' | 'unknown'
     execution_location TEXT,       -- 'local' | 'cloud' | 'hybrid'
     local_model_used TEXT,
     cloud_models_used TEXT,        -- JSON array as string
     local_output TEXT,
     cloud_output TEXT,
     final_output TEXT,
     latency_ms INTEGER,
     cost_usd REAL,
     confidence REAL,
     success INTEGER NOT NULL DEFAULT 1,
     error TEXT
   );
   CREATE INDEX IF NOT EXISTS idx_timestamp ON audit_log(timestamp);
   CREATE INDEX IF NOT EXISTS idx_client_id ON audit_log(client_id);
   CREATE INDEX IF NOT EXISTS idx_execution_location ON audit_log(execution_location);
   CREATE INDEX IF NOT EXISTS idx_classification ON audit_log(classification);
   EOF
   ```

3. Verify the schema:
   ```bash
   sqlite3 /var/hermes/audit/audit.db ".schema audit_log"
   ```

4. Create a write script (`/usr/local/bin/hermes-audit-log`):
   ```bash
   #!/usr/bin/env bash
   # Usage: hermes-audit-log --client-id X --task-id Y --original-prompt "..." --classification simple --execution-location local --final-output "..."
   # All args are optional except --client-id. Missing args default to NULL.

   DB_PATH="/var/hermes/audit/audit.db"
   AUDIT_ID="$(uuidgen 2>/dev/null || cat /proc/sys/kernel/random/uuid)"
   TIMESTAMP="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

   # Parse arguments into variables (simplified — extend as needed)
   # In production, use Python or a proper arg parser
   echo "INSERT INTO audit_log (audit_id, timestamp, client_id, task_id, original_prompt, classification, execution_location, final_output, success)
         VALUES ('$AUDIT_ID', '$TIMESTAMP', '$CLIENT_ID', '$TASK_ID', '$ORIGINAL_PROMPT', '$CLASSIFICATION', '$EXECUTION_LOCATION', '$FINAL_OUTPUT', 1);"
   # → pipe to sqlite3 $DB_PATH
   ```

5. Create a read/query script (`/usr/local/bin/hermes-audit-query`):
   ```bash
   #!/usr/bin/env bash
   # Usage: hermes-audit-query --client-id X --start-date Y --end-date Z
   # Outputs JSON for easy consumption by compliance reports

   DB_PATH="/var/hermes/audit/audit.db"

   QUERY="SELECT audit_id, timestamp, client_id, task_id, classification,
                  execution_location, local_model_used, cloud_models_used,
                  latency_ms, cost_usd, confidence, success, error
           FROM audit_log
           WHERE timestamp BETWEEN '$START_DATE' AND '$END_DATE'"

   [[ -n "$CLIENT_ID" ]] && QUERY="$QUERY AND client_id = '$CLIENT_ID'"
   [[ -n "$EXECUTION_LOCATION" ]] && QUERY="$QUERY AND execution_location = '$EXECUTION_LOCATION'"

   sqlite3 -json "$DB_PATH" "$QUERY"
   ```

6. Make scripts executable:
   ```bash
   chmod +x /usr/local/bin/hermes-audit-log /usr/local/bin/hermes-audit-query
   ```

---

### Phase 2 — Vault Task Ledger Init

**Goal:** All agent work is tracked in a durable task ledger with audit-grade state transitions.

1. Create the vault task ledger directory structure:
   ```bash
   mkdir -p ~/vault/00-inbox
   mkdir -p ~/vault/40-handoff/to-clawdaunt
   mkdir -p ~/vault/40-handoff/to-clawdinho
   mkdir -p ~/vault/40-handoff/to-herminho
   mkdir -p ~/vault/40-handoff/from-clawdaunt
   mkdir -p ~/vault/40-handoff/from-clawdinho
   mkdir -p ~/vault/40-handoff/from-herminho
   touch ~/vault/40-handoff/to-clawdaunt/.gitkeep
   touch ~/vault/40-handoff/to-clawdinho/.gitkeep
   touch ~/vault/40-handoff/to-herminho/.gitkeep
   ```

2. Create the task ledger schema file (`~/vault/60-archive/task-ledger-schema.md`):
   ```markdown
   # Task Ledger Schema

   ## Task Status States
   - `backlog` — received, not started
   - `routed` — assigned to an agent
   - `in_progress` — agent is working on it
   - `review` — awaiting human review
   - `done` — completed and accepted
   - `blocked` — waiting on dependency or decision
   - `rejected` — returned for rework

   ## Task Entry Frontmatter
   ```yaml
   ---
   id: <uuid>
   created: <ISO timestamp>
   created_by: <agent name>
   status: backlog | routed | in_progress | review | done | blocked | rejected
   owner: <agent name>
   depends_on: <comma-separated task IDs>
   deliverable: <what constitutes done>
   acceptance_criteria:
     - <criterion 1>
     - <criterion 2>
   risk_level: low | medium | high | critical
   review_gate_required: true | false
   ---
   ```

   ## Handoff Files (40-handoff/)
   - One file per handoff
   - Filename format: `YYYY-MM-DD-HHMM-task-slug.md`
   - Atomic group: files with `atomic_with:` must land together
   - Archive (don't delete) completed handoffs → `40-handoff/archive/<agent>/`
   ```

3. Verify the ledger is writable by the current agent:
   ```bash
   touch ~/vault/00-inbox/test-write.md && rm ~/vault/00-inbox/test-write.md
   ```

---

### Phase 3 — Session Logging Setup

**Goal:** Every agent session produces a dated receipt. Session history is never lost.

1. Create the daily log root:
   ```bash
   mkdir -p ~/vault/memory
   ```

2. Create today's log file:
   ```bash
   DATE=$(date +%Y-%m-%d)
   touch ~/vault/memory/${DATE}.md
   echo "---" >> ~/vault/memory/${DATE}.md
   echo "date: $DATE" >> ~/vault/memory/${DATE}.md
   echo "agent: $(hostname)" >> ~/vault/memory/${DATE}.md
   echo "status: open" >> ~/vault/memory/${DATE}.md
   echo "---" >> ~/vault/memory/${DATE}.md
   ```

3. Configure session end receipts (add to agent startup hook):
   ```bash
   # At session end or after major milestones, append:
   # ## Session Receipt — HH:MM
   # - Decisions: <list>
   # - Files changed: <list>
   # - Links: <list>
   # - Blockers: <list>
   # - Follow-ups: <list>
   ```

4. Set the session receipt template (add to SOUL.md or agent prompt):
   ```
   At session end: append a session receipt to ~/vault/memory/YYYY-MM-DD.md.
   Format:
   ## Session Receipt — HH:MM
   - Decisions: <what was decided>
   - Commands run: <what was executed>
   - Files changed: <paths>
   - Links: <URLs>
   - Blockers: <what's blocking progress>
   - Follow-ups: <what needs to happen next>
   ```

---

### Phase 4 — Operator Maintenance Scheduling

**Goal:** The audit system is checked weekly. Nothing silently atrophies.

1. Create the maintenance cron job (runs every Sunday at 6 AM ET):
   ```bash
   # Weekly operator maintenance + audit verification
   # Cron: 0 6 * * 0
   ```

   Maintenance tasks:
   - Run `_tools/run-all.sh` on the vault (wikilink check, secret scan, manifest validation)
   - Check audit database row counts (are queries being logged?)
   - Verify all handoffs in the past week have receipts
   - Check for stale facts in memory (facts older than 30 days with no refresh)
   - Produce operator audit report → `~/vault/memory/YYYY-MM-DD-operator-audit.md`

2. Create the weekly audit check script (`/usr/local/bin/hermes-weekly-audit-check`):
   ```bash
   #!/usr/bin/env bash
   set -e
   DB_PATH="/var/hermes/audit/audit.db"
   VAULT_PATH="$HOME/vault"

   echo "=== Hermes Weekly Audit Check — $(date) ==="

   echo "-- Audit DB row count:"
   sqlite3 "$DB_PATH" "SELECT COUNT(*) as total_entries FROM audit_log;"

   echo "-- Entries this week:"
   sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM audit_log WHERE timestamp >= datetime('now', '-7 days');"

   echo "-- Success rate this week:"
   sqlite3 "$DB_PATH" "SELECT
     COUNT(CASE WHEN success=1 THEN 1 END) as successful,
     COUNT(CASE WHEN success=0 THEN 1 END) as failed,
     ROUND(100.0*COUNT(CASE WHEN success=1 THEN 1 END)/NULLIF(COUNT(*),0), 1) as success_rate
   FROM audit_log WHERE timestamp >= datetime('now', '-7 days');"

   echo "-- Execution location breakdown:"
   sqlite3 "$DB_PATH" "SELECT execution_location, COUNT(*) FROM audit_log WHERE timestamp >= datetime('now', '-7 days') GROUP BY execution_location;"

   echo "-- Client breakdown:"
   sqlite3 "$DB_PATH" "SELECT client_id, COUNT(*) FROM audit_log WHERE timestamp >= datetime('now', '-7 days') GROUP BY client_id;"

   echo "-- Handoff hygiene:"
   ls -la "$VAULT_PATH/40-handoff/" 2>/dev/null | tail -10

   echo "=== Check complete ==="
   ```

3. Schedule it:
   ```bash
   (crontab -l 2>/dev/null; echo "0 6 * * 0 /usr/local/bin/hermes-weekly-audit-check >> /var/log/hermes-audit-weekly.log 2>&1") | crontab -
   ```

---

### Phase 5 — Compliance Report Generation

**Goal:** A client can generate a compliance-ready audit report for any date range.

1. Create the report template (`~/vault/templates/audit-report-template.md`):
   ```markdown
   # HiveMind Audit Report

   **Client:** <client name>
   **Period:** <start date> to <end date>
   **Generated:** <ISO timestamp>
   **Prepared by:** <agent name>

   ---

   ## Executive Summary

   | Metric | Value |
   |--------|-------|
   | Total queries | <N> |
   | Successful | <N> |
   | Failed | <N> |
   | Success rate | <X%> |
   | Local execution | <N> |
   | Cloud execution | <N> |
   | Hybrid execution | <N> |
   | Average latency (ms) | <X> |
   | Total cloud cost (USD) | <$X.XX> |

   ---

   ## Query Classification Breakdown

   | Type | Count | % of Total |
   |------|-------|------------|
   | Simple (local) | <N> | <X%> |
   | Complex (cloud) | <N> | <X%> |
   | Unknown | <N> | <X%> |

   ---

   ## Per-Client Breakdown

   (if multi-client install)

   ---

   ## Task Ledger Summary

   | Status | Count |
   |--------|-------|
   | Backlog | <N> |
   | In Progress | <N> |
   | Done | <N> |
   | Blocked | <N> |

   ---

   ## Errors and Anomalies

   (List any failed queries, anomalous patterns, or security events)

   ---

   ## HIPAA / Compliance Notes

   (If PHI was processed: confirm sanitization before cloud dispatch,
   audit log retention compliance, any incidents to report)

   ---

   ## Recommendations

   (Generated by the agent based on patterns observed)

   ---

   *Report generated by HiveMind Audit System. Audit IDs available on request.*
   ```

2. Create the report generator script (`/usr/local/bin/hermes-audit-report`):
   ```bash
   #!/usr/bin/env bash
   # Usage: hermes-audit-report --client-id X --start-date Y --end-date Z --output report.md

   DB_PATH="/var/hermes/audit/audit.db"
   # Uses sqlite3 + bash string interpolation
   # Fills in the report template with actual query results
   # Outputs to --output file
   ```

---

### Phase 6 — Discord Audit Channel Setup

**Goal:** Real-time audit trail visible in Discord for human oversight.

1. Create `#audit-log` channel in Discord (via Discord developer portal or bot):
   - Permissions: private to operators only
   - Bot role: can post, cannot read older messages from other bots

2. Configure audit announcements (optional — every N queries or every error):
   ```
   The audit logger can optionally post summaries to #audit-log:
   - Error summary every 10 failed queries
   - Weekly summary every Sunday
   - Anomaly alert on any query flagged as suspicious
   ```

3. Create the Discord audit relay script (`/usr/local/bin/hermes-discord-audit-relay`):
   ```bash
   #!/usr/bin/env bash
   # Posts a formatted audit summary to #audit-log on Discord
   # Usage: hermes-discord-audit-relay --summary "text" --channel-id X --webhook-url Y
   ```

---

## Outputs

1. SQLite audit database at `/var/hermes/audit/audit.db`
2. `hermes-audit-log`, `hermes-audit-query`, `hermes-audit-report`, `hermes-weekly-audit-check`, `hermes-discord-audit-relay` scripts in `/usr/local/bin/`
3. Vault task ledger at `~/vault/40-handoff/` with schema at `~/vault/60-archive/task-ledger-schema.md`
4. Daily memory logs at `~/vault/memory/YYYY-MM-DD.md`
5. Weekly operator audit reports at `~/vault/memory/YYYY-MM-DD-operator-audit.md`
6. Compliance report template at `~/vault/templates/audit-report-template.md`
7. Scheduled weekly cron job at `0 6 * * 0`
8. Setup receipt at `~/vault/memory/YYYY-MM-DD-audit-setup-receipt.md`

## Validation

- `sqlite3 /var/hermes/audit/audit.db "SELECT COUNT(*) FROM audit_log;"` returns ≥ 0 (table exists)
- `hermes-audit-query --client-id test --start-date 2026-01-01 --end-date 2026-12-31` returns valid JSON or empty
- `ls ~/vault/40-handoff/to-clawdaunt/` is writable
- Today's session log exists at `~/vault/memory/YYYY-MM-DD.md`
- `crontab -l | grep hermes-weekly-audit-check` returns the scheduled job
- The audit report template at `~/vault/templates/audit-report-template.md` is readable

## Operating Rules

- Audit logs are append-only. Never delete rows — use a `retired` flag instead.
- PHI (original_prompt) never leaves /var/hermes/audit/
- Compliance reports are generated on-demand, not pushed automatically
- The weekly operator audit is the only recurring audit task — keep it lightweight
- Archive (don't delete) completed task handoffs in `40-handoff/archive/<agent>/`

## Open Questions (for Codex / human to resolve)

1. **Retention policy** — How long are audit logs kept? 90 days? 1 year? Indefinitely? This affects database size management.
2. **Multi-client isolation** — Should each client have their own SQLite database, or one database with client_id filtering? (Fusion Stack uses one DB per install with client_id filtering)
3. **Discord relay frequency** — Post every N queries? Every error? Daily summary only? (Audit noise vs. signal tradeoff)
4. **z13 vs. cloud** — Is this install targeting z13 (local SQLite) or cloud-connected? (Affects whether /var/hermes/audit/ is on local disk or a mounted volume)
5. **Compliance framework** — HIPAA only? Also GDPR? PCI? (Affects report template fields)
6. **API key / credential storage** — Where does the Discord webhook URL get stored? Environment variable? Encrypted file? (Security hardening)
7. **Backup** — Should the SQLite audit database be included in the vault git bundle backup, or kept separate?
