#!/bin/bash
# Play a sound from peon-ping's installed packs
# Usage: play.sh <cesp_category>
# Categories: session.start, task.acknowledge, task.complete, task.error, input.required, user.spam

PEON_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks/peon-ping"
CONFIG="$PEON_DIR/config.json"

if [ ! -f "$CONFIG" ]; then
  # Fallback to openpeon shared path
  PEON_DIR="$HOME/.openpeon"
  CONFIG="$PEON_DIR/config.json"
fi

if [ ! -f "$CONFIG" ]; then
  echo "peon-ping not installed. Run: brew install PeonPing/tap/peon-ping && peon-ping-setup" >&2
  exit 1
fi

CATEGORY="${1:-task.complete}"

# Map short aliases to CESP categories
case "$CATEGORY" in
  greeting|ready|start) CATEGORY="session.start" ;;
  complete|done) CATEGORY="task.complete" ;;
  acknowledge|ack) CATEGORY="task.acknowledge" ;;
  error|fail) CATEGORY="task.error" ;;
  permission|input|waiting) CATEGORY="input.required" ;;
  annoyed|spam) CATEGORY="user.spam" ;;
esac

# Pick and play a random sound from the category
FILE=$(python3 -c "
import json, random, os
peon_dir = '$PEON_DIR'
config = json.load(open('$CONFIG'))
pack = config.get('active_pack', 'peon')
pack_dir = os.path.join(peon_dir, 'packs', pack)
manifest_path = os.path.join(pack_dir, 'openpeon.json')
if not os.path.exists(manifest_path):
    manifest_path = os.path.join(pack_dir, 'manifest.json')
manifest = json.load(open(manifest_path))
sounds = manifest.get('categories', {}).get('$CATEGORY', {}).get('sounds', [])
if sounds:
    pick = random.choice(sounds)
    print(os.path.join(pack_dir, pick['file']))
" 2>/dev/null)

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
  VOL=$(python3 -c "import json;print(json.load(open('$CONFIG')).get('volume',0.5))" 2>/dev/null || echo "0.5")
  afplay -v "$VOL" "$FILE" &
else
  echo "No sounds found for category: $CATEGORY" >&2
  exit 1
fi
