---
name: "hermes-vault-compiler"
description: "Create, validate, and maintain source-backed agent memory vaults with SOURCE-MANIFEST discipline, structured People/Decision/Context Pack notes, wikilink checks, and secret scanning. Use when starting or auditing a Hermes/OpenClaw knowledge vault."
---

# hermes-vault-compiler

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://github.com/degenbmp-25/hermes-agent-system

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Keep agent memory auditable, source-backed, and safe instead of letting a vault become a rumor pile.

## Procedure

1. Create the vault structure required for the project: people, decisions, context packs, references, projects, and memory logs as needed.
2. Copy or adapt templates from this repository's `templates/` directory.
3. Maintain `SOURCE-MANIFEST.md` for source-backed notes.
4. Before writing a durable factual note, capture source, date, confidence, and last validated date.
5. Run `_tools/run-all.sh <vault-path>` before major commits or imports.
6. Fix broken wikilinks, missing manifest entries, and secret-scan warnings before treating the vault as trustworthy.
7. Promote daily/raw notes into curated context packs only after review.

## Outputs

- Validated vault structure
- SOURCE-MANIFEST entries
- Validation report
- Curated context packs

## Validation

- `_tools/run-all.sh` passes or failures are documented.
- Source-backed notes have manifest entries.
- No secrets are committed into the vault.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
