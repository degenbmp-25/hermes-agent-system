#!/bin/bash
#
# hermes-agent-system / pull-from-repo.sh
# Pull the entire agent system from GitHub without cloning locally first.
# Works on any machine (PC, Mac, Linux) with just curl/bash.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/degenbmp-25/hermes-agent-system/main/pull-from-repo.sh | bash
#   # OR
#   ./pull-from-repo.sh --repo https://github.com/degenbmp-25/hermes-agent-system --skills-dir ~/.openclaw/skills
#
set -e

REPO="https://github.com/degenbmp-25/hermes-agent-system"
BRANCH="main"
SKILLS_DIR=""
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# ── Args ──────────────────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --repo) REPO="$2"; shift 2 ;;
    --branch) BRANCH="$2"; shift 2 ;;
    --skills-dir) SKILLS_DIR="$2"; shift 2 ;;
    *) echo "Unknown: $1"; exit 1 ;;
  esac
done

# ── Detect skills dir ─────────────────────────────────────────────────────────
detect_skills_dir() {
  if [[ -n "$SKILLS_DIR" ]]; then return; fi
  if [[ -d "$HOME/.openclaw/skills" ]]; then
    SKILLS_DIR="$HOME/.openclaw/skills"
  elif [[ -d "$HOME/Library/Application Support/openclaw/skills" ]]; then
    SKILLS_DIR="$HOME/Library/Application Support/openclaw/skills"
  else
    SKILLS_DIR="$HOME/.agent-skills"
  fi
}

# ── Download + extract repo archive ──────────────────────────────────────────
download_repo() {
  echo "[pull] Downloading $REPO (branch: $BRANCH)..."
  local archive_url="$REPO/archive/refs/heads/$BRANCH.tar.gz"
  curl -fsSL "$archive_url" -o "$TEMP_DIR/repo.tar.gz"
  tar -xzf "$TEMP_DIR/repo.tar.gz -C $TEMP_DIR"
}

# ── Install ───────────────────────────────────────────────────────────────────
install() {
  detect_skills_dir
  local source_dir="$TEMP_DIR/hermes-agent-system-$BRANCH"

  mkdir -p "$SKILLS_DIR"

  echo "[pull] Skills directory: $SKILLS_DIR"
  echo "[pull] Installing skills..."

  for category in core multi-agent research ops integrations architecture; do
    if [[ -d "$source_dir/$category" ]]; then
      cp -r "$source_dir/$category/"* "$SKILLS_DIR/"
      echo "  ✓ $category/"
    fi
  done

  # Make scripts executable
  chmod +x "$source_dir/setup-agent.sh" 2>/dev/null || true
  chmod +x "$source_dir/sync.sh" 2>/dev/null || true

  echo ""
  echo "✓ Done. Skills installed to: $SKILLS_DIR"
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
  echo "═══════════════════════════════════════"
  echo "  pull-from-repo.sh"
  echo "  Repo: $REPO"
  echo "═══════════════════════════════════════"
  download_repo
  install
  echo ""
  echo "✓ Pull complete: $(date)"
}

main
