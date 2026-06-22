---
type: skill
name: hermes-full-architecture-task-gate-review
source: https://x.com/jumperz/status/2055652189217923232
description: JUMPERZ's complete Hermes architecture with dual-mode operation (/task gate + chat mode), multi-agent domain ownership, review gate for risky ops, and Spark learning loop.
---

# Architecture Overview

## Dual-Mode Operation
- **Chat mode**: Plain English back-and-forth, no task overhead — for thinking out loud
- **/task mode**: Structured task submission with mandatory fields: owner (agent), target, deliverable. Gate rejects vague tasks.

## Architecture Layers
1. **Discord** — Orchestration layer (cockpit), not where work happens. Routes to Hermes.
2. **Hermes** — Supervisor agent (Codex/GPT-5.5 default reasoning). Routes, validates, schedules, mirrors progress, writes receipts. Does NOT do the work itself.
3. **Kanban** — Source of truth. Cards live in backlog → routing → in-progress → review → done.
4. **Discord mirrors** (#task-board, #ledger) — Live reflections of Kanban, NOT the canonical state.
5. **Specialist agents** — Each owns a domain

### Specialist Agent Examples
- Clawdia (coordinator)
- John (technical, debugging, infra)
- Scout (research, verification, sources)
- Maya (trends, market movement)
- Luna (voice)
- Kevin (strategy, positioning)
- Max (economist, ROI, cost discipline)
- Spark (pattern memory, learning)
- Nexus (x402, auth, payments)
- Lili (alignment, identity)

# Implementation

## 1. Set Up Dual-Mode System
Create two distinct interaction patterns:

**Chat mode** (in coordinator channel):
- Plain English, no overhead
- Think out loud with agent
- For quick questions, debugging, brainstorming

**/task mode** (structured submission):
```
/task
owner: [agent-name]
target: [specific goal]
deliverable: [what constitutes done]
```

## 2. Implement Task Gate
The /task gate rejects vague submissions. Before accepting:
- Check owner is a valid specialist agent
- Check target is specific and measurable
- Check deliverable is clearly defined

## 3. Kanban as Single Source of Truth
Set up Kanban board with lanes:
- Backlog
- Routing
- In Progress
- Review
- Done

Discord channels (#task-board, #ledger) are READ-ONLY mirrors. Never write to Discord as canonical.

## 4. Specialist Agent Pattern
Assign domain ownership to each agent:
- Clear scope of responsibility
- Agents communicate via task cards, not direct messaging
- Coordinator (Clawdia) breaks complex tasks into child cards

## 5. Review Gate for Risky Operations
Risky operations require human approval before execution:
- Code changes
- installs
- Secrets exposure
- Production modifications
- Billing changes
- Destructive commands
- Commits

## 6. Spark Learning Loop
Spark agent reads:
- runs/receipts/outcomes
- Patterns feed back into:
  - /task gate rejection criteria
  - Hermes routing to successful lanes
  - Agent pattern reuse

# Usage

## Submitting a Task
```
/task
owner: scout
target: Research 3 competitors for Dr. JPGamb voice agent
deliverable: List of 3 competitors with pricing, features, and weaknesses
```

## Task Flow
1. Task submitted in coordinator channel
2. Hermes reads intent, routes to correct agent
3. Task appears on Kanban board
4. Agent works on task in their own channel
5. Progress updates mirror to Discord
6. Receipt posted when complete
7. Spark learns from outcome

## Review Gate
When agent wants to execute risky operation:
1. Agent presents the action
2. User approves/rejects
3. Approved → execution → receipt logged

## Starting Small
Pick one draining workflow, wire one agent to own it. Add pieces when something bleeds.