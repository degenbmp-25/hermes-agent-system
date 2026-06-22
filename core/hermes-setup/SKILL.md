---
name: "hermes-setup"
description: "Bootstrap or audit a Hermes/OpenClaw agent environment with memory files, skill directory, vault path, sync script, provider configuration, and validation. Use when setting up a new machine, Mac Hermes node, or client agent install."
---

# hermes-setup

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/gregisenberg/status/2046310954351358378

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Provide a real setup workflow instead of a commentary summary about agent setup.

## Procedure

1. Identify platform, shell, home directory, existing Hermes/OpenClaw config, and target vault path.
2. Inspect before changing: list existing config, skills directory, memory files, schedulers, and sync scripts.
3. Create missing directories only after confirming target paths.
4. Install only authored skills or explicitly approved third-party skills. Do not bulk-install research notes.
5. Create or verify memory files: SOUL, USER, MEMORY, and daily log policy as appropriate for the runtime.
6. Configure provider credentials by checking presence only; never echo values.
7. Install sync/validation scripts and run a smoke test.
8. Write a setup receipt with paths, installed skills, skipped items, and follow-up risks.

## Outputs

- Setup receipt
- Installed-skill list
- Validation results
- Follow-up checklist

## Validation

- A fresh shell can run the installed command/scripts.
- No existing config is overwritten without backup/merge.
- The setup receipt names exact paths.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
