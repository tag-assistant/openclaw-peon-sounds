---
name: peon_sounds
description: Play sound effects through the speaker using peon-ping (peonping.com). Audio feedback for task completion, errors, and more. Supports 57+ sound packs.
metadata: {"clawdbot":{"emoji":"🐗","always":false,"requires":{"os":"darwin","bins":["afplay","peon"]}}}
---

# Peon Sounds 🐗

Play game character voice lines through the Mac speaker using [peon-ping](https://peonping.com). 57+ sound packs (Warcraft, StarCraft, Portal, TF2, and more).

## Setup

```bash
brew install PeonPing/tap/peon-ping
peon-ping-setup
```

## When to Use

- **Only when explicitly asked** ("play a sound", "peon mode", "let me hear when you're done")
- **When someone says "let me know when you're done"** — play a `task.complete` sound when finished
- **On errors** if the user has opted into sounds for the session
- **DO NOT** auto-play on every heartbeat, message, or task. Respect the user's ears.

## Playing a Sound

Play a random sound from a CESP category:

```bash
# Pick a random sound from a category and play it
PEON_PACKS="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks/peon-ping/packs"
PACK=$(cat "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks/peon-ping/config.json" | python3 -c "import sys,json;print(json.load(sys.stdin).get('active_pack','peon'))")
CATEGORY="task.complete"  # change as needed

# Get a random sound file from the category
FILE=$(python3 -c "
import json, random, os
pack_dir = os.path.expanduser('$PEON_PACKS/$PACK')
manifest = json.load(open(os.path.join(pack_dir, 'openpeon.json')))
sounds = manifest.get('categories',{}).get('$CATEGORY',{}).get('sounds',[])
if sounds:
    pick = random.choice(sounds)
    print(os.path.join(pack_dir, pick['file']))
")
[ -n "$FILE" ] && afplay "$FILE" &
```

## CESP Categories

| Category | When | Example |
|----------|------|---------|
| `session.start` | Session begins | "Ready to work?" |
| `task.acknowledge` | Starting a task | "Work, work." |
| `task.complete` | Task finished | "Job's done!" |
| `task.error` | Something failed | "Me not that kind of orc!" |
| `input.required` | Waiting on user | "Something need doing?" |
| `user.spam` | Annoyed | "Me busy, leave me alone!" |

## Pack Management

```bash
peon packs list          # List installed packs
peon packs use <name>    # Switch active pack
peon preview task.complete  # Preview all sounds in a category
peon status              # Check status
```

## Volume

```bash
# Adjust in peon config
peon config volume 0.3   # 0.0 - 1.0
# Or system-wide
osascript -e 'set volume output volume 50'  # 0-100
```

## Credits

Powered by [peon-ping](https://github.com/PeonPing/peon-ping) and the [CESP spec](https://github.com/PeonPing/openpeon).
