# Hermes Vault Validation Tools

Validation tooling for source-backed agent memory vaults. Run these checks to ensure vault integrity, catch broken links, validate SOURCE-MANIFEST entries, and prevent secret leaks.

## Scripts

| Script | Purpose | Exit 0 | Exit 1 |
|--------|---------|--------|--------|
| `check-wikilinks.sh` | Find broken wikilinks | All links valid | Broken links found |
| `check-source-manifest.sh` | Validate SOURCE-MANIFEST | Manifest valid | Errors found |
| `check-secrets.sh` | Detect secret leaks | No secrets found | Secrets detected |
| `run-all.sh` | Run all checks | All checks pass | Any check fails |

## Quick Start

```bash
# Make scripts executable
chmod +x *.sh

# Run all checks
./run-all.sh

# Run individual checks
./check-wikilinks.sh
./check-source-manifest.sh check
./check-secrets.sh
```

## Usage

```bash
# All scripts accept an optional vault path as argument
# Default: current directory

./check-wikilinks.sh [vault-path]
./check-source-manifest.sh check|add|list-missing [vault-path]
./check-secrets.sh [vault-path]
./run-all.sh [vault-path]
```

## Prerequisites

- `bash` 4.0+
- `grep`, `sed`, `awk` (standard Unix tools)
- For `check-wikilinks.sh`: `find` and basic Unix tools
- For `check-secrets.sh`: no external dependencies (pure bash/regex)

## Validation Philosophy

These tools enforce three rules:

1. **Links must resolve** — Every wikilink should point to an existing file
2. **Sources must be tracked** — Every sourced note should be in SOURCE-MANIFEST
3. **Secrets must not leak** — API keys, tokens, passwords should never be in plain text

Run validation before every significant vault commit or memory compilation.

## Exit Codes

All scripts follow standard conventions:
- `0` = All checks passed
- `1` = Problems found (details printed to stdout)
- `2` = Usage error or file not found
