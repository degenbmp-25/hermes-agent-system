---
type: skill
name: hermes-7-new-features
source: https://x.com/alexfinn/status/2057472125909479770
description: Seven new Hermes Agent features from May 2026 update: session memory logging, background tasks, xAI/Grok OAuth, X posting/fetching, Codex CLI native, AI video generation, and Auto Kanban task breakdown.
---

# Hermes Agent — 7 New Features (May 2026 Update)

**Source:** https://x.com/alexfinn/status/2057472125909479770

## Overview

Alex Finn reported 7 major Hermes Agent features from a single week's update. These represent significant capability expansion.

## Feature 1: Session Memory Logging

**What:** Hermes now auto-logs every session by date.

**Capability:** Query "what did we work on April 15th?"

**Use Case:** Solves the interaction memory layer problem directly. Historical context retrieval becomes automatic.

### Implementation
```
hermes logs --date 2026-05-15
hermes session --search "what did we work on"
```

## Feature 2: Background Tasks (/background)

**What:** Run multiple tasks simultaneously — main task + N background tasks.

**Pattern:** Give background tasks, continue with main work.

**Use Case:** Concurrent agent work without blocking.

### Implementation
```
/background [task description]
# Continue with main task
# Background task completes and notifies
```

## Feature 3: xAI/Grok OAuth Orchestrator

**What:** Use existing Grok account as orchestrator at no extra cost.

**Significance:** xAI opening OAuth for agent orchestration validates Grok as first-class agent brain.

**Use Case:** Cost-effective multi-model orchestration.

### Implementation
```
hermes auth --grok-oauth
hermes config --orchestrator grok
```

## Feature 4: X Posting/Fetching via Grok OAuth

**What:** Hermes can search, find, and create X posts natively.

**Use Case:** Full X integration for intelligence pipeline and content automation.

### Implementation
```
hermes x --search "AI agents"
hermes x --post "message"
hermes x --fetch @username
```

## Feature 5: Codex CLI Native Integration

**What:** Agent spins up Codex CLI autonomously for coding tasks.

**Use Case:** "Vibe coding" — agent drives Codex without human intervention.

### Implementation
```
hermes code --task "build feature"
# Agent spins up Codex CLI autonomously
```

## Feature 6: Native AI Video Generation

**What:** Hermes agent can generate AI videos via Grok Imagine integration.

**Use Case:** Content agent pipeline now produces video, not just text.

### Implementation
```
hermes video --prompt "description"
# Uses Grok Imagine for generation
```

## Feature 7: Auto Kanban Task Breakdown

**What:** Drop goals into triage → Hermes auto-breaks into subagent tasks.

**Use Case:** Automatic task decomposition. Maps to team inbox / task orchestration patterns.

### Implementation
```
# Open kanban board
hermes dashboard
# Drop goal in triage category
# Hermes auto-creates subagent tasks
```

## Priority Actions

1. **Test session memory search** — Query historical work
2. **Enable Grok OAuth** — Add as orchestrator option
3. **Explore X integration** — For intelligence pipeline
4. **Evaluate Codex CLI** — For coding agent workflows
5. **Test Auto Kanban** — For team orchestration

## Key Insight

**Hermes is accelerating.** 7 major features in one week signals rapid development pace. Auto Kanban = automatic task decomposition is the missing link in team inbox patterns.

## Related Skills

- [[team-inbox-ai-coordination]] — Task orchestration
- [[grok-watchlist-research-pattern]] — X intelligence
- [[hermes-multi-agent-architecture]] — Multi-agent setup