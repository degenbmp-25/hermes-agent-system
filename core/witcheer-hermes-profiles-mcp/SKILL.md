---
name: "witcheer-hermes-profiles-mcp"
description: "Plan Hermes profile isolation and MCP server exposure. Use when creating separate configs/memory/sessions/skills per role or exposing Hermes context to MCP clients such as IDEs or desktop tools."
---

# witcheer-hermes-profiles-mcp

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/witcheer/status/2038690294074310976

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Use profiles as isolation boundaries and MCP as controlled interop, not as novelty agent skins.

## Procedure

1. List roles that need isolated memory or permissions. Avoid creating profiles for temporary moods.
2. For each profile, define config path, memory path, skill set, allowed tools, and owner.
3. Separate secrets and provider settings by profile when roles have different risk levels.
4. Document handoff rules between profiles and whether shared vault files are allowed.
5. Before enabling MCP server mode, identify clients, exposed resources, and read/write boundaries.
6. Run a local smoke test for each profile and MCP client.
7. Create a profile registry with paths, purpose, and decommission criteria.

## Outputs

- Profile registry
- MCP exposure map
- Isolation checklist

## Validation

- Profiles can start independently.
- A profile cannot accidentally read another profile's private memory unless explicitly allowed.
- MCP clients expose only intended resources.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
