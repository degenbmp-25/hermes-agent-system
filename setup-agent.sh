#!/bin/bash
#
# hermes-agent-system / setup-agent.sh
# One-shot bootstrap for a new agent node
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
  if [[ ! -d "$AGENT_DIR/core" ]]; then
    echo "[ERROR] 'core/' directory not found. Run from the hermes-agent-system root."
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

  # Install skills by category
  echo "[1/5] Installing core skills..."
  [[ -d "$AGENT_DIR/core" ]] && cp -r "$AGENT_DIR/core/"* "$SKILLS_DIR/"

  echo "[2/5] Installing multi-agent skills..."
  [[ -d "$AGENT_DIR/multi-agent" ]] && cp -r "$AGENT_DIR/multi-agent/"* "$SKILLS_DIR/"

  echo "[3/5] Installing research skills..."
  [[ -d "$AGENT_DIR/research" ]] && cp -r "$AGENT_DIR/research/"* "$SKILLS_DIR/"

  echo "[4/5] Installing ops & integrations..."
  [[ -d "$AGENT_DIR/ops" ]] && cp -r "$AGENT_DIR/ops/"* "$SKILLS_DIR/"
  [[ -d "$AGENT_DIR/integrations" ]] && cp -r "$AGENT_DIR/integrations/"* "$SKILLS_DIR/"

  echo "[5/5] Installing architecture references..."
  [[ -d "$AGENT_DIR/architecture" ]] && cp -r "$AGENT_DIR/architecture/"* "$SKILLS_DIR/"

  # Install sync script
  local bin_dir="$HOME/.local/bin"
  mkdir -p "$bin_dir"
  cp "$AGENT_DIR/sync.sh" "$bin_dir/hermes-sync.sh"
  chmod +x "$bin_dir/hermes-sync.sh"

  echo ""
  echo "✓ Done. Skills installed to: $SKILLS_DIR"
  echo "✓ Sync script installed to:  $bin_dir/hermes-sync.sh"
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
