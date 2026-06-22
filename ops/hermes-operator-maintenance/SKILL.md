---
name: "hermes-operator-maintenance"
description: "Run the operational maintenance layer for Hermes profile teams: daily checks, handoff hygiene, memory KPI audits, role policy ceilings, drift/rot/bloat/collision detection, and team reference updates."
---

# hermes-operator-maintenance

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/nyk_builderz/status/2044472463279710344

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Give operators a concrete maintenance cadence for keeping a multi-agent deployment reliable.

## Procedure

1. Start with the team registry and identify profiles active in the last review period.
2. Check handoff receipts for missing inputs, unclear outputs, or repeated rework.
3. Audit memory: stale facts, duplicated facts, contradictions, and private data in the wrong scope.
4. Audit skills: unused, overlapping, broken, or unsafe skills.
5. Audit policies: external actions, filesystem access, schedulers, and public messages.
6. Open fixes as tasks with owners and due dates.
7. Update the team reference after changes so future routing reflects reality.

## Outputs

- Operator audit report
- Fix task list
- Updated team reference

## Validation

- Audit covers handoffs, memory, skills, and policies.
- Each fix has an owner or explicit defer decision.
- Team reference matches current active profiles.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
