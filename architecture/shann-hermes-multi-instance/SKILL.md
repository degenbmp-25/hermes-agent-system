---
type: skill
name: shann-hermes-multi-instance
description: Run multiple isolated Hermes agents controlled by a single CLI orchestrator — the "company brain" pattern. Enables parallel workstreams (research, content, BD) without context bleeding or shared rate limits.
date: 2026-05-17
author: shannholmberg
source: https://x.com/shannholmberg/status/2055059408305168691
salience: 0.85
tags: [hermes, multi-instance, orchestration, architecture, cli]
---

# SKILL.md — Shann Hermes Multi-Instance Control

## What It Is

A pattern where a single CLI agent acts as the "company brain" orchestrator, controlling multiple isolated Hermes instances — each running in its own folder with its own config, memory, and sessions. This turns a monolithic single-agent setup into a distributed agent company.

## Why It Matters

- **Parallel workstreams:** Research, content, and BD can run simultaneously without shared context or rate limits
- **Isolation:** One agent's memory/sessions don't bleed into another
- **Fast instantiation:** New Hermes instances can be spun up in under 2 minutes
- **Clear ownership:** Each instance has a defined role (research, content, BD, etc.)

## Architecture

```
CLI Orchestrator ("Company Brain")
├── hermes-research/    (instance 1)
├── hermes-content/    (instance 2)
└── hermes-bd/         (instance 3)
```

Each instance is a full Hermes install with:
- Own config
- Own memory
- Own sessions
- Own skills

The CLI agent coordinates across them via the filesystem or inter-process communication.

## Prerequisites

- Hermes installed
- CLI access to create folders and launch Hermes instances
- Understanding of Hermes profile/instance architecture

## Usage

### 1. Plan Your Instance Roles

Map workstreams to isolated instances:
- **Research:** Web search, data gathering, competitive analysis
- **Content:** Writing, content drafting, editing
- **BD:** Outreach, lead research, relationship management

### 2. Spin Up Instances

```bash
# Create instance folders
mkdir hermes-research hermes-content hermes-bd

# Initialize each with separate Hermes config
# (per your Hermes install method)
```

### 3. Run the Company Brain CLI

A single CLI agent reads from a central coordination folder and dispatches tasks to each instance based on context.

### 4. Monitor and Aggregate

The CLI agent collects outputs from each instance and synthesizes them into a unified response.

## Key Principles

1. **One role per instance** — Don't let an instance do too much; isolation is the point
2. **Fast failover** — If one instance goes down, the orchestrator can spin up a replacement
3. **Clear inter-process communication** — Use a shared folder, queue, or message bus between CLI and instances
4. **Memory independence** — Each instance's long-term memory stays siloed

## Related

- Multi-agent QA pattern (super-self-improving-multi-agent-framework.md)
- Hermes Profiles feature (witcheer-hermes-profiles-mcp.md)
- 3-layer company brain (Shann, 2026-05-15)

## Status

- Source scored: 8/10 CRABHAMMER
- Extracted: 2026-05-17
- Skillified: 2026-06-12
