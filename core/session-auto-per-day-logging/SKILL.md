---
type: skill
name: session-auto-per-day-logging
source: https://x.com/alexfinn/status/2057472125909479770
description: Auto-log sessions per day with natural language query. Ask "what did we work on April 15th?" to retrieve. Solves the interaction memory layer problem.
---

# Session Auto Per-Day Logging

**What it does:** Hermes Agent now auto-logs every session by date. Query historical context with natural language.

**The capability:**
```
Ask: "What did we work on April 15th?"
Get: All sessions, decisions, and outputs from that day
```

## Why This Matters

Solves the **interaction memory layer** problem:
- Factual memory = what happened (logs, artifacts)
- Interaction memory = what was meant, debated, decided
- Session auto-logging captures BOTH

Without this, agents lose:
- Why a decision was made (not just what)
- Context from calls and threads
- The debates that shaped outcomes

## Implementation Pattern

### The Command
```bash
# Log current session
hermes logs --date 2026-05-29

# Search sessions
hermes session --search "April 15 what did we work on"

# Query by date range
hermes logs --from 2026-05-01 --to 2026-05-15
```

### For OpenClaw: Implement Session Day Logging

```javascript
// In sessions_spawn or session management:
const sessionLog = {
  date: new Date().toISOString().split('T')[0], // "2026-05-29"
  sessionId: currentSession.id,
  summary: generateSessionSummary(),
  decisions: captureDecisions(),
  agentsUsed: captureAgentNames(),
  outputs: captureKeyOutputs(),
  threadId: currentThreadId
};

// Persist to memory/data layer
await db.insert('session_logs', sessionLog);
```

### Query Interface
```javascript
// Natural language query → session retrieval
async function querySessionHistory(question) {
  const date = extractDate(question); // "April 15th" → "2026-05-15"
  const sessions = await db.query(
    'SELECT * FROM session_logs WHERE date = ? ORDER BY time DESC',
    [date]
  );
  return formatSessionHistory(sessions);
}
```

## The Three Memory Layers (Complete System)

```
Layer 1: Factual Memory
  - Artifacts, docs, tickets, CRM entries
  - "What happened and where it lives"

Layer 2: Interaction Memory  
  - Calls, threads, debates, promises
  - "What people actually meant"
  - SOLVED BY: Session auto-logging

Layer 3: Action Memory
  - Coordinating from context
  - "Knowing when to move vs wait vs ask"
```

## Implementation Checklist

- [ ] Implement per-day session auto-logging in OpenClaw
- [ ] Store: date, session ID, summary, decisions, agents, outputs
- [ ] Build natural language query interface ("what did we work on X")
- [ ] Index by date for fast retrieval
- [ ] Persist interaction context (not just outputs)

## Usage

Use when:
- Building memory systems that need historical context
- Implementing the 3-layer company brain
- Creating agents that understand "why" not just "what"
- Auditing what decisions were made and why

## Related Skills
- `three-layer-company-brain` — Full memory layer framework
- `lossless-claw` — Long-term conversation memory
- `hermes-7-new-features` — Source of the feature

## Source
Alex Finn (@alexfinn) | Hermes Agent May 2026 update