#!/usr/bin/env bash
# Appends every static/*.jpg as a markdown image + filename to README.md
# Run from the repo root (where README.md and static/ live).

set -euo pipefail

STATIC_DIR="static"
README="README.md"

if [ ! -d "$STATIC_DIR" ]; then
  echo "Error: $STATIC_DIR directory not found. Run this from the repo root." >&2
  exit 1
fi

{
  echo "# Graffiti of HOBEKI?"
  echo ""
  for f in "$STATIC_DIR"/*.jpg; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    echo "<p align=\"center\">"
    echo "  <img src=\"$f\" width=\"800\"><br>"
    echo "  <sub>$name</sub>"
    echo "</p>"
    echo ""
  done
} >>"$README"

echo "Done. Appended images to $README"
