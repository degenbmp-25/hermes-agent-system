---
name: "shann-hermes-multi-instance"
description: "Design and operate multiple isolated Hermes instances from one orchestrator. Use when planning profile-per-workstream systems, parallel agent lanes, or separating research/content/engineering/business-development context without memory bleed."
---

# shann-hermes-multi-instance

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/shannholmberg/status/2055059408305168691

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Turn a single-agent Hermes setup into a small set of isolated workstream instances coordinated by one operator.

## Procedure

1. Inventory workstreams that truly need isolation, such as research, content, engineering, sales, or client operations.
2. For each workstream, define owner name, mission, allowed tools, forbidden actions, memory scope, and expected outputs.
3. Create one directory/profile per instance. Keep config, memory, sessions, and skills separate.
4. Create an orchestrator note that lists each instance, its path/profile name, handoff contract, and escalation rules.
5. Route work through the orchestrator first. Spawn or invoke a specialist only when the task matches its ownership.
6. Require specialists to return receipts: files changed, decisions made, blockers, and next handoff target.
7. Review isolation monthly: remove profiles with no recurring work and split profiles that collect unrelated duties.

## Outputs

- Instance inventory
- Profile/workspace layout
- Orchestrator routing map
- Handoff receipt format

## Validation

- No profile depends on another profile memory to start basic work.
- Each profile has exactly one primary domain.
- A fresh operator can route a task using the orchestrator note without asking who owns it.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
