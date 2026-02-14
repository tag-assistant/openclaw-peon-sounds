#!/bin/bash
# Install peon sound files from the peon-ping GitHub repo
set -e

SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUND_DIR="$SKILL_DIR/sounds"
REPO_BASE="https://raw.githubusercontent.com/PeonPing/peon-ping/main/docs/audio"

mkdir -p "$SOUND_DIR"

echo "🐗 Downloading Peon sounds..."

FILES=(
  "PeonReady1.ogg:ready.ogg"
  "PeonYes1.ogg:acknowledge1.ogg"
  "PeonYes2.ogg:acknowledge2.ogg"
  "PeonYes3.ogg:acknowledge3.ogg"
  "PeonYes4.ogg:acknowledge4.ogg"
  "PeonWhat1.ogg:permission1.ogg"
  "PeonWhat3.ogg:permission2.ogg"
  "PeonWhat4.ogg:permission3.ogg"
  "PeonAngry1.ogg:error1.ogg"
  "PeonAngry4.ogg:error2.ogg"
  "PeonWarcry1.ogg:warcry.ogg"
)

for entry in "${FILES[@]}"; do
  SRC="${entry%%:*}"
  DST="${entry##*:}"
  if [ ! -f "$SOUND_DIR/$DST" ]; then
    curl -fsSL "$REPO_BASE/$SRC" -o "$SOUND_DIR/$DST"
    echo "  ✓ $DST"
  else
    echo "  • $DST (exists)"
  fi
done

echo "✅ Peon sounds installed to $SOUND_DIR"
