# Hermes Skill Library — Quick Import Reference

This repository contains BeastmodeVault-authored runtime skills derived from sourced research.

Source links are provenance. The installed skill bodies are authored procedures with outputs and validation.

## Install Everything

```bash
HERMES_SKILLS=~/.openclaw/workspace/skills
LIBRARY=~/BeastmodeVault/vaults/hermes-agent-system

cd "$LIBRARY"
./setup-agent.sh --skills-dir "$HERMES_SKILLS"
```

## Install One Category

```bash
cp -r "$LIBRARY/core"/* "$HERMES_SKILLS/"
cp -r "$LIBRARY/multi-agent"/* "$HERMES_SKILLS/"
cp -r "$LIBRARY/ops"/* "$HERMES_SKILLS/"
```

## Start Here

1. `hermes-agent-maturity-levels`
2. `hermes-multi-agent-team-profiles`
3. `hermes-operator-layer`
4. `hermes-vault-compiler`

## Validate Repository

```bash
./_tools/run-all.sh
git diff --check
```
