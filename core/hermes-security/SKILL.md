---
name: "hermes-security"
description: "Security-audit a Hermes/OpenClaw installation, skill library, vault, or agent workflow. Use before installing skills, enabling external actions, exposing webhooks, syncing memory, or granting filesystem/network access."
---

# hermes-security

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/agentskills_ai/status/2054896845646663901

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Make security review an operational workflow rather than a vague warning.

## Procedure

1. Map trust boundaries: local files, memory, tools, external APIs, messaging surfaces, schedulers, and public endpoints.
2. Search for secrets with existing validation tools first; never print secret values.
3. Review skills for external actions, destructive commands, network calls, credential handling, and public posting/sending.
4. Check memory files for private data that could leak into shared channels or client contexts.
5. Inspect schedulers and background workers for owner, cadence, command, output channel, and rollback path.
6. Require explicit approval gates for emails, posts, public messages, destructive commands, and production config changes.
7. Produce findings ordered by severity with exact file paths and remediation steps.

## Outputs

- Security findings
- Approval-gate checklist
- Remediation plan

## Validation

- Findings include file/path evidence.
- Secrets are redacted.
- External-action rules are explicit enough for a future agent to follow.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
