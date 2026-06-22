---
name: "discord-hermes-kanban-orchestration"
description: "Route plain-English Discord requests into a Hermes/OpenClaw Kanban task ledger and back to Discord with receipts. Use when Discord is the conversation surface but work needs durable task state, owner assignment, review, and completion tracking."
---

# discord-hermes-kanban-orchestration

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/jumperz/status/2054138264731218284

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Make Discord the interface and Kanban the source of truth, avoiding lost work in chat scrollback.

## Procedure

1. Define which Discord channels create tasks and which only allow discussion.
2. Parse each request into title, requester, target, deliverable, priority, owner, and acceptance criteria.
3. Create or update the Kanban card before starting non-trivial work.
4. Post short progress updates to Discord while preserving detailed state in the ledger.
5. Move cards through consistent states: inbox, routed, in progress, review, done, blocked.
6. For completion, post a concise receipt with artifacts, tests, and next actions.
7. Regularly reconcile Discord threads against Kanban to catch orphaned tasks.

## Outputs

- Task-card schema
- Routing rules
- Discord receipt format
- Reconciliation checklist

## Validation

- Every active task has exactly one ledger card.
- Discord status can be reconstructed from Kanban.
- Done cards include artifacts or a reason no artifact exists.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
