#!/usr/bin/env bash
set -euo pipefail

# Only generate platforms that are missing to avoid overwriting native code
MISSING=()
[ ! -d android ] && MISSING+=("android")
[ ! -d ios ] && MISSING+=("ios")
[ ! -d web ] && MISSING+=("web")

if [ ${#MISSING[@]} -eq 0 ]; then
  echo "All platforms present — nothing to do."
  exit 0
fi

echo "Generating missing Flutter platform(s): ${MISSING[*]}"
# Generate only the missing platforms. This will add platform scaffolding without overwriting existing native code.
flutter create --platforms=$(IFS=,; echo "${MISSING[*]}") .

echo "Platform generation complete."
