#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="auto"
SKILL_NAME="product-review"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
CLAUDE_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --target=*)
      TARGET="${1#*=}"
      shift 1
      ;;
    --name)
      SKILL_NAME="$2"
      shift 2
      ;;
    --name=*)
      SKILL_NAME="${1#*=}"
      shift 1
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

copy_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  rm -rf "$dst"
  cp -R "$src" "$dst"
}

install_codex() {
  copy_dir "$ROOT_DIR/codex/product-review" "$CODEX_DIR/$SKILL_NAME"
  echo "Installed Codex skill to: $CODEX_DIR/$SKILL_NAME"
}

install_claude() {
  copy_dir "$ROOT_DIR/claude-code/product-review" "$CLAUDE_DIR/$SKILL_NAME"
  echo "Installed Claude Code skill to: $CLAUDE_DIR/$SKILL_NAME"
}

case "$TARGET" in
  auto)
    installed_any=false
    if [[ -d "${CODEX_HOME:-$HOME/.codex}" || -n "${CODEX_HOME:-}" ]]; then
      install_codex
      installed_any=true
    fi
    if [[ -d "$HOME/.claude" || -n "${CLAUDE_SKILLS_DIR:-}" ]]; then
      install_claude
      installed_any=true
    fi
    if [[ "$installed_any" == false ]]; then
      echo "No known target home found. Use --target codex|claude|all" >&2
      exit 1
    fi
    ;;
  codex)
    install_codex
    ;;
  claude)
    install_claude
    ;;
  all)
    install_codex
    install_claude
    ;;
  *)
    echo "Unsupported target: $TARGET" >&2
    exit 1
    ;;
esac

echo "Done."
