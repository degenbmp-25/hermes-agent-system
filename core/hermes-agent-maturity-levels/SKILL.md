---
name: "hermes-agent-maturity-levels"
description: "Assess Hermes/OpenClaw agent-system maturity across Level 1 prototype, Level 2 specialization, Level 3 orchestration, and Level 4 automation. Use before adding agents, schedulers, background work, or complex operator layers."
---

# hermes-agent-maturity-levels

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/shannholmberg/status/2056691391129092248

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Prevent premature scaling by measuring the current agent system before adding more machinery.

## Procedure

1. Identify the system being assessed: agent names, repos, vaults, tools, memory locations, and active workflows.
2. Score Level 1: can one agent reliably complete useful work with durable notes and verification?
3. Score Level 2: are stable repeatable workflows assigned to specialized agents or skills?
4. Score Level 3: does an orchestrator route work, enforce handoffs, and review outputs?
5. Score Level 4: are automations scheduled, monitored, reversible, and governed by policies?
6. For each level, list evidence, missing pieces, and failure modes.
7. Recommend the next level only when the current level is boringly reliable.
8. Return a maturity verdict: current level, do-not-skip blockers, and next 3 upgrades.

## Outputs

- Maturity verdict
- Evidence list
- Failure-mode list
- Next-upgrade plan

## Validation

- The verdict is based on observed artifacts, not aspiration.
- No new agents are recommended before Level 1 quality is proven.
- Automation recommendations include rollback or monitoring.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
