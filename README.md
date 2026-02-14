# peon-sounds 🐗

Warcraft III Peon voice lines for your OpenClaw agent. Audio feedback through your Mac speaker — hear your agent working from across the room.

Inspired by [peon-ping](https://peonping.com).

## Install

```bash
openclaw skills install peon-sounds
# or via ClawHub
npx clawhub install peon-sounds
```

Then run setup:
```bash
bash ~/.openclaw/workspace/skills/peon-sounds/install.sh
```

## Usage

Tell your agent:
- *"Play a peon sound"*
- *"Let me know when you're done"* → plays completion sound
- *"Peon mode"* → sounds for the whole session

## Sounds

| Category | Voice Lines |
|----------|-------------|
| Greeting | "Ready to work?" |
| Complete | "Work work", "Okie dokie", "Be happy to", "I can do that" |
| Permission | "Something need doing?", "What you want?" |
| Error | "Me not that kind of orc!" |
| Warcry | Peon war cry |

## Requirements

- macOS (uses `afplay`)
- Speaker or audio output

## License

MIT. Sound files are property of Blizzard Entertainment.
