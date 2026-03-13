#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

patterns=(
  '/Users/'
  'https://[^[:space:]]*my\\.feishu\\.cn/'
  'api[_-]?key'
  'app_secret'
  'tenant_access_token'
  'ghp_[A-Za-z0-9]+'
  'github_pat_[A-Za-z0-9_]+'
  'sk-[A-Za-z0-9]+'
  'Bearer[[:space:]]+[A-Za-z0-9._-]+'
)

failed=0
for pattern in "${patterns[@]}"; do
  if rg -n -i --pcre2 "$pattern" . --glob '!scripts/check-sensitive.sh'; then
    echo "Found sensitive pattern: $pattern" >&2
    failed=1
  fi
done

if [[ $failed -eq 0 ]]; then
  echo "No obvious sensitive content found."
else
  exit 1
fi
