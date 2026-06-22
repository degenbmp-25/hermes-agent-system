#!/bin/bash
#
# hermes-agent-system / setup-agent.sh
# One-shot bootstrap for a new agent node.
#
# This installs the BeastmodeVault-authored Hermes skill library. Source links
# in the skills are provenance, not copied blog excerpts.
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
  if [[ ! -d "$AGENT_DIR/core" || ! -d "$AGENT_DIR/ops" ]]; then
    echo "[ERROR] skill category directories not found. Run from the hermes-agent-system root."
    exit 1
  fi
}

install_category() {
  local label="$1"
  local dir="$2"

  if [[ ! -d "$dir" ]]; then
    return
  fi

  echo "Installing $label skills..."
  for skill_dir in "$dir"/*; do
    if [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]]; then
      cp -r "$skill_dir" "$SKILLS_DIR/"
    fi
  done
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

  echo "[1/1] Installing authored skills..."
  install_category "architecture" "$AGENT_DIR/architecture"
  install_category "core" "$AGENT_DIR/core"
  install_category "integrations" "$AGENT_DIR/integrations"
  install_category "multi-agent" "$AGENT_DIR/multi-agent"
  install_category "ops" "$AGENT_DIR/ops"
  install_category "research" "$AGENT_DIR/research"
  install_category "seo" "$AGENT_DIR/seo"

  # Install sync script
  local bin_dir="$HOME/.local/bin"
  mkdir -p "$bin_dir"
  cp "$AGENT_DIR/sync.sh" "$bin_dir/hermes-sync.sh"
  chmod +x "$bin_dir/hermes-sync.sh"

  echo ""
  echo "✓ Done. Authored skills installed to: $SKILLS_DIR"
  echo "✓ Sync script installed to:  $bin_dir/hermes-sync.sh"
  echo "✓ Source links retained as provenance inside each skill"
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
