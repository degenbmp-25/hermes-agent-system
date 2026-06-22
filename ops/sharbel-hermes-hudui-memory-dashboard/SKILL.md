---
name: "sharbel-hermes-hudui-memory-dashboard"
description: "Set up or audit a Hermes memory dashboard workflow for observing active memory, current goals, session history, and corruption/drift indicators. Use when debugging persistent memory behavior or proving agent state to an operator."
---

# sharbel-hermes-hudui-memory-dashboard

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/sharbel/status/2042519782688211079

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Give operators visibility into what an agent remembers and why it is behaving a certain way.

## Procedure

1. Identify the dashboard/tool actually available in the environment before giving install advice.
2. Map memory sources: runtime memory, long-term files, session database, daily logs, and project vaults.
3. Connect the dashboard or inspection commands with read-only defaults first.
4. Create a memory health checklist: stale facts, contradictions, oversized hot memory, private data leakage, and missing provenance.
5. When debugging behavior, compare active memory against source files and recent sessions.
6. Record findings as memory fixes, not just dashboard observations.
7. Schedule periodic review only if the dashboard has proven signal.

## Outputs

- Memory source map
- Dashboard/read-only setup notes
- Memory health report

## Validation

- The operator can trace a behavior to active memory or prove memory is not the cause.
- Findings include exact memory/file locations.
- Private memory is not exposed to unauthorized surfaces.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
