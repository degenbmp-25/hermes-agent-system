---
type: skill
name: hermes-agent-maturity-levels
source: https://x.com/shannholmberg/status/2056691391129092248
description: 4-level maturity model for Hermes/OpenClaw agent systems: prototype → specialize → orchestrate → automate. Each level unlocks new capability with distinct failure modes.
---

# Hermes Agent Maturity Model

**Source:** Shann³ (@shannholmberg) — https://x.com/shannholmberg/status/2056691391129092248

## The 4 Levels

### Level 1: Prototype + Orchestrator
**Start here.** Don't over-engineer. One agent doing work, one orchestrator directing it.

**What it looks like:**
- Single agent instance
- Human orchestrator (you) directing tasks
- No subagents yet

**Failure mode:** Mediocrity at scale — "If your output at level 1 is mediocre, you are about to scale mediocrity. 20 agents shipping low quality work at speed is worse than 3 shipping great work slowly."

### Level 2: Break Stable Workflows into Specialized Agents
**When to level up:** You have workflows that are stable enough to be delegated.

**What it looks like:**
- Identify repeatable workflows (research, coding, outreach, analysis)
- Break each into a specialized agent
- Orchestrator still coordinates, but agents do the work

**Specialization benefits:**
- Deeper context in each domain
- Faster execution per task
- Clearer success metrics per agent

### Level 3: Orchestrator Steers Specialist Team
**When to level up:** Your specialists work reliably and need coordination.

**What it looks like:**
- Orchestrator manages the team of specialists
- Each agent runs in isolated environment (Docker or profiles)
- Orchestrator assigns tasks, reviews outputs, routes results
- Human oversight on exceptions

**Implementation options:**
- Agent Control Room (Shann's setup) — isolated Docker agents
- Agent profiles under one instance — lighter weight

### Level 4: Fully Async Autonomous Crew
**When to level up:** You've earned it through levels 1-3.

**What it looks like:**
- Cron jobs and event triggers fire tasks automatically
- Task bus distributes work to idle agents
- Agents work without human intervention
- Reports flow back when complete or blocked

**Requirements:**
- All workflows documented and stable
- Error handling and retry logic in place
- Escalation paths clear
- Monitoring and alerting active

## The Maturity Equation

```
Level 4 = Level 3 + cron/events + task bus + autonomous execution
```

## Migration Path

```
Level 1 (proto + orch)
    ↓ [stable workflows identified]
Level 2 (specialized agents)
    ↓ [coordination reliable]
Level 3 (orchestrator steers team)
    ↓ [docs + error handling solid]
Level 4 (fully async crew)
```

## Warning: The Mediocrity Multiplier

> "If your output at level 1 is mediocre, you are about to scale mediocrity. 20 agents shipping low quality work at speed is worse than 3 shipping great work slowly."

Before leveling up, ask:
- Is my current output at this level high quality?
- Am I scaling excellence or amplifying mistakes?

## Evaluation Rubric

When deciding whether to break out a new agent or extend an existing one:

| Question | If Yes → | If No → |
|----------|----------|---------|
| Is this a new domain/skill? | New agent (Level 2) | Extend existing |
| Is workflow stable enough to document? | Level 2 candidate | Keep in proto |
| Do multiple agents need coordination? | Level 3 candidate | Keep at Level 2 |
| Are all workflows cron-able? | Level 4 candidate | Stay at Level 3 |

## Current State Assessment

Audit your agent system:

**Level 1 indicators:**
- [ ] Single orchestrator, single agent
- [ ] Most tasks done manually by human

**Level 2 indicators:**
- [ ] 2+ specialized agents for stable workflows
- [ ] Human still coordinates

**Level 3 indicators:**
- [ ] Orchestrator autonomously assigns to specialists
- [ ] Isolated agent environments (Docker/profiles)
- [ ] Human oversight on exceptions only

**Level 4 indicators:**
- [ ] Cron/event triggers fire work automatically
- [ ] Task bus routes to idle agents
- [ ] Minimal human intervention in normal flow

## Related Skills

- `hermes-7-new-features` — New features that accelerate reaching Level 4
- `hermes-multi-agent-architecture` — Architectural patterns for multi-agent coordination
- `team-inbox-ai-coordination` — Coordination patterns for Level 3+