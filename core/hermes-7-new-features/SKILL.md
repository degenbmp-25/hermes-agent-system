---
name: "hermes-7-new-features"
description: "Audit a Hermes installation for May 2026 feature readiness: session logging, background tasks, provider/OAuth support, social posting/fetching, Codex CLI handoff, media generation, and Auto Kanban task breakdown."
---

# hermes-7-new-features

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/alexfinn/status/2057472125909479770

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Convert a feature-announcement note into an actionable readiness checklist for a Hermes node.

## Procedure

1. List the seven feature areas and mark each as available, missing, unknown, or intentionally disabled.
2. Verify each feature with the local CLI or documented tool list before claiming it exists.
3. For session logging, confirm sessions can be searched by date or transcript query.
4. For background tasks, run a harmless test task or inspect configuration that enables async work.
5. For provider/OAuth/social/media features, check credentials are configured without exposing secrets.
6. For Codex CLI handoff, verify the command path and working directory conventions.
7. For Auto Kanban, confirm where tasks are stored and how status transitions are represented.
8. Produce an upgrade plan with only the missing features that matter for the current operator.

## Outputs

- Feature readiness matrix
- Credential/config gaps
- Minimal upgrade plan

## Validation

- Every available/missing claim cites a command result, config file, or local documentation.
- No secret values are printed.
- The upgrade plan omits features unrelated to the operator goal.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
