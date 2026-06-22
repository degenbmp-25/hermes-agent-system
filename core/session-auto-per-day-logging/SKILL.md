---
name: "session-auto-per-day-logging"
description: "Design and operate daily session logging for Hermes/OpenClaw work. Use when the user wants date-based recall, session receipts, daily logs, or the ability to answer what happened on a specific day."
---

# session-auto-per-day-logging

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/alexfinn/status/2057472125909479770

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Make session history durable and queryable by day without dumping everything into long-term memory.

## Procedure

1. Choose the daily log root, usually `memory/YYYY-MM-DD.md` inside the active vault/workspace.
2. Define what must be logged: decisions, commands, files changed, links, blockers, and follow-ups.
3. Keep raw daily notes separate from curated long-term memory.
4. At session end or after major milestones, append a short receipt to today's log.
5. When asked about a date, search the daily log first, then session transcripts if needed.
6. Promote only stable, reusable facts to long-term memory after review.
7. Audit logs weekly for missing receipts and overstuffed personal data.

## Outputs

- Daily log format
- Session receipt
- Promotion candidates for long-term memory

## Validation

- A date query can be answered from the daily file without relying on chat context.
- Long-term memory contains distilled facts, not raw transcripts.
- Private/client data is scoped to the right vault.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
