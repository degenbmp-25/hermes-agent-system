---
name: "hermes-full-architecture-task-gate-review"
description: "Design a Hermes dual-mode operating architecture with chat mode, task-gated execution, domain-owner agents, review gates for risky work, and learning loops. Use for multi-agent systems that need task intake discipline and auditable completion."
---

# hermes-full-architecture-task-gate-review

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/jumperz/status/2055652189217923232

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Separate casual thinking from executable tasks so agents do not turn vague chat into unreviewed operations.

## Procedure

1. Define chat mode: freeform discussion, no task ledger changes unless explicitly promoted.
2. Define task mode: required fields for owner, target, deliverable, acceptance criteria, and risk level.
3. Reject or clarify tasks missing target, deliverable, or acceptance criteria.
4. Assign each domain to a named agent/profile with allowed tools and review expectations.
5. Create review gates for risky actions: external sends, payments, production config, destructive commands, or private-data exposure.
6. Log task transitions in a single ledger: backlog, routed, in progress, review, done, blocked.
7. After completion, capture lessons into a learning log or improvement queue.

## Outputs

- Task gate spec
- Domain ownership map
- Review-gate checklist
- Task ledger schema

## Validation

- A vague request is not executable until clarified.
- Risky tasks require review before action.
- Every done task has a receipt and acceptance result.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
