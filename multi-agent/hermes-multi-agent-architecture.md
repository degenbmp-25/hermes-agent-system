---
type: skill
name: hermes-multi-agent-architecture
source: https://x.com/jumperz/status/2055652189217923232
description: Full multi-agent architecture: supervisor (Hermes) + specialist agents + review gate + learning layer (Spark). Discord is orchestration layer, Kanban is source of truth.
---

# Hermes Multi-Agent Architecture

Complete multi-agent architecture with supervisor, specialists, review gates, and learning.

## Architecture Overview

```
DISCORD (orchestration layer)
    ↓
HERMES (supervisor - routes, validates, schedules, writes receipts)
    ↓
KANBAN (source of truth - canonical state)
    ↓
SPECIALIST AGENTS (execute work)
    ↓
SPARK (learning layer - reads outcomes, feeds patterns back)
```

## Key Principles

### 1. Hermes as Supervisor (Not Executor)
- Routes, validates, schedules, writes receipts
- Does NOT do the work itself
- Specialists execute actual tasks

### 2. /task Gate (Structured Input)
Mandatory fields for durable tasks:
- **owner** — which agent handles it
- **target** — what needs to happen
- **deliverable** — what gets produced

Gate rejects vague tasks. Forces clear thinking.

### 3. Dual-Mode Operation
- **Chat mode:** Plain English back-and-forth — for thinking out loud, no task overhead
- **/task mode:** Structured submission — for durable work with full audit trail

### 4. Single Source of Truth
- **Kanban** = canonical state
- **Discord mirrors** (#task-board, #ledger) = read-only views
- Never have two sources of truth

### 5. Review Gate for Risky Operations
Tasks hitting these categories pause for human approval:
- Code changes
- Secret/key access
- Production deployments
- Billing operations
- Destructive commands
- Commits

### 6. Spark Learning Layer
Reads runs/receipts/outcomes. Feeds patterns back:
- `/task` gate gets smarter at rejecting bad shapes
- Hermes routes to lanes that worked before
- Agents reuse winning patterns

## Specialist Agent Pattern

Each agent owns a domain:
- **Clawdia** — coordinator for multi-agent tasks
- **John** — technical, debugging, infra
- **Scout** — research, verification, sources
- **Luna** — voice
- **Spark** — pattern memory, learning

## Discord Mirror Pattern

```
#coordinator-channel    → plain English task input
#task-board            → live Kanban reflection (read-only)
#results-channel       → final receipts
#ledger                → audit trail
```

## Implementation for Our System

1. Start with coordinator agent (supervisor pattern)
2. Add one specialist agent for voice/Dr. JPGamb domain
3. Implement task gate with owner/target/deliverable
4. Set up review gate for risky operations
5. Add Spark-style learning layer reading receipts

## Source

JUMPERZ (@jumperz) — established OpenClaw practitioner