---
name: "hermes-task-gate-operations"
description: "Operate the task-gate review layer for Hermes systems: classify chat vs task, enforce required task fields, route to domain agents, review risky work, and record receipts. Use during day-to-day operations of a multi-agent architecture."
---

# hermes-task-gate-operations

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/jumperz/status/2055652189217923232

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Provide the operational version of the task gate for live systems.

## Procedure

1. Classify inbound messages as chat, task, status request, correction, or external-action request.
2. For tasks, require owner, target, deliverable, acceptance criteria, and risk level before execution.
3. Route to the domain owner or keep local if the work is small and directly answerable.
4. Apply review gates to external, destructive, financial, privacy-sensitive, or production-impacting actions.
5. Record task state changes and final receipts in the ledger.
6. Feed repeated failures into a learning/improvement log.
7. Escalate blocked tasks after the same blocker repeats rather than pretending progress exists.

## Outputs

- Classified task
- Review decision
- Routing receipt
- Learning-log item

## Validation

- No risky action proceeds without the right gate.
- Every routed task has a final receipt.
- Repeated blockers become visible system improvements.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
