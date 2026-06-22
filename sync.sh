#!/bin/bash
#
# hermes-agent-system / sync.sh
# Pull latest from GitHub and install new/updated skills
#
# Usage: ./sync.sh [--branch main]
#
set -e

# Vault location (canonical local copy)
AGENT_DIR="$HOME/BeastmodeVault/vaults/hermes-agent-system"
BRANCH="${1:-main}"
SKILLS_DIR=""

# ── Detect skills dir (same logic as setup) ──────────────────────────────────
detect_skills_dir() {
  if [[ -d "$HOME/.openclaw/skills" ]]; then
    SKILLS_DIR="$HOME/.openclaw/skills"
  elif [[ -d "$HOME/Library/Application Support/openclaw/skills" ]]; then
    SKILLS_DIR="$HOME/Library/Application Support/openclaw/skills"
  else
    SKILLS_DIR="$HOME/.agent-skills"
  fi
}

# ── Git pull or clone ─────────────────────────────────────────────────────────
sync_repo() {
  if [[ -d "$AGENT_DIR/.git" ]]; then
    echo "[sync] Pulling latest from GitHub..."
    git -C "$AGENT_DIR" checkout "$BRANCH" 2>/dev/null || true
    git -C "$AGENT_DIR" pull origin "$BRANCH"
  else
    echo "[sync] No git found, skipping pull (or run setup-agent.sh first)"
  fi
}

# ── Copy new/updated skills ───────────────────────────────────────────────────
install_skills() {
  detect_skills_dir
  echo "[sync] Skills dir: $SKILLS_DIR"
  mkdir -p "$SKILLS_DIR"

  echo "[sync] Installing updated skills..."
  for category in core multi-agent research ops integrations architecture; do
    if [[ -d "$AGENT_DIR/$category" ]]; then
      cp -r "$AGENT_DIR/$category/"* "$SKILLS_DIR/"
      echo "  ✓ $category/"
    fi
  done
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
  echo "═══════════════════════════════════════"
  echo "  hermes-agent-system / sync.sh"
  echo "═══════════════════════════════════════"
  sync_repo
  install_skills
  echo "✓ Sync complete: $(date)"
}

main
