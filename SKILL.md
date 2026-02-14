---
name: peon_sounds
description: Play Warcraft III Peon sound effects through your Mac speaker. Audio feedback for task completion, errors, and more. Inspired by peonping.com.
metadata: {"clawdbot":{"emoji":"🐗","always":false,"requires":{"os":"darwin","bins":["afplay","curl"]}}}
---

# Peon Sounds 🐗

Play Warcraft III Peon voice lines through your Mac's speaker using `afplay`. Gives your agent audio presence — hear it working from across the room.

Inspired by [peon-ping](https://github.com/PeonPing/peon-ping).

## Setup

Run the install script to download sound files:

```bash
bash ~/.openclaw/workspace/skills/peon-sounds/install.sh
```

## When to Use

- **Only when explicitly asked** ("play a sound", "peon mode", "let me hear when you're done")
- **When someone says "let me know when you're done"** — play `complete` when the task finishes
- **On errors** if the user has opted into sounds for the session
- **DO NOT** auto-play on every heartbeat, message, or task. Respect the user's ears.

## Commands

```bash
PEON=~/.openclaw/workspace/skills/peon-sounds

# Greeting — "Ready to work?"
bash "$PEON/play.sh" greeting

# Task complete — random: "Work work" / "Okie dokie" / etc.
bash "$PEON/play.sh" complete

# Needs input — random: "Something need doing?" / "What you want?"
bash "$PEON/play.sh" permission

# Error — "Me not that kind of orc!"
bash "$PEON/play.sh" error

# Hype — Peon war cry
bash "$PEON/play.sh" warcry
```

## Sound Categories

| Category | When | Voice Lines |
|----------|------|-------------|
| `greeting` | Session start | "Ready to work?" |
| `complete` | Task finished | "Work work", "Okie dokie", "Be happy to", "I can do that" |
| `permission` | Waiting on user | "Something need doing?", "What you want?" |
| `error` | Something broke | "Me not that kind of orc!" |
| `warcry` | Hype / celebration | Peon war cry |

## Volume

Controlled by macOS system volume. Adjust with:
```bash
osascript -e 'set volume output volume 50'  # 0-100
```
