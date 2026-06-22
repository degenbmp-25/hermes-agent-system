---
name: "hermes-multi-agent-team-profiles"
description: "Build a Hermes multi-agent team using isolated profiles and clear role boundaries. Use when creating orchestrator, researcher, writer, engineer, operator, or client-specific agents with separate memory, skills, and handoff contracts."
---

# hermes-multi-agent-team-profiles

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/neoaiforecast/status/2043455838459920718

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Create a small effective agent team where specialization improves work quality instead of multiplying confusion.

## Procedure

1. Start with one orchestrator and one specialist. Add more only after the first handoff works.
2. Define each profile by job, not personality: mission, inputs, outputs, tools, memory scope, and refusal boundaries.
3. Write shared mission context once in a common workspace file; keep role-specific context in each profile.
4. Create a handoff contract for each specialist: when to call, what to send, what must come back.
5. Run a pilot task through the orchestrator and specialist before adding another role.
6. Measure quality, latency, and handoff clarity. Remove or merge roles that do not improve outcomes.
7. Document the team in `team-agents.md` or equivalent.

## Outputs

- Team profile plan
- SOUL/AGENTS context drafts
- Handoff contracts
- Pilot-task receipt

## Validation

- Each role has non-overlapping ownership.
- The orchestrator can explain why a task goes to one role.
- Specialists return outputs in the agreed format.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
