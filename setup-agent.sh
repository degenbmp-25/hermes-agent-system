#!/bin/bash
#
# hermes-agent-system / setup-agent.sh
# One-shot bootstrap for a new agent node.
#
# This installs only BeastmodeVault-authored runtime capabilities.
# X-derived research/reference notes in core/, multi-agent/, research/,
# integrations/, and architecture/ are intentionally not installed.
#
# Usage: ./setup-agent.sh [--skills-dir <path>] [--agent-system openclaw|hermes|auto]
#
set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR=""
AGENT_SYSTEM="auto"

# ── Args ──────────────────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --skills-dir) SKILLS_DIR="$2"; shift 2 ;;
    --agent-system) AGENT_SYSTEM="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# ── Detect Agent System ───────────────────────────────────────────────────────
detect_agent_system() {
  if [[ "$AGENT_SYSTEM" != "auto" ]]; then echo "$AGENT_SYSTEM"; return; fi

  if command -v openclaw &>/dev/null; then
    echo "openclaw"
  elif [[ -d "$HOME/.openclaw" ]]; then
    echo "openclaw"  # openclaw CLI not in PATH but config dir exists
  elif [[ -d "$HOME/Library/Application Support/openclaw" ]]; then
    echo "hermes"    # Mac-style path
  else
    echo "unknown"
  fi
}

# ── Detect Skills Directory ───────────────────────────────────────────────────
detect_skills_dir() {
  local system="$1"
  if [[ -n "$SKILLS_DIR" ]]; then return; fi

  case "$system" in
    openclaw)
      SKILLS_DIR="$HOME/.openclaw/skills"
      ;;
    hermes)
      SKILLS_DIR="$HOME/.openclaw/skills"
      ;;
    *)
      SKILLS_DIR="$HOME/.agent-skills"
      ;;
  esac
}

# ── Validate ──────────────────────────────────────────────────────────────────
validate() {
  if [[ ! -d "$AGENT_DIR/ops/hermes-vault-compiler" ]]; then
    echo "[ERROR] 'ops/hermes-vault-compiler/' not found. Run from the hermes-agent-system root."
    exit 1
  fi
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
  local system
  system=$(detect_agent_system)
  detect_skills_dir "$system"
  validate

  echo "═══════════════════════════════════════════"
  echo "  hermes-agent-system / setup-agent.sh"
  echo "═══════════════════════════════════════════"
  echo "  Agent system : $system"
  echo "  Skills dir   : $SKILLS_DIR"
  echo "  Source       : $AGENT_DIR"
  echo "═══════════════════════════════════════════"
  echo ""

  # Create skills directory if it doesn't exist
  mkdir -p "$SKILLS_DIR"

  echo "[1/2] Installing runtime skill..."
  cp -r "$AGENT_DIR/ops/hermes-vault-compiler" "$SKILLS_DIR/"

  echo "[2/2] Leaving reference notes uninstalled..."
  echo "      Read these manually when needed:"
  echo "      - core/hermes-agent-maturity-levels/SKILL.md"
  echo "      - multi-agent/hermes-multi-agent-team-profiles/SKILL.md"
  echo "      - multi-agent/hermes-operator-layer/SKILL.md"

  # Install sync script
  local bin_dir="$HOME/.local/bin"
  mkdir -p "$bin_dir"
  cp "$AGENT_DIR/sync.sh" "$bin_dir/hermes-sync.sh"
  chmod +x "$bin_dir/hermes-sync.sh"

  echo ""
  echo "✓ Done. Runtime skill installed to: $SKILLS_DIR/hermes-vault-compiler"
  echo "✓ Sync script installed to:  $bin_dir/hermes-sync.sh"
  echo "✓ Reference library left in repo, not runtime context"
  echo ""
  echo "Add to crontab for auto-sync:"
  echo "  crontab -e"
  echo "  # Pull every 6 hours:"
  echo "  0 */6 * * * $bin_dir/hermes-sync.sh >> ~/.logs/agent-sync.log 2>&1"
  echo ""
  echo "Or sync now:"
  echo "  $bin_dir/hermes-sync.sh"
}

main
