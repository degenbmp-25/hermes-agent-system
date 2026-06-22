---
type: skill
name: discord-hermes-kanban-orchestration
source: https://x.com/jumperz/status/2054138264731218284
description: Plain English → Discord coordinator → Hermes Kanban → Agent execution → Result posting. Discord is the conversation layer, Kanban is the ledger. Natural interface pattern for multi-agent task routing.
---

# Discord + Hermes Kanban Orchestration

**Core pattern:** Plain English requests in Discord get routed to a coordinator agent → Hermes Kanban → Agent execution → Result posting.

**Discord** = conversation layer (where you talk to agents)  
**Hermes Kanban** = source of truth (the ledger)

**Source:** @jumperz | 71 likes, 99 bookmarks | Established OpenClaw practitioner

---

# When to Use

- **Multi-agent task routing** — When you need visible audit trail of agent work
- **Team coordination** — Humans + agents working together with full visibility
- **Client-facing agent delivery** — Client sees task board, results, progress
- **Mobile-friendly agent interaction** — Works on mobile via Discord

**The key architectural point:** Discord is where you talk to agents. Kanban is the source of truth.

---

# The Pattern

```
User (Plain English)
    │
    ▼
Discord Coordinator Agent
    │ Reads intent from Discord message
    │
    ▼
Hermes Kanban (Task Ledger)
    │ Creates task, updates status
    │
    ▼
Agent Execution
    │ Worker agent picks up task
    │
    ▼
Result Posting
    │ Posts result back to Discord
```

---

# Step 1: User Request in Discord

User types plain English in Discord:
- "Can you research competitor pricing for X?"
- "Build me a landing page for product Y"
- "Summarize all the calls I had this week"

No special syntax. No slash commands. Natural language.

---

# Step 2: Discord Coordinator Agent

Coordinator agent reads the Discord message:
1. **Intent detection** — What does the user want?
2. **Task decomposition** — What are the steps?
3. **Routing** — Which agent handles each step?
4. **Kanban creation** — Create task cards in Hermes Kanban

---

# Step 3: Hermes Kanban as Ledger

Hermes Kanban stores:
- **Task cards** with status: To Do → In Progress → Done
- **Source messages** linking back to Discord
- **Agent assignments** (which agent handles which card)
- **Results** (agent outputs attached to cards)

```
│ Column 1 (To Do) │ Column 2 (In Progress) │ Column 3 (Done) │
│──────────────────│───────────────────────│──────────────────│
│ Research X       │ Build Landing Page     │ ✓ Pricing Report │
│                  │ @builder_agent        │   5 sources      │
```

**Benefit:** Full audit trail visible in Discord task-board.

---

# Step 4: Agent Execution

Worker agents pick up tasks from Kanban:
1. Read task card
2. Execute work
3. Update Kanban status
4. Post result to Discord

---

# Step 5: Result Posting

Agent posts result back to Discord:
- Links to completed Kanban card
- Summarizes output
- Marks task Done in Kanban

---

# Why Discord + Kanban

| Without Kanban | With Kanban |
|----------------|------------|
| Chat noise | Clean task ledger |
| No audit trail | Full history |
| Lost messages | Everything tracked |
| No status visibility | See progress live |
| Mobile hard | Works on mobile |

---

# Implementation

## Prerequisites

- Hermes Kanban installed and configured
- Discord channel with bot access
- Coordinator agent configured to read Discord
- Worker agents configured to read Kanban

## Flow Setup

1. **Discord bot** → listens to channel
2. **Coordinator agent** → reads Discord, creates Kanban cards
3. **Hermes Kanban** → stores tasks, tracks status
4. **Worker agents** → pick up Kanban cards, execute, post results

## For OpenClaw

This pattern can be adapted:
- Use OpenClaw's built-in task tracking instead of Hermes Kanban
- Use Discord message events to trigger coordinator
- Worker agents use sessions_spawn for parallel execution

---

# Usage

When a user asks something in Discord:

1. Coordinator reads the message
2. Creates task in Kanban/Hermes
3. Worker agents execute in parallel
4. Results post back to Discord
5. User sees: task → progress → result

---

# Related Skills

- [[hermes-multi-agent-team-profiles]] — Multi-agent team setup
- [[hermes-operator-layer]] — Hermes operator configuration
- [[multi-agent-orchestration]] — General multi-agent patterns

---

*Discord is where you talk to agents. Kanban is the source of truth.*

*Full audit trail visible in Discord task-board. Works on mobile.*

**Source:** https://x.com/jumperz/status/2054138264731218284